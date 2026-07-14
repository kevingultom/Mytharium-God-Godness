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

/// A slot-machine style "roll the dice" reveal: spins through a sequence of
/// entries that smoothly decelerates before landing on a single, pre-chosen
/// result — the displayed entry and the returned entry are always the same one.
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
  // settling into place.
  static const _tickDelaysMs = [
    60, 68, 77, 87, 98, 111, 126, 142, 161, 182, //
    206, 233, 263, 298, 337, 381,
  ];

  final _rng = Random();
  late final RandomEntry _finalEntry;
  late final List<RandomEntry> _reel;
  late final AnimationController _settleCtrl;
  late final AnimationController _glowCtrl;
  Timer? _timer;
  int _tickIndex = 0;
  bool _landed = false;

  @override
  void initState() {
    super.initState();
    _finalEntry = widget.entries[_rng.nextInt(widget.entries.length)];
    _reel = List.generate(
      _tickDelaysMs.length - 1,
      (_) => widget.entries[_rng.nextInt(widget.entries.length)],
    )..add(_finalEntry);

    _settleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _glowCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _scheduleNextTick();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _settleCtrl.dispose();
    _glowCtrl.dispose();
    super.dispose();
  }

  void _scheduleNextTick() {
    _timer = Timer(Duration(milliseconds: _tickDelaysMs[_tickIndex]), () {
      if (!mounted) return;
      final isLast = _tickIndex >= _tickDelaysMs.length - 1;
      if (isLast) {
        _land();
      } else {
        SoundService.playButton();
        setState(() => _tickIndex++);
        _scheduleNextTick();
      }
    });
  }

  void _land() {
    SoundService.playResult();
    _glowCtrl.stop();
    setState(() => _landed = true);
    _settleCtrl.forward(from: 0);
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) Navigator.of(context).pop(_finalEntry);
    });
  }

  RandomEntry get _displayed => _reel[_tickIndex];

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final entry = _displayed;
    final color = GodCard.mythologyColor(entry.verse);

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
        width: 280,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _landed
                ? color.withValues(alpha: 0.8)
                : const Color(0xFFB07800).withValues(alpha: 0.4),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: (_landed ? color : const Color(0xFFFF6F00))
                  .withValues(alpha: _landed ? 0.35 : 0.15),
              blurRadius: _landed ? 34 : 16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _landed
                  ? (lang == 'id' ? 'KAMU DAPAT!' : 'YOU GOT!')
                  : (lang == 'id' ? 'MENARIK...' : 'DRAWING...'),
              style: AppFonts.cinzel(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFFF8A00),
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 8),
            // Progress ring — how far through the spin we are.
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: _landed ? 1 : _tickIndex / (_tickDelaysMs.length - 1),
                  minHeight: 3,
                  backgroundColor: const Color(0xFF222222),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _landed ? color : const Color(0xFFFF8A00),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedBuilder(
              animation: Listenable.merge([_settleCtrl, _glowCtrl]),
              builder: (context, _) {
                final bounce = _landed
                    ? Curves.elasticOut.transform(_settleCtrl.value)
                    : 1.0;
                final glow = _landed ? 1.0 : 0.4 + _glowCtrl.value * 0.6;
                return Transform.scale(
                  scale: _landed ? 0.85 + bounce * 0.15 : 1.0,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: color.withValues(alpha: glow),
                        width: _landed ? 2.5 : 1.5,
                      ),
                      boxShadow: _landed
                          ? [
                              BoxShadow(
                                color: color.withValues(alpha: 0.5),
                                blurRadius: 24,
                                spreadRadius: 1,
                              ),
                            ]
                          : null,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        switchInCurve: Curves.easeOut,
                        switchOutCurve: Curves.easeIn,
                        transitionBuilder: (child, anim) => FadeTransition(
                          opacity: anim,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.3),
                              end: Offset.zero,
                            ).animate(anim),
                            child: child,
                          ),
                        ),
                        child: KeyedSubtree(
                          key: ValueKey('${entry.name}_$_tickIndex'),
                          child: entry.imageUrl.isNotEmpty
                              ? Image.asset(entry.imageUrl,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  errorBuilder: (_, __, ___) =>
                                      _letterFallback(entry, color))
                              : _letterFallback(entry, color),
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
                entry.name,
                key: ValueKey('${entry.name}_name_$_tickIndex'),
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
                entry.subtitle,
                key: ValueKey('${entry.name}_sub_$_tickIndex'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: color),
              ),
            ),
            const SizedBox(height: 6),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: Container(
                key: ValueKey('${entry.name}_tag_$_tickIndex'),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  entry.verse,
                  style: TextStyle(
                    fontSize: 10,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            if (_landed) ...[
              const SizedBox(height: 16),
              Text(
                lang == 'id'
                    ? 'Menutup otomatis...'
                    : 'Closing automatically...',
                style: const TextStyle(fontSize: 11, color: Color(0xFF666666)),
              ),
            ],
          ],
        ),
      ),
    ),
    );
  }

  Widget _letterFallback(RandomEntry entry, Color color) {
    return Center(
      child: Text(
        entry.name.isNotEmpty ? entry.name[0] : '?',
        style: const TextStyle(fontSize: 64, color: Color(0xFFB07800)),
      ),
    );
  }
}
