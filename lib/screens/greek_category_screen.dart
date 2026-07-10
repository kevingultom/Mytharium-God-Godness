import 'package:flutter/material.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'category_god_list_screen.dart';

class GreekCategoryScreen extends StatelessWidget {
  const GreekCategoryScreen({super.key});

  static const _mythology = 'Greek';

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
                    label: 'Olympians',
                    category: 'Olympian',
                    subtitle: id
                        ? 'Dua Belas dewa utama Gunung Olympus'
                        : 'The Twelve chief gods of Mount Olympus',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: 'Primordial',
                    category: 'Primordial',
                    subtitle: id
                        ? 'Generasi awal pembentuk alam semesta'
                        : 'The first generation of the cosmos',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: 'Titans',
                    category: 'Titan',
                    subtitle: id
                        ? 'Generasi dewa purba sebelum Olympus'
                        : 'The primordial gods before Olympus',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Dunia Bawah' : 'Underworld',
                    category: 'Underworld',
                    subtitle: id
                        ? 'Para penguasa alam kematian'
                        : 'Rulers of the realm of the dead',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Dewa Laut' : 'Sea Gods',
                    category: 'Sea',
                    subtitle: id
                        ? 'Dewa & tokoh lautan'
                        : 'Deities & figures of the sea',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Pahlawan' : 'Heroes',
                    category: 'Hero',
                    subtitle: id
                        ? 'Pahlawan & manusia setengah dewa'
                        : 'Heroes & demigods',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Monster' : 'Monsters',
                    category: 'Monster',
                    subtitle: id
                        ? 'Monster & makhluk legendaris'
                        : 'Legendary monsters & creatures',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Kosmologi' : 'Cosmology',
                    category: 'Cosmology',
                    subtitle: id
                        ? 'Tempat & elemen dunia mitologi'
                        : 'Realms & places of the myth',
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
                  'GREEK',
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
                      ? 'Pilih kategori dewa Yunani'
                      : 'Choose a category of Greek gods',
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
