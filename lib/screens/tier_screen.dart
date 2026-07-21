import 'package:flutter/material.dart';
import '../data/gods_data.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
import '../widgets/god_card.dart';
import 'mythology_tier_screen.dart';

/// Codex → Tier: explains what each power tier means, then lets the user
/// drill into a mythology to see which gods fall into which tier.
class TierScreen extends StatelessWidget {
  const TierScreen({super.key});

  static const _mythologies = <({String key, String image})>[
    (key: 'Greek', image: 'assets/images/greek.webp'),
    (key: 'Egyptian', image: 'assets/images/egypt.webp'),
    (key: 'Nordic', image: 'assets/images/nordik.webp'),
    (key: 'Hindu', image: 'assets/images/hindu.webp'),
    (key: 'Chinese', image: 'assets/images/cina.webp'),
    (key: 'Japanese', image: 'assets/images/japanese.webp'),
  ];

  void _openMythology(BuildContext context, String mythology) {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) =>
            MythologyTierScreen(mythology: mythology),
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
                key: const Key('tierScreenList'),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                children: [
                Text(
                  'Tier',
                  textAlign: TextAlign.center,
                  style: AppFonts.cinzel(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  id
                      ? 'Peringkat kekuatan setiap dewa, dari yang paling menentukan nasib dunia hingga penjaga keseimbangan.'
                      : 'A power ranking for every god, from those who decide the fate of the world to the guardians who keep it balanced.',
                  style: const TextStyle(
                      color: Color(0xFF9CA3AF), fontSize: 12.5, height: 1.4),
                ),
                const SizedBox(height: 22),
                Text(
                  id ? 'PILIH MITOLOGI' : 'CHOOSE A MYTHOLOGY',
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  id
                      ? 'Lihat dewa & makhluk tiap mitologi, dikelompokkan per tier.'
                      : 'See each mythology\'s gods and beings, grouped by tier.',
                  style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
                ),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.15,
                  children: [
                    for (final m in _mythologies) _mythologyCard(context, m),
                  ],
                ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mythologyCard(
      BuildContext context, ({String key, String image}) m) {
    final color = GodCard.mythologyColor(m.key);
    final count = godsData.where((g) => g.mythology == m.key).length;
    return GestureDetector(
      onTap: () => _openMythology(context, m.key),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              m.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withValues(alpha: 0.55),
                      const Color(0xFF0E0E0E),
                    ],
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
                  stops: [0.3, 1.0],
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
                    m.key,
                    style: GodCard.mythologyFont(
                      m.key,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      shadows: const [
                        Shadow(color: Colors.black, blurRadius: 8)
                      ],
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text('$count gods',
                      style:
                          const TextStyle(color: Color(0xFFCFCFCF), fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
