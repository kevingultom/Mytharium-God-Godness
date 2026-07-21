import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'god_card.dart';

/// A display-neutral entry for the random reveal. Wraps whatever the reel
/// should land on (a god or a pop-culture character) with just the fields the
/// dialog needs to show, plus an opaque [payload] the caller uses to navigate.
class RandomEntry {
  final String imageUrl;
  final String name;
  final String subtitle; // epithet / source media
  final String verse; // mythology / origin verse — drives the accent color
  final Object payload; // God or MythicPopCultureCharacter

  const RandomEntry({
    required this.imageUrl,
    required this.name,
    required this.subtitle,
    required this.verse,
    required this.payload,
  });
}

/// A two-stage "roll the dice" reveal: first spins through the 6 mythic
/// realms and lands on one, then — after a short pause — spins again through
/// only that realm's entries before landing on the final pick. While
/// spinning, a static card-back image is shown (never a real photo) so the
/// reel never has to decode a fresh image every tick.
///
/// Returns the chosen [RandomEntry] once the reveal finishes (auto-closes
/// shortly after landing), or `null` if dismissed early.
class RandomGodDialog {
  static Future<RandomEntry?> show(
      BuildContext context, List<RandomEntry> entries) {
    return showGeneralDialog<RandomEntry>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black87,
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (ctx, a1, a2, child) => FadeTransition(
        opacity: a1,
        child: ScaleTransition(
          scale: CurvedAnimation(parent: a1, curve: Curves.easeOutBack),
          child: child,
        ),
      ),
      pageBuilder: (_, __, ___) => _RandomGodReveal(entries: entries),
    );
  }
}

enum _Stage { verse, verseLanded, god, landed }

class _RandomGodReveal extends StatefulWidget {
  final List<RandomEntry> entries;
  const _RandomGodReveal({required this.entries});

  @override
  State<_RandomGodReveal> createState() => _RandomGodRevealState();
}

