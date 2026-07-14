import 'package:flutter/material.dart';
import '../data/gods_data.dart';
import '../models/god_model.dart';
import '../services/onboarding_service.dart';
import '../services/bookmark_service.dart';
import '../services/settings_service.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
import '../widgets/god_card.dart';
import 'main_shell.dart';

// ─── Palette ─────────────────────────────────────────────────
const _bgTop = Color(0xFF1A140A); // warm, dark
const _bgBottom = Color(0xFF080808);
const _gold = Color(0xFFC9A227);
const _cta = Color(0xFFF2B01E); // bright amber CTA (matches reference)
const _tileBg = Color(0xFF1B1B1B);
const _tileBorder = Color(0xFF333333);
const _muted = Color(0xFF9E9E9E);

// ─── Simple option (interest / rhythm / reminders) ───────────
class _Opt {
  final String value;
  final String label;
  final String? sub;
  const _Opt(this.value, this.label, {this.sub});
}

const _interests = <_Opt>[
  _Opt('battles', 'Great Battles and Legends'),
  _Opt('powers', 'Gods, Powers, and Symbols'),
  _Opt('meanings', 'Meanings Behind the Stories'),
  _Opt('surprise', 'Surprise Me'),
];

const _rhythms = <_Opt>[
  _Opt('Daily', 'Daily'),
  _Opt('A Few Times a Week', 'A Few Times a Week'),
  _Opt('When I Have Time', 'When I Have Time'),
];

const _reminderOpts = <_Opt>[
  _Opt('yes', 'Enable daily reminders',
      sub: 'A gentle nudge to read a new myth each day.'),
  _Opt('no', 'Maybe later',
      sub: 'You can switch this on anytime in Profile.'),
];

