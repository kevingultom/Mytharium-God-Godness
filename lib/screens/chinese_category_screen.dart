import 'package:flutter/material.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'category_god_list_screen.dart';

class ChineseCategoryScreen extends StatelessWidget {
  const ChineseCategoryScreen({super.key});

  static const _mythology = 'Chinese';

  void _openCategory(BuildContext context, String category, String label) {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => CategoryGodListScreen(
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
    final id = lang == 'id';

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, color, lang),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Istana Surga' : 'Heavenly Court',
                    category: 'Court',
                    subtitle: id
                        ? 'Penguasa surga & birokrasi langit'
                        : 'Rulers of Heaven & the celestial bureaucracy',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Dewa Purba' : 'Primordial',
                    category: 'Primordial',
                    subtitle: id
                        ? 'Pencipta alam semesta & peradaban'
                        : 'Creators of the universe & civilization',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Dewa Alam' : 'Nature Gods',
                    category: 'Nature',
                    subtitle: id
                        ? 'Naga laut, petir, hujan & angin'
                        : 'Sea dragons, thunder, rain & wind',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Dunia Bawah' : 'Underworld',
                    category: 'Underworld',
                    subtitle: id
                        ? 'Diyu, penghakiman & reinkarnasi'
                        : 'Diyu, judgment & reincarnation',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Pahlawan & Tokoh' : 'Hero & Figures',
                    category: 'Hero',
                    subtitle: id
                        ? 'Tokoh legendaris & manusia abadi'
                        : 'Legendary figures & immortals',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Makhluk Mitologi' : 'Monster & Creature',
                    category: 'Creature',
                    subtitle: id
                        ? 'Naga, phoenix & makhluk sakti lainnya'
                        : 'Dragons, phoenixes & other mystical beings',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Kosmologi' : 'Cosmology',
                    category: 'Cosmology',
                    subtitle: id
                        ? 'Alam, gunung suci & tempat mitologis'
                        : 'Realms, sacred mountains & mythic places',
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
              child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 16),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CHINESE',
                  style: GodCard.mythologyFont(
                    _mythology,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  lang == 'id'
                      ? 'Pilih kategori dewa Tiongkok'
                      : 'Choose a category of Chinese gods',
                  style: const TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w600),
                ),
              ],
            ),
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
  }) {
    return GestureDetector(
      onTap: () => _openCategory(context, category, label),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withValues(alpha: 0.32), color.withValues(alpha: 0.08)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