class _RandomGodRevealState extends State<_RandomGodReveal>
    with TickerProviderStateMixin {
  // Each entry is how long the reel pauses on that tick before advancing —
  // starts fast and geometrically slows down, like a real spinning reel
  // settling into place. Reused identically for both spin stages.
  static const _tickDelaysMs = [
    60, 68, 77, 87, 98, 111, 126, 142, 161, 182, //
    206, 233, 263, 298, 337, 381,
  ];

  static const _cardBack = 'assets/images/card.webp';
  static const _verseImages = {
    'Greek': 'assets/images/greek.webp',
    'Egyptian': 'assets/images/egypt.webp',
    'Nordic': 'assets/images/nordik.webp',
    'Hindu': 'assets/images/hindu.webp',
    'Chinese': 'assets/images/cina.webp',
    'Japanese': 'assets/images/japanese.webp',
  };

  final _rng = Random();
  late final RandomEntry _finalEntry;
  late final String _finalVerse;
  late final List<String> _verseReel;
  late final List<RandomEntry> _godReel;
  late final AnimationController _settleCtrl;
  late final AnimationController _glowCtrl;
  late final AnimationController _spinCtrl;
  Timer? _timer;
  int _tickIndex = 0;
  _Stage _stage = _Stage.verse;
  bool _precached = false;

  @override
  void initState() {
    super.initState();
    SoundService.pauseMusic();
    _finalEntry = widget.entries[_rng.nextInt(widget.entries.length)];
    _finalVerse = _finalEntry.verse;

    final verseKeys = _verseImages.keys.toList();
    _verseReel = List.generate(
      _tickDelaysMs.length - 1,
      (_) => verseKeys[_rng.nextInt(verseKeys.length)],
    )..add(_finalVerse);

    final versePool =
        widget.entries.where((e) => e.verse == _finalVerse).toList();
    _godReel = List.generate(
      _tickDelaysMs.length - 1,
      (_) => versePool[_rng.nextInt(versePool.length)],
    )..add(_finalEntry);

    _settleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _glowCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    // Drives one 3D half-turn per reel tick; its duration is reset each tick
    // to match the tick delay, so the flip decelerates along with the ticks.
    _spinCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 620),
    );

    _scheduleNextTick();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Only the card-back, the 6 realm covers, and the final god's photo are
    // ever shown — a tiny, fixed set — so precache all of them up front.
    if (_precached) return;
    _precached = true;
    final paths = <String>{
      _cardBack,
      ..._verseImages.values,
      _finalEntry.imageUrl,
    }..removeWhere((p) => p.isEmpty);
    for (final path in paths) {
      precacheImage(AssetImage(path), context);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _settleCtrl.dispose();
    _glowCtrl.dispose();
    _spinCtrl.dispose();
    SoundService.resumeMusic();
    super.dispose();
  }

  void _scheduleNextTick() {
    final isLast = _tickIndex >= _tickDelaysMs.length - 1;
    // One half-turn per tick, timed to the tick delay — fast at the start,
    // slowing as the delays grow. The final tick gets an extra-slow, drawn-out
    // flip for a suspenseful "here it comes" finish before the reveal.
    final spinMs = isLast ? 720 : _tickDelaysMs[_tickIndex];
    _spinCtrl.duration = Duration(milliseconds: spinMs);
    _spinCtrl
      ..value = 0
      ..forward();
    _timer = Timer(Duration(milliseconds: spinMs), () {
      if (!mounted) return;
      if (isLast) {
        _stage == _Stage.verse ? _landVerse() : _landGod();
      } else {
        SoundService.playRandomGodTick();
        setState(() => _tickIndex++);
        _scheduleNextTick();
      }
    });
  }

  void _landVerse() {
    SoundService.playRandomGodLand();
    setState(() => _stage = _Stage.verseLanded);
    _settleCtrl.forward(from: 0);
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (!mounted) return;
      _settleCtrl.value = 0;
      setState(() {
        _stage = _Stage.god;
        _tickIndex = 0;
      });
      _scheduleNextTick();
    });
  }

  void _landGod() {
    SoundService.playRandomGodLand();
    _glowCtrl.stop();
    setState(() => _stage = _Stage.landed);
    _settleCtrl.forward(from: 0);
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) Navigator.of(context).pop(_finalEntry);
    });
  }

  bool get _settled => _stage == _Stage.verseLanded || _stage == _Stage.landed;

  String get _currentVerse =>
      _stage == _Stage.verse ? _verseReel[_tickIndex] : _finalVerse;

  String get _displayImage {
    switch (_stage) {
      case _Stage.verse:
      case _Stage.god:
        return _cardBack;
      case _Stage.verseLanded:
        return _verseImages[_finalVerse] ?? _cardBack;
      case _Stage.landed:
        return _finalEntry.imageUrl;
    }
  }

  String get _displayName {
    switch (_stage) {
      case _Stage.verse:
        return _verseReel[_tickIndex];
      case _Stage.verseLanded:
        return _finalVerse;
      case _Stage.god:
        return _godReel[_tickIndex].name;
      case _Stage.landed:
        return _finalEntry.name;
    }
  }

  String _displaySubtitle(String lang) {
    switch (_stage) {
      case _Stage.verse:
      case _Stage.verseLanded:
        return localize(lang, 'Dunia Mitologi', 'Mythic Realm');
      case _Stage.god:
        return _finalVerse;
      case _Stage.landed:
        return _finalEntry.subtitle;
    }
  }

  String _headerLabel(String lang) {
    switch (_stage) {
      case _Stage.verse:
        return localize(lang, 'MENCARI DUNIA...', 'FINDING REALM...');
      case _Stage.verseLanded:
        return localize(lang, 'DUNIA DITEMUKAN!', 'REALM FOUND!');
      case _Stage.god:
        return localize(lang, 'MENARIK DEWA...', 'DRAWING GOD...');
      case _Stage.landed:
        return localize(lang, 'KAMU DAPAT!', 'YOU GOT!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final color = GodCard.mythologyColor(_currentVerse);
    final tickKey = '${_stage.name}_$_tickIndex';

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
        width: 280,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _headerLabel(lang),
              style: AppFonts.cinzel(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFFF8A00),
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 8),
            // Progress ring — how far through the current stage's spin we are.
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: _settled ? 1 : _tickIndex / (_tickDelaysMs.length - 1),
                  minHeight: 3,
                  backgroundColor: const Color(0xFF222222),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _settled ? color : const Color(0xFFFF8A00),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedBuilder(
              animation: Listenable.merge([_settleCtrl, _glowCtrl, _spinCtrl]),
              builder: (context, _) {
                final glow = _settled ? 1.0 : 0.4 + _glowCtrl.value * 0.6;
                double rotY;
                double scale;
                if (_settled) {
                  // Reveal: the front-facing card bounces into place.
                  rotY = 0;
                  final bounce = Curves.elasticOut.transform(_settleCtrl.value);
                  scale = 0.85 + bounce * 0.15;
                } else {
                  // Spinning: one half-turn per tick, decelerating with them.
                  rotY = (_tickIndex + _spinCtrl.value) * pi;
                  scale = 1.0;
                }
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.0013)
                    ..rotateY(rotY)
                    ..scaleByDouble(scale, scale, scale, 1.0),
                  child: Container(
                    width: 240,
                    height: 280,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.55 * glow),
                          blurRadius: 26 * glow,
                          spreadRadius: 1 * glow,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        switchInCurve: Curves.easeOut,
                        switchOutCurve: Curves.easeIn,
                        // Plain cross-fade — the outer card's continuous 3D
                        // spin already carries the shuffle motion.
                        transitionBuilder: (child, anim) =>
                            FadeTransition(opacity: anim, child: child),
                        child: KeyedSubtree(
                          key: ValueKey(tickKey),
                          child: Image.asset(_displayImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.topCenter,
                              errorBuilder: (_, __, ___) =>
                                  _letterFallback(_displayName)),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 14),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: Text(
                _displayName,
                key: ValueKey('${tickKey}_name'),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.cinzel(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 4),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: Text(
                _displaySubtitle(lang),
                key: ValueKey('${tickKey}_sub'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: color),
              ),
            ),
            const SizedBox(height: 6),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: Container(
                key: ValueKey('${tickKey}_tag'),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _currentVerse,
                  style: TextStyle(
                    fontSize: 10,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            if (_settled) ...[
              const SizedBox(height: 16),
              Text(
                _stage == _Stage.landed
                    ? (localize(lang, 'Menutup otomatis...', 'Closing automatically...'))
                    : (localize(lang, 'Melanjutkan...', 'Continuing...')),
                style: const TextStyle(fontSize: 11, color: Color(0xFF666666)),
              ),
            ],
          ],
        ),
      ),
    ),
    );
  }

  Widget _letterFallback(String name) {
    return Center(
      child: Text(
        name.isNotEmpty ? name[0] : '?',
        style: const TextStyle(fontSize: 64, color: Color(0xFFB07800)),
      ),
    );
  }
}
