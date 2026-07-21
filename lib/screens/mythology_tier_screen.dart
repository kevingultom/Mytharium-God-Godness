import 'package:flutter/material.dart';
import '../data/god_tiers.dart';
import '../data/gods_data.dart';
import '../l10n/language_provider.dart';
import '../models/god_model.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
import '../widgets/god_card.dart';
import 'god_detail_screen.dart';

/// Lists every tiered god of [mythology], grouped section-by-section from
/// World-Ender down to Guardian — the "drill-in" destination from
/// [TierScreen]'s mythology picker.
class MythologyTierScreen extends StatelessWidget {
  final String mythology;

  const MythologyTierScreen({super.key, required this.mythology});

  void _openGod(BuildContext context, God god) {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => GodDetailScreen(god: god),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final id = lang == 'id';
    final color = GodCard.mythologyColor(mythology);
    final sections = [
      for (final tier in GodTier.values)
        (tier: tier, gods: _godsInTier(tier)),
    ].where((s) => s.gods.isNotEmpty).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      // Back button is a plain Column child above the list — never inside
      // any scrollable subtree — so it's structurally guaranteed to stay
      // put, unlike a Positioned overlay sitting next to a scroll view.
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back_rounded,
                        color: Colors.white, size: 22),
                    SizedBox(width: 4),
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                children: [
                  Text(
                    mythology.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GodCard.mythologyFont(
                      mythology,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    id
                        ? 'Peringkat kekuatan dewa & makhluk ${mythology == "Chinese" ? "Tiongkok" : mythology == "Japanese" ? "Jepang" : mythology == "Hindu" ? "Hindu" : mythology == "Nordic" ? "Nordik" : mythology == "Egyptian" ? "Mesir" : "Yunani"}'
                        : 'Power ranking of $mythology gods & beings',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color(0xFF9CA3AF), fontSize: 12.5),
                  ),
                  const SizedBox(height: 22),
                  for (final s in sections)
                    _tierSection(context, s.tier, s.gods, color, lang, id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<God> _godsInTier(GodTier tier) {
    final names = namesInTier(mythology, tier);
    return [
      for (final n in names)
        for (final g in godsData)
          if (g.mythology == mythology && g.name == n) g,
    ];
  }

  Widget _tierSection(BuildContext context, GodTier tier, List<God> gods,
      Color mythColor, String lang, bool id) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.military_tech_rounded, color: tier.color, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${tier.label.toUpperCase()}  ·  ${gods.length}',
                      style: TextStyle(
                        color: tier.color,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.4,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      tier.localizedDescription(lang),
                      style: const TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 11.5,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 132,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: gods.length,
              itemBuilder: (context, i) =>
                  _godChip(context, gods[i], tier, mythColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _godChip(
      BuildContext context, God god, GodTier tier, Color mythColor) {
    return GestureDetector(
      onTap: () => _openGod(context, god),
      child: Container(
        width: 92,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (god.imageUrl.startsWith('assets/'))
              Image.asset(
                god.imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (_, __, ___) => Container(
                  color: mythColor.withValues(alpha: 0.12),
                  child: Icon(Icons.shield_moon_rounded,
                      color: mythColor.withValues(alpha: 0.5), size: 32),
                ),
              )
            else
              Container(color: mythColor.withValues(alpha: 0.12)),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.4, 1.0],
                  colors: [Colors.transparent, Colors.black],
                ),
              ),
            ),
            Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              child: Text(
                god.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppFonts.cinzel(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 1.1,
                  shadows: const [Shadow(color: Colors.black, blurRadius: 6)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
