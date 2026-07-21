import 'package:flutter/material.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'immersive_god_list_screen.dart';

class GreekCategoryScreen extends StatelessWidget {
  const GreekCategoryScreen({super.key});

  static const _mythology = 'Greek';

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
                    label: 'Olympians',
                    category: 'Olympian',
                    imagePath: 'assets/images/Greek/Category/olympians.webp',
                    subtitle: localize(lang, 'Dua Belas dewa utama Gunung Olympus', 'The Twelve chief gods of Mount Olympus')
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: 'Primordial',
                    category: 'Primordial',
                    imagePath: 'assets/images/Greek/Category/primordial.webp',
                    subtitle: localize(lang, 'Generasi awal pembentuk alam semesta', 'The first generation of the cosmos')
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: 'Titans',
                    category: 'Titan',
                    imagePath: 'assets/images/Greek/Category/titans.webp',
                    subtitle: localize(lang, 'Generasi dewa purba sebelum Olympus', 'The primordial gods before Olympus')
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Dunia Bawah', 'Underworld'),
                    category: 'Underworld',
                    imagePath: 'assets/images/Greek/Category/underworld.webp',
                    subtitle: localize(lang, 'Para penguasa alam kematian', 'Rulers of the realm of the dead')
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Dewa Laut', 'Sea Gods'),
                    category: 'Sea',
                    imagePath: 'assets/images/Greek/Category/sea.webp',
                    subtitle: localize(lang, 'Dewa & tokoh lautan', 'Deities & figures of the sea')
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Pahlawan', 'Heroes'),
                    category: 'Hero',
                    imagePath: 'assets/images/Greek/Category/hero.webp',
                    subtitle: localize(lang, 'Pahlawan & manusia setengah dewa', 'Heroes & demigods')
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Monster', 'Monsters'),
                    category: 'Monster',
                    imagePath: 'assets/images/Greek/Category/monster.webp',
                    subtitle: localize(lang, 'Monster & makhluk legendaris', 'Legendary monsters & creatures')
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Kosmologi', 'Cosmology'),
                    category: 'Cosmology',
                    imagePath: 'assets/images/Greek/Category/cosmology.webp',
                    subtitle: localize(lang, 'Tempat & elemen dunia mitologi', 'Realms & places of the myth')
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
            'GREEK',
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
            localize(lang, 'Pilih kategori dewa Yunani', 'Choose a category of Greek gods'),
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
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () => _openCategory(context, category, label),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            alignment: Alignment.center,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.35),
              BlendMode.darken,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
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
      ),
    );
  }
}
