import 'package:flutter/material.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'immersive_god_list_screen.dart';

class ChineseCategoryScreen extends StatelessWidget {
  const ChineseCategoryScreen({super.key});

  static const _mythology = 'Chinese';

  void _openCategory(BuildContext context, String category, String label) {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => ImmersiveGodListScreen(
          mythology: _mythology,
          category: category,
          titleLabel: label,
        ),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final color = GodCard.mythologyColor(_mythology);

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
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                _buildHeader(context, color, lang),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Istana Surga', 'Heavenly Court'),
                    category: 'Court',
                    subtitle: localize(lang, 'Penguasa surga & birokrasi langit', 'Rulers of Heaven & the celestial bureaucracy'),
                    imagePath: 'assets/images/Chinese/Category/court.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Dewa Purba', 'Primordial'),
                    category: 'Primordial',
                    subtitle: localize(lang, 'Pencipta alam semesta & peradaban', 'Creators of the universe & civilization'),
                    imagePath: 'assets/images/Chinese/Category/primordial.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Dewa Alam', 'Nature Gods'),
                    category: 'Nature',
                    subtitle: localize(lang, 'Naga laut, petir, hujan & angin', 'Sea dragons, thunder, rain & wind'),
                    imagePath: 'assets/images/Chinese/Category/nature.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Dunia Bawah', 'Underworld'),
                    category: 'Underworld',
                    subtitle: localize(lang, 'Diyu, penghakiman & reinkarnasi', 'Diyu, judgment & reincarnation'),
                    imagePath: 'assets/images/Chinese/Category/underworld.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Pahlawan & Tokoh', 'Hero & Figures'),
                    category: 'Hero',
                    subtitle: localize(lang, 'Tokoh legendaris & manusia abadi', 'Legendary figures & immortals'),
                    imagePath: 'assets/images/Chinese/Category/heroe.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Makhluk Mitologi', 'Monster & Creature'),
                    category: 'Creature',
                    subtitle: localize(lang, 'Naga, phoenix & makhluk sakti lainnya', 'Dragons, phoenixes & other mystical beings'),
                    imagePath: 'assets/images/Chinese/Category/monster.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Kosmologi', 'Cosmology'),
                    category: 'Cosmology',
                    subtitle: localize(lang, 'Alam, gunung suci & tempat mitologis', 'Realms, sacred mountains & mythic places'),
                    imagePath: 'assets/images/Chinese/Category/cosmology.webp',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Color color, String lang) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'CHINESE',
            textAlign: TextAlign.center,
            style: GodCard.mythologyFont(
              _mythology,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            localize(lang, 'Pilih kategori dewa Tiongkok', 'Choose a category of Chinese gods'),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required Color color,
    required String label,
    required String category,
    required String subtitle,
    String? imagePath,
  }) {
    return GestureDetector(
      onTap: () => _openCategory(context, category, label),
      child: Container(
        width: double.infinity,
        height: 90,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color.withValues(alpha: 0.32), color.withValues(alpha: 0.08)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              )
            else
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withValues(alpha: 0.32), color.withValues(alpha: 0.08)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withValues(alpha: 0.6), Colors.black.withValues(alpha: 0.2)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: GodCard.mythologyFont(
                      _mythology,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white, fontSize: 11, height: 1.25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