// The six realms, shown as image cards just like the Discover feed.
const _realms = <({String key, String image})>[
  (key: 'Greek', image: 'assets/images/greek.jpg'),
  (key: 'Egyptian', image: 'assets/images/egypt.jpg'),
  (key: 'Nordic', image: 'assets/images/nordik.jpg'),
  (key: 'Hindu', image: 'assets/images/hindu.jpg'),
  (key: 'Chinese', image: 'assets/images/cina.jpg'),
  (key: 'Japanese', image: 'assets/images/japanese.jpg'),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _pageCount = 7;
  final _controller = PageController();
  int _index = 0;

  String? _realm; // chosen pantheon
  String? _godId; // chosen iconic god
  String? _interest;
  String? _rhythm;
  String? _remind; // 'yes' / 'no'
  bool _finishing = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // The most iconic gods of a realm (data is ordered by prominence).
  List<God> _iconicGods(String realm) => godsData
      .where((g) => g.mythology == realm && g.category != 'Cosmology')
      .take(6)
      .toList();

  God? get _chosenGod {
    if (_godId == null) return null;
    for (final g in godsData) {
      if (g.id == _godId) return g;
    }
    return null;
  }

  bool get _canContinue {
    switch (_index) {
      case 1:
        return _realm != null;
      case 2:
        return _godId != null;
      case 3:
        return _interest != null;
      case 4:
        return _rhythm != null;
      case 5:
        return _remind != null;
      default:
        return true; // welcome, ready
    }
  }

  void _next() {
    SoundService.playClick();
    if (_index >= _pageCount - 1) {
      _finish();
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeInOutCubic,
    );
  }

  void _back() {
    SoundService.playClick();
    _controller.previousPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _finish() async {
    if (_finishing) return;
    _finishing = true;
    final god = _chosenGod;

    // Favorite the chosen god (in-memory + persisted).
    if (god != null) {
      god.isBookmarked = true;
      final ids = await BookmarkService.load();
      ids.add(god.id);
      await BookmarkService.save(ids);
    }

    // Reminder opt-in → daily-reminder preference.
    await SettingsService.setDailyReminders(_remind == 'yes');

    await OnboardingService.complete(
      patronGodId: god?.id ?? '',
      pantheon: _realm ?? '',
      rhythm: _rhythm ?? 'When I Have Time',
    );

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MainShell(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgBottom,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_bgTop, _bgBottom],
            stops: [0.0, 0.55],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Welcome hero backdrop (dewa.jpg) — fades out after the first page.
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 450),
                  opacity: _index == 0 ? 1.0 : 0.0,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/dewa.jpg',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                      ),
                      // Scrim over the image so the text stays readable.
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.0, 0.45, 1.0],
                            colors: [
                              Colors.black.withValues(alpha: 0.45),
                              Colors.black.withValues(alpha: 0.35),
                              Colors.black.withValues(alpha: 0.90),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  // Progress bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        for (int i = 0; i < _pageCount; i++) ...[
                          Expanded(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              height: 4,
                              decoration: BoxDecoration(
                                color: i <= _index
                                    ? _gold
                                    : const Color(0xFF3A3A3A),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          if (i < _pageCount - 1) const SizedBox(width: 6),
                        ],
                      ],
                    ),
                  ),
                  // Back arrow row
                  SizedBox(
                    height: 48,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _index == 0
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: IconButton(
                                onPressed: _back,
                                icon: const Icon(Icons.arrow_back_rounded,
                                    color: Colors.white),
                              ),
                            ),
                    ),
                  ),
                  // Pages
                  Expanded(
                    child: PageView(
                      controller: _controller,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (i) => setState(() => _index = i),
                      children: [
                        _welcomePage(),
                        _realmPage(),
                        _godPage(),
                        _choicePage(
                          title: 'What Pulls You Into\nMythology Most?',
                          subtitle: 'We’ll shape your archive around it.',
                          options: _interests,
                          groupValue: _interest,
                          onPick: (v) => setState(() => _interest = v),
                        ),
                        _choicePage(
                          title: 'Choose Your\nMythology Rhythm',
                          subtitle: 'Your archive will update around this pace.',
                          options: _rhythms,
                          groupValue: _rhythm,
                          onPick: (v) => setState(() => _rhythm = v),
                        ),
                        _choicePage(
                          title: 'Never Miss a Legend',
                          subtitle: 'Stay close to the myths that move you.',
                          options: _reminderOpts,
                          groupValue: _remind,
                          onPick: (v) => setState(() => _remind = v),
                        ),
                        _readyPage(),
                      ],
                    ),
                  ),
                  // Continue button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _canContinue ? _next : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _cta,
                          disabledBackgroundColor: const Color(0xFF2A2A2A),
                          foregroundColor: Colors.black,
                          disabledForegroundColor: const Color(0xFF666666),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text(
                          _index == _pageCount - 1
                              ? 'Enter Mytharium'
                              : 'Continue',
                          style: const TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Page 1: Welcome ──
  Widget _welcomePage() {
    const titleShadow = [
      Shadow(color: Colors.black, blurRadius: 18, offset: Offset(0, 3)),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Text(
            'MYTHARIUM',
            style: AppFonts.cinzel(
              color: _gold,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 8,
              shadows: titleShadow,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'The gods are watching.\nLet’s find yours.',
            textAlign: TextAlign.center,
            style: AppFonts.cinzel(
              color: Colors.white,
              fontSize: 31,
              fontWeight: FontWeight.w700,
              height: 1.25,
              shadows: titleShadow,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Pick your realm and your patron god, and we’ll build a discovery feed made just for you.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.55,
              shadows: [Shadow(color: Colors.black, blurRadius: 12)],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  // ── Page 2: Choose Your Realm ──
  Widget _realmPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose Your Realm',
            style: TextStyle(
              color: Colors.white,
              fontSize: 29,
              fontWeight: FontWeight.w800,
              height: 1.18,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Pick the pantheon that calls to you — your Discover feed will open on it.',
            textAlign: TextAlign.justify,
            style: TextStyle(color: _muted, fontSize: 15, height: 1.4),
          ),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.15,
            children: [for (final r in _realms) _realmCard(r)],
          ),
        ],
      ),
    );
  }

  Widget _realmCard(({String key, String image}) r) {
    final selected = _realm == r.key;
    final color = GodCard.mythologyColor(r.key);
    final count = godsData.where((g) => g.mythology == r.key).length;
    return GestureDetector(
      onTap: () {
        SoundService.playClick();
        setState(() {
          _realm = r.key;
          _godId = null; // reset the god when the realm changes
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? _gold : Colors.transparent,
            width: 2.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              r.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withValues(alpha: 0.55), const Color(0xFF0E0E0E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.35, 1.0],
                  colors: [Colors.transparent, Colors.black],
                ),
              ),
            ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    r.key,
                    style: AppFonts.cinzel(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      shadows: const [Shadow(color: Colors.black, blurRadius: 8)],
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text('$count gods',
                      style: const TextStyle(
                          color: Color(0xFFCFCFCF), fontSize: 11)),
                ],
              ),
            ),
            if (selected)
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: _gold,
                  child: Icon(Icons.check_rounded, color: Colors.black, size: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ── Page 3: Choose Your God ──
  Widget _godPage() {
    final realm = _realm;
    final gods = realm == null ? const <God>[] : _iconicGods(realm);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            realm == null ? 'Choose Your God' : 'Choose Your $realm God',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 29,
              fontWeight: FontWeight.w800,
              height: 1.18,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'The most iconic of the realm. Pick your patron — they’ll be added to your favorites.',
            textAlign: TextAlign.justify,
            style: TextStyle(color: _muted, fontSize: 15, height: 1.4),
          ),
          const SizedBox(height: 24),
          if (gods.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Center(
                child: Text('Pick a realm first.',
                    style: TextStyle(color: _muted, fontSize: 14)),
              ),
            )
          else
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.74,
              children: [for (final g in gods) _godCard(g)],
            ),
        ],
      ),
    );
  }

  Widget _godCard(God g) {
    final selected = _godId == g.id;
    final color = GodCard.mythologyColor(g.mythology);
    return GestureDetector(
      onTap: () {
        SoundService.playClick();
        setState(() => _godId = g.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? _gold : _tileBorder,
            width: selected ? 2.5 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              g.imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (_, __, ___) => DecoratedBox(
                decoration:
                    BoxDecoration(color: color.withValues(alpha: 0.12)),
                child: Icon(Icons.shield_moon_rounded,
                    color: color.withValues(alpha: 0.5), size: 40),
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.42, 1.0],
                  colors: [Colors.transparent, Colors.black],
                ),
              ),
            ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    g.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.cinzel(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      shadows: const [Shadow(color: Colors.black, blurRadius: 8)],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    g.localizedTitle('en'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: color,
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      shadows: const [Shadow(color: Colors.black, blurRadius: 6)],
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: _gold,
                  child: Icon(Icons.check_rounded, color: Colors.black, size: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ── Choice pages (interest / rhythm / reminders) ──
  Widget _choicePage({
    required String title,
    String? subtitle,
    required List<_Opt> options,
    required String? groupValue,
    required ValueChanged<String> onPick,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 29,
              fontWeight: FontWeight.w800,
              height: 1.18,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 12),
            Text(subtitle,
                style: const TextStyle(color: _muted, fontSize: 15, height: 1.4)),
          ],
          const SizedBox(height: 26),
          for (final o in options)
            _optionTile(
              label: o.label,
              sub: o.sub,
              selected: groupValue == o.value,
              onTap: () => onPick(o.value),
            ),
        ],
      ),
    );
  }

  Widget _optionTile({
    required String label,
    String? sub,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          SoundService.playClick();
          onTap();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
          decoration: BoxDecoration(
            color: selected ? _gold.withValues(alpha: 0.10) : _tileBg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected ? _gold : _tileBorder,
              width: selected ? 1.6 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.5,
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w600,
                      ),
                    ),
                    if (sub != null) ...[
                      const SizedBox(height: 3),
                      Text(sub,
                          style:
                              const TextStyle(color: _muted, fontSize: 12.5)),
                    ],
                  ],
                ),
              ),
              if (selected)
                const Icon(Icons.check_circle_rounded, color: _gold, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ── Page 7: Ready ──
  Widget _readyPage() {
    final god = _chosenGod;
    final accent = god != null ? GodCard.mythologyColor(god.mythology) : _gold;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          if (god != null)
            Container(
              width: 108,
              height: 108,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: accent, width: 2),
                boxShadow: [
                  BoxShadow(color: accent.withValues(alpha: 0.35), blurRadius: 24),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                god.imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (_, __, ___) => Container(
                  color: accent.withValues(alpha: 0.15),
                  child: Icon(Icons.shield_moon_rounded, color: accent, size: 40),
                ),
              ),
            )
          else
            Icon(Icons.verified_rounded, color: accent, size: 44),
          const SizedBox(height: 20),
          Text(
            'Your Archive Is Ready',
            textAlign: TextAlign.center,
            style: AppFonts.cinzel(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            god != null
                ? 'You’ve chosen ${god.name} of ${god.mythology} as your patron. Your journey begins now.'
                : 'Your journey begins now.',
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.white70, fontSize: 15, height: 1.55),
          ),
          const SizedBox(height: 28),
          _summaryRow(Icons.shield_rounded, 'Patron', god?.name ?? '—', accent),
          const SizedBox(height: 12),
          _summaryRow(Icons.public_rounded, 'Realm', _realm ?? '—', accent),
          const SizedBox(height: 12),
          _summaryRow(Icons.schedule_rounded, 'Rhythm',
              _rhythm ?? 'When I Have Time', accent),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _summaryRow(IconData icon, String label, String value, Color accent) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: _tileBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _tileBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: accent, size: 20),
          const SizedBox(width: 14),
          Text(label, style: const TextStyle(color: _muted, fontSize: 14)),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
