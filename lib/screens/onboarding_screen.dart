import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../data/gods_data.dart';
import '../models/god_model.dart';
import '../services/onboarding_service.dart';
import '../services/bookmark_service.dart';
import '../services/notification_service.dart';
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
  (key: 'Greek', image: 'assets/images/greek.webp'),
  (key: 'Egyptian', image: 'assets/images/egypt.webp'),
  (key: 'Nordic', image: 'assets/images/nordik.webp'),
  (key: 'Hindu', image: 'assets/images/hindu.webp'),
  (key: 'Chinese', image: 'assets/images/cina.webp'),
  (key: 'Japanese', image: 'assets/images/japanese.webp'),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  static const _pageCount = 7;
  final _controller = PageController();
  int _index = 0;

  String? _realm; // chosen pantheon
  String? _godId; // chosen iconic god
  String? _interest;
  String? _rhythm;
  String? _remind; // 'yes' / 'no'
  bool _finishing = false;

  // Drives the one-time entrance reveal on the welcome page. We deliberately
  // do NOT drive this with AnimationController.forward()'s own Ticker —
  // on this environment's Flutter Web build, the ticker's internal clock
  // was found (via an on-screen debug readout) to complete a 60s-duration
  // controller in ~3s of real time even with timeDilation at its default
  // 1.0, a discrepancy in the engine's frame-delta timing rather than
  // anything in this widget's animation setup. Driving `.value` manually
  // from a real Stopwatch below sidesteps that bug entirely and guarantees
  // the reveal takes exactly _welcomeDuration of real wall-clock time.
  static const _welcomeDuration = Duration(milliseconds: 4500);
  late final AnimationController _welcomeAnim = AnimationController(
    vsync: this,
    duration: _welcomeDuration,
  );
  final Stopwatch _welcomeClock = Stopwatch();
  Timer? _welcomeTicker;

  @override
  void initState() {
    super.initState();
    // Start the reveal only AFTER the first frame is actually painted. On
    // Flutter Web the initial JS load delays first paint; if we started
    // timing during build the animation would burn through its whole
    // timeline while the screen was still blank, so the user would only
    // ever see the final (settled) state instead of watching it animate in.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _welcomeClock.start();
      _welcomeTicker = Timer.periodic(const Duration(milliseconds: 16), (_) {
        final t = _welcomeClock.elapsedMilliseconds / _welcomeDuration.inMilliseconds;
        _welcomeAnim.value = t.clamp(0.0, 1.0);
        if (t >= 1.0) _welcomeTicker?.cancel();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _welcomeAnim.dispose();
    _welcomeTicker?.cancel();
    super.dispose();
  }

  // Fades + slides a piece of content up into place during a slice of the
  // welcome entrance timeline (start/end in 0..1 of _welcomeAnim).
  Widget _revealText(Widget child, double start, double end) {
    final curved = CurvedAnimation(
      parent: _welcomeAnim,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
    return FadeTransition(
      opacity: curved,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
            .animate(curved),
        child: child,
      ),
    );
  }

  // Reveals MYTHERA one letter at a time — slow between the first letters,
  // accelerating toward the last. Letter i's start position within
  // [start, end] follows sqrt(i / (n-1)), which rises steeply at first (big
  // gaps early) and flattens out later (tiny gaps late) — i.e. speeds up.
  Widget _revealLetters(
    String text, {
    required TextStyle style,
    required double start,
    required double end,
  }) {
    final letters = text.split('');
    final n = letters.length;
    final span = end - start;
    final letterSpan = span / n * 1.6;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < n; i++)
          _revealText(
            Text(letters[i], style: style),
            (start + span * math.sqrt(n <= 1 ? 0 : i / (n - 1)))
                .clamp(0.0, 1.0),
            (start +
                    span * math.sqrt(n <= 1 ? 0 : i / (n - 1)) +
                    letterSpan)
                .clamp(0.0, 1.0),
          ),
      ],
    );
  }

  // A single light sweep across `child`, played once during [start, end].
  Widget _shimmerSweep(Widget child, {required double start, required double end}) {
    final curved = CurvedAnimation(
      parent: _welcomeAnim,
      curve: Interval(start, end, curve: Curves.easeInOut),
    );
    return AnimatedBuilder(
      animation: curved,
      child: child,
      builder: (context, child) {
        final t = curved.value;
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment(-1.6 + 3.2 * t, 0),
            end: Alignment(-0.4 + 3.2 * t, 0),
            colors: const [_gold, Colors.white, _gold],
          ).createShader(bounds),
          child: child,
        );
      },
    );
  }

  // The most iconic gods of a realm (data is ordered by prominence).
  // Greek shows 6 gods; other mythologies show 10 for richer selection.
  List<God> _iconicGods(String realm) {
    final count = 10;
    return godsData
        .where((g) => g.mythology == realm && g.category != 'Cosmology')
        .take(count)
        .toList();
  }

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

    // Reminder opt-in → daily-reminder preference, and actually schedule
    // (or cancel) the local notification — matching Profile's toggle.
    final remindersOn = _remind == 'yes';
    await SettingsService.setDailyReminders(remindersOn);
    if (remindersOn) {
      await NotificationService.instance.scheduleDailyReminder();
    } else {
      await NotificationService.instance.cancelDailyReminder();
    }

    await OnboardingService.complete(
      patronGodId: god?.id ?? '',
      pantheon: _realm ?? '',
      rhythm: _rhythm ?? 'When I Have Time',
    );

    if (!mounted) return;
    // Root navigator, not whatever nested one this screen happened to be
    // opened from (e.g. Profile's "Replay Intro") — this must replace the
    // whole app shell, not nest a new MainShell inside another tab.
    Navigator.of(context, rootNavigator: true).pushReplacement(
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
            // Welcome hero backdrop (dewa.webp) — fades out after the first page.
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 450),
                  opacity: _index == 0 ? 1.0 : 0.0,
                  // Image stays static — only the text over it animates in.
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/dewa.webp',
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
                  // Progress bar — reveals near the very END of the welcome
                  // sequence (after the title and body text), so the top
                  // lines fade in last alongside the Continue button.
                  FadeTransition(
                    opacity: CurvedAnimation(
                      parent: _welcomeAnim,
                      curve: const Interval(0.80, 0.94, curve: Curves.easeInOut),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          for (int i = 0; i < _pageCount; i++) ...[
                            Expanded(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                height: 5,
                                decoration: BoxDecoration(
                                  color: i <= _index
                                      ? _gold
                                      : const Color(0xFF3A3A3A),
                                  borderRadius: BorderRadius.circular(2.5),
                                ),
                              ),
                            ),
                            if (i < _pageCount - 1) const SizedBox(width: 5),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
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
                  // Continue button — the last piece to arrive in the
                  // welcome reveal sequence, cueing that it's time to act.
                  _revealText(
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 8, 24,
                          MediaQuery.of(context).padding.bottom + 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _canContinue ? _next : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _cta,
                            disabledBackgroundColor: const Color(0xFF2A2A2A),
                            foregroundColor: Colors.black,
                            disabledForegroundColor: const Color(0xFF666666),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            _index == _pageCount - 1
                                ? 'Enter Mythera'
                                : 'Continue',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    0.84,
                    1.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Back button placed inline at the top of each page's own (scrollable)
  // content, so it scrolls away with the title when the page is scrolled
  // down, and reappears when scrolled back up. Not shown on the welcome page.
  Widget _backRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: _back,
        behavior: HitTestBehavior.opaque,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_rounded, color: Colors.white, size: 24),
              SizedBox(width: 6),
              Text(
                'Back',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Page 1: Welcome ──
  Widget _welcomePage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth < 360 ? 26.0 : 31.0;
    const titleShadow = [
      Shadow(color: Colors.black, blurRadius: 18, offset: Offset(0, 3)),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth < 360 ? 20 : 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          _shimmerSweep(
            _revealLetters(
              'MYTHERA',
              style: AppFonts.cinzel(
                color: _gold,
                fontSize: screenWidth < 360 ? 13 : 15,
                fontWeight: FontWeight.w600,
                letterSpacing: screenWidth < 360 ? 5 : 8,
                shadows: titleShadow,
              ),
              start: 0.017,
              end: 0.40,
            ),
            start: 0.40,
            end: 0.52,
          ),
          const SizedBox(height: 20),
          _revealText(
            Text(
              'Realms of the Divine',
              textAlign: TextAlign.center,
              style: AppFonts.cinzel(
                color: Colors.white,
                fontSize: titleSize,
                fontWeight: FontWeight.w700,
                height: 1.25,
                shadows: titleShadow,
              ),
            ),
            0.52,
            0.68,
          ),
          const SizedBox(height: 18),
          _revealText(
            Text(
              'Long before written history, gods shaped the world and their myths still endure.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.55,
                shadows: [Shadow(color: Colors.black, blurRadius: 12)],
              ),
            ),
            0.66,
            0.82,
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  // ── Page 2: Choose Your Realm ──
  Widget _realmPage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth < 360 ? 24.0 : 29.0;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _backRow(),
          Text(
            'Choose Your Realm',
            style: TextStyle(
              color: Colors.white,
              fontSize: titleSize,
              fontWeight: FontWeight.w800,
              height: 1.18,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Pick the pantheon that calls to you — your Discover feed will open on it.',
            textAlign: TextAlign.justify,
            style: TextStyle(color: _muted, fontSize: 14, height: 1.4),
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
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? _gold : Colors.transparent,
            width: 2.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13.5),
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
      ),
    );
  }

  // ── Page 3: Choose Your God ──
  Widget _godPage() {
    final realm = _realm;
    final gods = realm == null ? const <God>[] : _iconicGods(realm);
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth < 360 ? 24.0 : 29.0;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _backRow(),
          Text(
            realm == null ? 'Choose Your God' : 'Choose Your $realm God',
            style: TextStyle(
              color: Colors.white,
              fontSize: titleSize,
              fontWeight: FontWeight.w800,
              height: 1.18,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "The most iconic of the realm. Pick your patron — they'll be added to your favorites.",
            textAlign: TextAlign.justify,
            style: TextStyle(color: _muted, fontSize: 14, height: 1.4),
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
              // All mythologies show 10 gods — consistent compact cards
              childAspectRatio: 0.80,
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
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? _gold : _tileBorder,
            width: selected ? 2.5 : 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13.5),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth < 360 ? 21.0 : 24.0;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _backRow(),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: titleSize,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(subtitle,
                style: const TextStyle(color: _muted, fontSize: 14, height: 1.4)),
          ],
          const SizedBox(height: 20),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth < 360 ? 26.0 : 30.0;
    return Stack(
      children: [
        Padding(
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
                    boxShadow: [
                      BoxShadow(
                          color: accent.withValues(alpha: 0.35),
                          blurRadius: 24),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    god.imageUrl,
                    fit: BoxFit.cover,
                    width: 108,
                    height: 108,
                    alignment: Alignment.topCenter,
                    errorBuilder: (_, __, ___) => Container(
                      color: accent.withValues(alpha: 0.15),
                      child: Icon(Icons.shield_moon_rounded,
                          color: accent, size: 40),
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
                  fontSize: titleSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  god != null
                      ? "You've chosen ${god.name} of ${god.mythology} as your patron. Your journey begins now."
                      : 'Your journey begins now.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 14, height: 1.55),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 4,
          child: _backRow(),
        ),
      ],
    );
  }

}
