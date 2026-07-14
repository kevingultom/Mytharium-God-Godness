import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import '../models/combatant.dart';
import '../data/gods_data.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import '../services/battle_engine.dart';

// ─── Screen ─────────────────────────────────────────────────
class GodBattleScreen extends StatefulWidget {
  const GodBattleScreen({super.key});

  @override
  State<GodBattleScreen> createState() => _GodBattleScreenState();
}

class _GodBattleScreenState extends State<GodBattleScreen>
    with TickerProviderStateMixin {
  Combatant? _god1;
  Combatant? _god2;
  BattleResult? _result;
  bool _showResult = false;
  bool _isBattling = false;
  double _battleProgress = 0.0;
  Timer? _battleTimer;

  late AnimationController _resultCtrl;
  @override
  void initState() {
    super.initState();
    _resultCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  @override
  void dispose() {
    _battleTimer?.cancel();
    _resultCtrl.dispose();
    super.dispose();
  }

  void _pickGod(int slot) {
    SoundService.playClick();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF111111),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => _GodPickerSheet(
        exclude: slot == 1 ? _god2 : _god1,
        onPick: (g) {
          Navigator.pop(context);
          setState(() {
            if (slot == 1) {
              _god1 = g;
            } else {
              _god2 = g;
            }
            _result = null;
            _showResult = false;
          });
        },
      ),
    );
  }

  void _startBattle() {
    if (_god1 == null || _god2 == null) return;
    SoundService.playClick();

    setState(() {
      _isBattling = true;
      _showResult = false;
      _result = null;
    });

    // Pre-calculate result but don't show yet
    _result = BattleEngine.battle(_god1!, _god2!);
    _resultCtrl.reset();

    // Start 3-second battle animation using real wall-clock timer
    setState(() => _battleProgress = 0.0);
    final startMs = DateTime.now().millisecondsSinceEpoch;
    _battleTimer?.cancel();
    _battleTimer = Timer.periodic(const Duration(milliseconds: 16), (t) {
      final elapsed = DateTime.now().millisecondsSinceEpoch - startMs;
      final progress = (elapsed / 3000.0).clamp(0.0, 1.0);
      setState(() => _battleProgress = progress);
      if (progress >= 1.0) {
        t.cancel();
        _battleTimer = null;
        setState(() {
          _isBattling = false;
          _showResult = true;
        });
        _resultCtrl.forward(from: 0);
      }
    });
  }

  void _resetBattle() {
    SoundService.playClick();
    setState(() {
      _god1 = null;
      _god2 = null;
      _result = null;
      _showResult = false;
      _isBattling = false;
      _battleProgress = 0.0;
    });
    _battleTimer?.cancel();
    _battleTimer = null;
    _resultCtrl.reset();
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(lang),
            Expanded(
              child: _isBattling
                  ? _buildBattleAnimation(lang)
                  : _showResult && _result != null
                      ? _buildResultView(lang)
                      : _buildSelectionView(lang),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Header ─────────────────────────────────────────────
  Widget _buildHeader(String lang) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 20, 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF333333)),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white, size: 16),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GOD BATTLE',
                  style: AppFonts.cinzel(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  lang == 'id'
                      ? 'Pilih 2 dewa, siapa yang lebih kuat?'
                      : 'Pick 2 gods, who is stronger?',
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Battle Animation (3 second dramatic) ──────────────
  Widget _buildBattleAnimation(String lang) {
    final v = _battleProgress;

    // Phase 1: TENSION (0.0–0.8s) — cards shake, VS pulses, energy builds
    final tension = _seg(v, 0.0, 0.25, Curves.easeOut);
    final tensionShake = v < 0.25
        ? sin(v / 0.25 * pi * 14) * 2.5 * tension
        : 0.0;

    // Phase 2: CLASH (0.25–0.50) — both cards lunge inward, screen shake
    final clashing = _bump(v, 0.25, 0.50);
    final clashX = sin(v * pi * 36) * 5 * clashing;
    final clashY = cos(v * pi * 32) * 4 * clashing;
    final impact = clashing;

    // Phase 3: STRUGGLE (0.50–0.83) — rapid alternating jolts
    final jolt = _bump(v, 0.50, 0.60);
    final jolt2 = _bump(v, 0.60, 0.70);
    final jolt3 = _bump(v, 0.70, 0.83);
    final struggleShake = sin(v * pi * 48) * 3 * (jolt + jolt2 + jolt3);

    // Phase 4: FINAL BLOW + FLASH (0.83–0.92)
    final finalBlow = _bump(v, 0.83, 0.92);

    // Phase 5: REVEAL (0.92–1.0)
    final reveal = _seg(v, 0.92, 1.0, Curves.easeOutCubic);

    // Combined shake
    final shakeAmt = tensionShake + clashX + clashY + struggleShake +
        finalBlow * sin(v * pi * 60) * 8;

    // Overall clash energy that drives the light-burst painter.
    final clashEnergy =
        (impact + finalBlow + (jolt + jolt2 + jolt3) * 0.55).clamp(0.0, 1.0);

    const leftColor = Color(0xFF2196F3);
    const rightColor = Color(0xFFFF3D00);

    // Status text — epic, mythological phrasing.
    final statusText = v < 0.25
        ? (lang == 'id' ? 'TAKDIR BERADU' : 'FATES COLLIDE')
        : v < 0.50
            ? (lang == 'id' ? 'BENTURAN KOSMIK' : 'COSMIC CLASH')
            : v < 0.83
                ? (lang == 'id' ? 'ADU KEKUATAN' : 'CLASH OF POWER')
                : v < 0.92
                    ? (lang == 'id' ? 'PUKULAN PENENTU' : 'DECISIVE BLOW')
                    : (lang == 'id' ? 'SANG PEMENANG' : 'THE VICTOR');

    return Stack(
      fit: StackFit.expand,
      children: [
        // Arena background — deep radial glow that flares on impact.
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1.05,
              colors: [
                const Color(0xFFFF6F00)
                    .withValues(alpha: 0.04 + clashEnergy * 0.22),
                const Color(0xFF140600).withValues(alpha: 0.7),
                Colors.black,
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),

        // Side auras — each fighter's color bleeds in from their edge.
        Positioned.fill(
          child: IgnorePointer(
            child: Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.center,
                        colors: [
                          leftColor.withValues(alpha: 0.12 + clashEnergy * 0.18),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.center,
                        colors: [
                          rightColor.withValues(alpha: 0.12 + clashEnergy * 0.18),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Shake container
        Transform.translate(
          offset: Offset(shakeAmt, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 320,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Energy burst at the collision point (behind cards).
                    Positioned.fill(
                      child: IgnorePointer(
                        child: CustomPaint(
                          painter: _ClashPainter(
                            energy: clashEnergy,
                            phase: v,
                            colorA: leftColor,
                            colorB: rightColor,
                          ),
                        ),
                      ),
                    ),
                    // LEFT card
                    Align(
                      alignment: const Alignment(-0.62, 0),
                      child: _buildFightCard(_god1!, leftColor,
                        isLeft: true,
                        isWinner: v >= 0.92 && _result?.winner == _god1,
                        isFight: v >= 0.25,
                        phase: v,
                        jolt: jolt + jolt3 + finalBlow,
                        reveal: reveal,
                      ),
                    ),
                    // RIGHT card
                    Align(
                      alignment: const Alignment(0.62, 0),
                      child: _buildFightCard(_god2!, rightColor,
                        isLeft: false,
                        isWinner: v >= 0.92 && _result?.winner == _god2,
                        isFight: v >= 0.25,
                        phase: v,
                        jolt: jolt2 + finalBlow,
                        reveal: reveal,
                      ),
                    ),
                    // Impact shockwave rings
                    if (clashEnergy > 0.05) ..._buildRings(clashEnergy),
                    // VS core (fades out as the clash builds)
                    if (v < 0.5) _buildVSCore(v, impact),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              // Status text
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  statusText,
                  style: AppFonts.cinzel(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 5,
                    color: Color.lerp(
                      const Color(0xFFFF8A00),
                      const Color(0xFFFFE082),
                      clashEnergy,
                    )!.withValues(alpha: 0.6 + sin(v * pi * 8).abs() * 0.4),
                    shadows: [
                      Shadow(
                        color: const Color(0xFFFF3D00)
                            .withValues(alpha: 0.5 + clashEnergy * 0.4),
                        blurRadius: 16 + clashEnergy * 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: v,
                    minHeight: 4,
                    backgroundColor: const Color(0xFF222222),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFFFF6F00)),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Fighting-game power-struggle meter (does not shake).
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: _buildPowerStruggle(v, leftColor, rightColor),
        ),

        // Flash overlay on clash + final blow
        Positioned.fill(
          child: IgnorePointer(
            child: ColoredBox(
              color: Color.lerp(Colors.white, const Color(0xFFFFE0B2), 0.35)!
                  .withValues(alpha: (impact * 0.35 + finalBlow * 0.6).clamp(0, 0.85)),
            ),
          ),
        ),
      ],
    );
  }

  // Fighting-game "power struggle" bar: two name plates and a meter that
  // starts even and slides toward the eventual winner as the clash resolves.
  Widget _buildPowerStruggle(double v, Color left, Color right) {
    final winnerProb = _result?.winnerProbability ?? 0.5;
    final leftIsWinner = _result?.winner == _god1;
    final targetLeft = leftIsWinner ? winnerProb : (1 - winnerProb);
    final t = Curves.easeInOutCubic.transform(v.clamp(0.0, 1.0));
    final leftShare = (0.5 + (targetLeft - 0.5) * t).clamp(0.06, 0.94);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                _god1!.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.cinzel(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  shadows: const [Shadow(color: Colors.black, blurRadius: 6)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('VS',
                  style: AppFonts.cinzel(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFFFFC107))),
            ),
            Expanded(
              child: Text(
                _god2!.name,
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.cinzel(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  shadows: const [Shadow(color: Colors.black, blurRadius: 6)],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.white24),
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: 12,
            child: LayoutBuilder(
              builder: (ctx, c) {
                final w = c.maxWidth;
                final split = w * leftShare;
                return Stack(
                  children: [
                    Container(color: right.withValues(alpha: 0.85)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: split,
                        color: left.withValues(alpha: 0.9),
                      ),
                    ),
                    Positioned(
                      left: split - 1.5,
                      top: 0,
                      bottom: 0,
                      child: Container(width: 3, color: Colors.white),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  double _seg(double v, double start, double end,
      [Curve curve = Curves.linear]) {
    if (v <= start) return 0.0;
    if (v >= end) return 1.0;
    return curve.transform((v - start) / (end - start));
  }

  double _bump(double v, double start, double end) {
    if (v <= start || v >= end) return 0.0;
    return sin(((v - start) / (end - start)) * pi);
  }

  Widget _buildFightCard(Combatant god, Color accent,
      {required bool isLeft, required bool isWinner, required bool isFight,
      required double phase, required double jolt, required double reveal}) {
    final toward = isLeft ? 1.0 : -1.0;
    double dx = 0, scale = 1.0, rot = 0;

    // Tension: slight shake
    if (phase < 0.25) {
      dx += sin(phase / 0.25 * pi * 16) * 3;
    }

    // Clash: lunge toward center
    final clashing = _bump(phase, 0.25, 0.50);
    dx += toward * 35 * clashing;
    scale += 0.06 * clashing;
    rot += toward * 0.04 * clashing;

    // Jolt from hits (struggle)
    dx += toward * 28 * jolt;
    scale += 0.08 * jolt;
    rot += toward * 0.06 * jolt;

    // Final blow
    final blow = _bump(phase, 0.83, 0.92);
    dx += toward * 40 * blow;
    scale += 0.12 * blow;
    rot += toward * 0.05 * blow;

    // Reveal: winner rises, loser sinks
    if (isWinner) {
      dx += 0; // stays center
      scale += 0.1 * reveal;
    } else {
      scale -= 0.12 * reveal;
    }

    return Transform.translate(
      offset: Offset(dx, isWinner ? -25 * reveal : 20 * reveal),
      child: Transform.rotate(
        angle: rot,
        child: Transform.scale(
          scale: scale.clamp(0.4, 1.8),
          child: Container(
            width: 120,
            height: 204,
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isWinner && reveal > 0.5
                    ? const Color(0xFFFFD700)
                    : accent.withValues(alpha: 0.4),
                width: 1 + (isWinner ? reveal * 2.5 : 0),
              ),
              boxShadow: [
                if (isWinner && reveal > 0.3)
                  BoxShadow(
                    color: const Color(0xFFFFD700).withValues(alpha: reveal * 0.5),
                    blurRadius: 20 * reveal,
                    spreadRadius: 4 * reveal,
                  ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: god.imageUrl.startsWith('assets/')
                            ? Image.asset(god.imageUrl, fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (_, __, ___) =>
                                    _placeholderGod(god, accent))
                            : _placeholderGod(god, accent),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              accent.withValues(alpha: 0.45),
                              GodCard.mythologyColor(god.mythology).withValues(alpha: 0.2),
                            ],
                          ),
                        ),
                        child: Text(
                          god.name,
                          style: GodCard.mythologyFont(god.mythology,
                              fontSize: 12, fontWeight: FontWeight.w800,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  // Loser dim overlay
                  Opacity(
                    opacity: reveal.clamp(0, 1) * (isWinner ? 0 : 0.6),
                    child: const ColoredBox(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVSCore(double v, double energy) {
    final opacity = 0.5 + energy * 0.5;
    final pulse = 1 + sin(v * pi * 10) * 0.12;
    final size = (44 + energy * 24) * pulse;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [
          const Color(0xFFFFF3E0).withValues(alpha: 0.9),
          const Color(0xFFFF6F00).withValues(alpha: 0.5 * opacity),
          const Color(0xFFFF3D00).withValues(alpha: 0.0),
        ]),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6F00).withValues(alpha: 0.4 + energy * 0.5),
            blurRadius: 20 + energy * 28,
            spreadRadius: 3 + energy * 10,
          ),
        ],
      ),
      child: Text('VS', style: AppFonts.cinzel(
        fontSize: 14 + energy * 6,
        fontWeight: FontWeight.w900,
        color: Colors.white,
      )),
    );
  }

  List<Widget> _buildRings(double energy) {
    return List.generate(3, (i) {
      final offset = i * 0.12;
      final e = (energy - offset).clamp(0.0, 1.0);
      if (e <= 0) return const SizedBox.shrink();
      final size = 30 + e * (80 + i * 40);
      return Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color.lerp(const Color(0xFFFFD700),
                      const Color(0xFFFF3D00), i / 2)!
                  .withValues(alpha: (1 - e) * 0.6),
              width: 2.5 - i * 0.6,
            ),
          ),
        ),
      );
    });
  }

  // ─── Selection View ─────────────────────────────────────
  Widget _buildSelectionView(String lang) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildGodSlot(1, lang)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF6F00), Color(0xFFFF3D00)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF6F00).withValues(alpha: 0.4),
                              blurRadius: 16,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'VS',
                            style: AppFonts.cinzel(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: _buildGodSlot(2, lang)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: (_god1 != null && _god2 != null) ? _startBattle : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: (_god1 != null && _god2 != null) ? 16 : 12,
              ),
              decoration: BoxDecoration(
                gradient: (_god1 != null && _god2 != null)
                    ? const LinearGradient(
                        colors: [Color(0xFFFF6F00), Color(0xFFFF3D00)],
                      )
                    : null,
                color: (_god1 != null && _god2 != null)
                    ? null
                    : const Color(0xFF222222),
                borderRadius: BorderRadius.circular(14),
                boxShadow: (_god1 != null && _god2 != null)
                    ? [
                        BoxShadow(
                          color: const Color(0xFFFF6F00).withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  _god1 != null && _god2 != null
                      ? 'FIGHT!'
                      : lang == 'id'
                          ? 'Pilih Dewamu'
                          : 'Choose Your Gods',
                  style: AppFonts.cinzel(
                    fontSize: (_god1 != null && _god2 != null) ? 18 : 13,
                    fontWeight: FontWeight.w800,
                    color: (_god1 != null && _god2 != null)
                        ? Colors.white
                        : Colors.white70,
                    letterSpacing: (_god1 != null && _god2 != null) ? 2 : 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Random battle — pick two combatants at random and fight instantly.
          GestureDetector(
            onTap: _randomFight,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(14),
                border:
                    Border.all(color: const Color(0xFFB07800).withValues(alpha: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.casino_rounded,
                      color: Color(0xFFB07800), size: 18),
                  const SizedBox(width: 8),
                  Text(
                    lang == 'id' ? 'Acak Pertarungan' : 'Random Battle',
                    style: AppFonts.cinzel(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFB07800),
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _randomFight() {
    final pool = <Combatant>[
      ...godsData.where((g) => g.category != 'Cosmology'),
      ...popCultureCombatants,
    ]..shuffle();
    setState(() {
      _god1 = pool[0];
      _god2 = pool[1];
      _result = null;
      _showResult = false;
    });
    _startBattle();
  }

  // ─── God Slot ───────────────────────────────────────────
  Widget _buildGodSlot(int slot, String lang) {
    final god = slot == 1 ? _god1 : _god2;
    final accent = slot == 1
        ? const Color(0xFF2196F3)
        : const Color(0xFFFF3D00);

    return GestureDetector(
      onTap: () => _pickGod(slot),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: god != null
                ? accent.withValues(alpha: 0.6)
                : const Color(0xFF333333),
            width: god != null ? 2 : 1,
          ),
        ),
        child: god != null
            ? _buildFilledSlot(god, accent, lang)
            : _buildEmptySlot(slot, lang),
      ),
    );
  }

  Widget _buildEmptySlot(int slot, String lang) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_outline_rounded,
              color: Colors.white.withValues(alpha: 0.3), size: 48),
          const SizedBox(height: 8),
          Text(
            slot == 1
                ? (lang == 'id' ? 'Pilih Dewa 1' : 'Pick God 1')
                : (lang == 'id' ? 'Pilih Dewa 2' : 'Pick God 2'),
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.4),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilledSlot(Combatant god, Color accent, String lang) {
    final url = god.imageUrl;
    final color = GodCard.mythologyColor(god.mythology);

    return Column(
      children: [
        Expanded(
          flex: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: url.startsWith('assets/')
                ? Image.asset(url,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => _placeholderGod(god, accent))
                : _placeholderGod(god, accent),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [accent.withValues(alpha: 0.4), color.withValues(alpha: 0.2)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  god.name,
                  style: GodCard.mythologyFont(
                    god.mythology,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  god.mythology,
                  style: TextStyle(
                    color: accent,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWinnerCard(Combatant god, Color accent, String lang) {
    final url = god.imageUrl;
    const gold = Color(0xFFFFD700);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        gradient: const LinearGradient(
          colors: [gold, Color(0xFFB8860B), gold],
        ),
        boxShadow: [
          BoxShadow(
            color: gold.withValues(alpha: 0.45),
            blurRadius: 22,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF0D0D0D),
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [accent.withValues(alpha: 0.35), accent.withValues(alpha: 0.08)],
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 76,
                height: 96,
                child: url.startsWith('assets/')
                    ? Image.asset(url,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholderGod(god, accent))
                    : _placeholderGod(god, accent),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        lang == 'id' ? 'PEMENANG' : 'WINNER',
                        style: AppFonts.cinzel(
                          color: gold,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    god.name,
                    style: GodCard.mythologyFont(
                      god.mythology,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    god.localizedTitle(lang),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11.5,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: accent.withValues(alpha: 0.6)),
                    ),
                    child: Text(
                      god.mythology,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9.5,
                        fontWeight: FontWeight.w700,
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

  Widget _placeholderGod(Combatant god, Color accent) {
    return Container(
      width: double.infinity,
      color: accent.withValues(alpha: 0.08),
      child: Center(
        child: Text(
          god.name[0],
          style: GodCard.mythologyFont(
            god.mythology,
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: accent.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }

  // ─── Result View ────────────────────────────────────────
  Widget _buildResultView(String lang) {
    final r = _result!;
    final winnerColor = GodCard.mythologyColor(r.winner.mythology);
    final loserColor = GodCard.mythologyColor(r.loser.mythology);

    return FadeTransition(
      opacity: _resultCtrl,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.05),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: _resultCtrl,
          curve: Curves.easeOutCubic,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 12),
              // Winner spotlight card
              _buildWinnerCard(r.winner, winnerColor, lang),
              const SizedBox(height: 10),
              // Win-probability comparison
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildScoreBar(
                        r.winner.name, r.winnerProbability, winnerColor, true),
                    const SizedBox(height: 8),
                    _buildScoreBar(
                        r.loser.name, 1 - r.winnerProbability, loserColor, false),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Powers comparison
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D0D0D),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF222222)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section header + myth badge
                        Row(
                          children: [
                            Text(
                              lang == 'id' ? 'FAKTOR PENENTU' : 'KEY FACTORS',
                              style: AppFonts.cinzel(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFFFD700),
                                letterSpacing: 2,
                              ),
                            ),
                            if (r.isCanonical) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFD700).withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xFFFFD700).withValues(alpha: 0.5)),
                                ),
                                child: Text(
                                  lang == 'id' ? 'KISAH MITOLOGI' : 'MYTH-ATTESTED',
                                  style: const TextStyle(
                                    color: Color(0xFFFFD700),
                                    fontSize: 8.5,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Structured "why" factor tiles
                        ...r.factors.map((f) => _buildFactorTile(f, lang)),
                        const SizedBox(height: 8),
                        // Full narrative chronicle
                        Text(
                          lang == 'id' ? 'KRONIK PERTARUNGAN' : 'BATTLE CHRONICLE',
                          style: AppFonts.cinzel(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF9CA3AF),
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          r.explanation(lang),
                          style: const TextStyle(
                            color: Color(0xFFDDDDDD),
                            fontSize: 12.5,
                            height: 1.55,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Divider(color: Colors.white.withValues(alpha: 0.08), height: 1),
                        const SizedBox(height: 14),
                        _buildPowersSection(r.winner, winnerColor, lang),
                        const SizedBox(height: 12),
                        _buildPowersSection(r.loser, loserColor, lang),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Rematch button
              GestureDetector(
                onTap: _resetBattle,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: const Color(0xFFB07800).withValues(alpha: 0.3)),
                  ),
                  child: Center(
                    child: Text(
                      lang == 'id' ? 'ADU LAGI' : 'REMATCH',
                      style: AppFonts.cinzel(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFB07800),
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Colored icon + title + description for one structured reason.
  Widget _buildFactorTile(BattleFactor f, String lang) {
    IconData icon;
    Color color;
    switch (f.kind) {
      case 'myth':
        icon = Icons.auto_stories_rounded;
        color = const Color(0xFFFFD700);
        break;
      case 'domain':
        icon = Icons.bolt_rounded;
        color = const Color(0xFF4FC3F7);
        break;
      case 'status':
        icon = Icons.military_tech_rounded;
        color = const Color(0xFFFF8A65);
        break;
      default: // balance
        icon = Icons.balance_rounded;
        color = const Color(0xFFB0BEC5);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 17),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  f.title(lang),
                  style: TextStyle(
                    color: color,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  f.desc(lang),
                  style: const TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: 11.5,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreBar(String name, double probability, Color color, bool isWinner) {
    final pct = (probability * 100).round();

    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            name,
            style: TextStyle(
              color: isWinner ? Colors.white : const Color(0xFF9CA3AF),
              fontSize: 11,
              fontWeight: isWinner ? FontWeight.w700 : FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: probability.clamp(0.0, 1.0),
              minHeight: 10,
              backgroundColor: const Color(0xFF222222),
              valueColor: AlwaysStoppedAnimation<Color>(
                isWinner ? color : color.withValues(alpha: 0.4),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 38,
          child: Text(
            '$pct%',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: isWinner ? Colors.white : const Color(0xFF666666),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPowersSection(Combatant god, Color color, String lang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          god.name,
          style: GodCard.mythologyFont(
            god.mythology,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: god.localizedPowers(lang).map((p) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color.withValues(alpha: 0.3)),
              ),
              child: Text(
                p,
                style: TextStyle(
                  color: color,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ─── God Picker Bottom Sheet ────────────────────────────────
class _GodPickerSheet extends StatefulWidget {
  final Combatant? exclude;
  final ValueChanged<Combatant> onPick;

  const _GodPickerSheet({required this.onPick, this.exclude});

  @override
  State<_GodPickerSheet> createState() => _GodPickerSheetState();
}

class _GodPickerSheetState extends State<_GodPickerSheet> {
  String _filter = 'All';
  String _query = '';
  final _ctrl = TextEditingController();

  static const _mythologies = [
    'All',
    'Greek',
    'Egyptian',
    'Nordic',
    'Hindu',
    'Chinese',
    'Japanese',
    'Pop Culture',
  ];

  // Full roster: every god (except non-combatant places) plus the
  // pop-culture characters, so either can be pitted against the other.
  static final List<Combatant> _roster = [
    ...godsData.where((g) => g.category != 'Cosmology'),
    ...popCultureCombatants,
  ];

  List<Combatant> get _filtered {
    return _roster.where((g) {
      if (widget.exclude != null && g.id == widget.exclude!.id) return false;
      if (_filter == 'Pop Culture') {
        if (!g.isPopCulture) return false;
      } else if (_filter != 'All' && g.mythology != _filter) {
        return false;
      }
      if (_query.isNotEmpty) {
        final q = _query.toLowerCase();
        return g.name.toLowerCase().contains(q) ||
            g.title.toLowerCase().contains(q);
      }
      return true;
    }).toList();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    final topPadding = MediaQuery.of(context).padding.top;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      expand: false,
      builder: (_, scrollCtrl) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF111111),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8 + topPadding * 0.0),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF444444),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Pilih Dewa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _ctrl,
                  onChanged: (v) => setState(() => _query = v),
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Cari dewa...',
                    hintStyle: TextStyle(
                        color: Colors.white.withValues(alpha: 0.3), fontSize: 13),
                    prefixIcon: Icon(Icons.search,
                        color: Colors.white.withValues(alpha: 0.3), size: 18),
                    filled: true,
                    fillColor: const Color(0xFF1A1A1A),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 34,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _mythologies.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 6),
                  itemBuilder: (_, i) {
                    final m = _mythologies[i];
                    final active = _filter == m;
                    final color = GodCard.mythologyColor(m == 'All' ? 'Greek' : m);
                    return GestureDetector(
                      onTap: () => setState(() => _filter = m),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: active
                              ? color.withValues(alpha: 0.3)
                              : const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: active
                                ? color.withValues(alpha: 0.6)
                                : const Color(0xFF333333),
                          ),
                        ),
                        child: Text(
                          m == 'All' ? 'Semua' : m,
                          style: TextStyle(
                            color: active ? color : const Color(0xFF9CA3AF),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  controller: scrollCtrl,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 4),
                  itemBuilder: (_, i) {
                    final g = filtered[i];
                    final color = GodCard.mythologyColor(g.mythology);
                    return GestureDetector(
                      onTap: () => widget.onPick(g),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: color.withValues(alpha: 0.25)),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: 40,
                                height: 48,
                                child: g.imageUrl.startsWith('assets/')
                                    ? Image.asset(g.imageUrl,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                        errorBuilder: (_, __, ___) => Container(
                                            color: color.withValues(alpha: 0.12)))
                                    : Container(
                                        color: color.withValues(alpha: 0.12)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          g.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      if (g.isPopCulture) ...[
                                        const SizedBox(width: 6),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 1),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFB07800)
                                                .withValues(alpha: 0.2),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: const Text(
                                            'POP',
                                            style: TextStyle(
                                              color: Color(0xFFB07800),
                                              fontSize: 8,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    g.isPopCulture
                                        ? '${g.mythology} · ${g.title}'
                                        : '${g.mythology} · ${g.category}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: color,
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.chevron_right,
                                color: Colors.white.withValues(alpha: 0.2),
                                size: 18),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─── Energy clash painter ───────────────────────────────────
// Draws a clean, bold impact flash at the collision point: a bright core
// flare plus a symmetric 8-point impact star (4 long cardinal spikes + 4
// shorter diagonals), like the "clash" hit-spark in a fighting game. All
// motion is derived deterministically from [phase] (no per-frame randomness),
// so it reads as a designed impact rather than particle noise.
class _ClashPainter extends CustomPainter {
  final double energy; // 0..1 intensity of the clash right now
  final double phase; // 0..1 overall battle progress
  final Color colorA;
  final Color colorB;

  _ClashPainter({
    required this.energy,
    required this.phase,
    required this.colorA,
    required this.colorB,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final e = energy.clamp(0.0, 1.0);
    if (e <= 0.01) return;
    final center = Offset(size.width / 2, size.height / 2);
    final tint = Color.lerp(colorA, colorB, 0.5)!;

    // Bold core flare — a single bright burst, no particle noise.
    final coreR = 18 + e * 58;
    final corePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.white.withValues(alpha: 0.95 * e),
          tint.withValues(alpha: 0.55 * e),
          tint.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.45, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: coreR));
    canvas.drawCircle(center, coreR, corePaint);

    // Symmetric impact star: filled tapered spikes from the center.
    void spike(double angle, double length, double halfWidth, Color c) {
      final dir = Offset(cos(angle), sin(angle));
      final perp = Offset(-sin(angle), cos(angle));
      final tip = center + dir * length;
      final b1 = center + perp * halfWidth;
      final b2 = center - perp * halfWidth;
      final path = Path()
        ..moveTo(b1.dx, b1.dy)
        ..lineTo(tip.dx, tip.dy)
        ..lineTo(b2.dx, b2.dy)
        ..close();
      canvas.drawPath(path, Paint()..color = c);
    }

    final longLen = 46 + e * 168;
    final shortLen = longLen * 0.52;
    final hw = 5 + e * 10;
    final spin = phase * 0.5; // slow, controlled rotation — not chaotic
    for (int i = 0; i < 4; i++) {
      final a = spin + i * (pi / 2);
      // Long white cardinal spikes.
      spike(a, longLen, hw, Colors.white.withValues(alpha: 0.92 * e));
      // Shorter color-tinted diagonal spikes.
      spike(a + pi / 4, shortLen, hw * 0.6, tint.withValues(alpha: 0.8 * e));
    }
  }

  @override
  bool shouldRepaint(covariant _ClashPainter old) =>
      old.energy != energy || old.phase != phase;
}
