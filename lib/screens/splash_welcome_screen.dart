import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import 'main_shell.dart';

const _bgTop = Color(0xFF1A140A);
const _bgBottom = Color(0xFF080808);
const _gold = Color(0xFFC9A227);

/// Shown every time a returning user (onboarding already completed) opens
/// the app — the same animated "MYTHERA" reveal as the first-run
/// onboarding's opening page, but with no Continue button: once the
/// reveal finishes, a brief loading beat plays and the app then fades
/// into Discover on its own.
class SplashWelcomeScreen extends StatefulWidget {
  const SplashWelcomeScreen({super.key});

  @override
  State<SplashWelcomeScreen> createState() => _SplashWelcomeScreenState();
}

class _SplashWelcomeScreenState extends State<SplashWelcomeScreen>
    with SingleTickerProviderStateMixin {
  // See OnboardingScreen's identical field for why this is driven by a
  // manual Stopwatch/Timer rather than AnimationController.forward().
  static const _welcomeDuration = Duration(milliseconds: 4500);
  late final AnimationController _welcomeAnim = AnimationController(
    vsync: this,
    duration: _welcomeDuration,
  );
  final Stopwatch _welcomeClock = Stopwatch();
  Timer? _welcomeTicker;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _welcomeClock.start();
      _welcomeTicker = Timer.periodic(const Duration(milliseconds: 16), (_) {
        final t = _welcomeClock.elapsedMilliseconds / _welcomeDuration.inMilliseconds;
        _welcomeAnim.value = t.clamp(0.0, 1.0);
        if (t >= 1.0) {
          _welcomeTicker?.cancel();
          _finish();
        }
      });
    });
  }

  @override
  void dispose() {
    _welcomeAnim.dispose();
    _welcomeTicker?.cancel();
    super.dispose();
  }

  Future<void> _finish() async {
    if (!mounted) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    Navigator.of(context, rootNavigator: true).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MainShell(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth < 360 ? 26.0 : 31.0;
    const titleShadow = [
      Shadow(color: Colors.black, blurRadius: 18, offset: Offset(0, 3)),
    ];
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
            Positioned.fill(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/dewa.webp',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
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
            SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenWidth < 360 ? 20 : 30),
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
                      const Text(
                        'Long before written history, gods shaped the world and their myths still endure.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                    // Takes the Continue button's spot on first-run
                    // onboarding — returning users don't tap anything, so a
                    // brief spinner plays here instead once the reveal ends.
                    SizedBox(
                      height: 64,
                      child: Center(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _loading ? 1 : 0,
                          child: const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.4,
                              valueColor: AlwaysStoppedAnimation<Color>(_gold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
