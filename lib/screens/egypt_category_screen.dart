import 'package:flutter/material.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'category_god_list_screen.dart';

class EgyptCategoryScreen extends StatelessWidget {
  const EgyptCategoryScreen({super.key});

  static const _mythology = 'Egyptian';

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
            _buildHeader(context, lang),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                children: [
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: 'Ennead',
                    category: 'Ennead',
                    subtitle: id
                        ? 'Sembilan dewa utama Heliopolis'
                        : 'The Nine Great Gods of Heliopolis',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Matahari & Langit' : 'Sun & Sky',
                    category: 'Sun',
                    subtitle: id
                        ? 'Dewa-dewi matahari & langit'
                        : 'Gods of the sun & the heavens',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Kematian & Dunia Bawah' : 'Death & the Underworld',
                    category: 'Death',
                    subtitle: id
                        ? 'Penjaga Duat & penghakiman jiwa'
                        : 'Guardians of the Duat & soul judgment',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Kesuburan & Sungai Nil' : 'Fertility & the Nile',
                    category: 'Fertility',
                    subtitle: id
                        ? 'Dewa kesuburan, banjir Nil & perlindungan'
                        : 'Gods of fertility, the flood & protection',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Kerajinan & Pengetahuan' : 'Craft & Knowledge',
                    category: 'Craft',
                    subtitle: id
                        ? 'Dewa pencipta, perajin & ilmu'
                        : 'Gods of creation, craft & learning',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Makhluk & Tokoh Khusus' : 'Creatures & Special Figures',
                    category: 'Creature',
                    subtitle: id
                        ? 'Makhluk legendaris & tokoh penting'
                        : 'Legendary beings & important figures',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: id ? 'Kosmologi' : 'Cosmology',
                    category: 'Cosmology',
                    subtitle: id
                        ? 'Tempat & elemen dunia mitologi'
                        : 'Realms & elements of the myth',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String lang) {
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
                  'EGYPTIAN',
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
                      ? 'Pilih kategori dewa Mesir'
                      : 'Choose a category of Egyptian gods',
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
