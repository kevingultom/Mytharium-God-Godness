import 'package:flutter/material.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'immersive_god_list_screen.dart';

class HinduCategoryScreen extends StatelessWidget {
  const HinduCategoryScreen({super.key});

  static const _mythology = 'Hindu';

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
                    label: 'Trimurti',
                    category: 'Trimurti',
                    subtitle: localize(lang, 'Tiga Dewa Utama Hindu', 'The Three Supreme Gods'),
                    imagePath: 'assets/images/Hindu/Category/triwurti.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: 'Tridevi',
                    category: 'Tridevi',
                    subtitle: localize(lang, 'Tiga Dewi Pendamping Trimurti', 'The Three Supreme Goddesses'),
                    imagePath: 'assets/images/Hindu/Category/tridevi.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Dewi', 'Devi'),
                    category: 'Devi',
                    subtitle: localize(lang, 'Wujud dahsyat energi feminin ilahi', 'Fierce forms of the divine feminine'),
                    imagePath: 'assets/images/Hindu/Category/devi.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Dashavatara', 'Dashavatara'),
                    category: 'Avatar',
                    subtitle: localize(lang, 'Sepuluh Avatar Vishnu', 'The Ten Avatars of Vishnu'),
                    imagePath: 'assets/images/Hindu/Category/dashavatara.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Dewa-Dewi', 'Devas'),
                    category: 'Devas',
                    subtitle: localize(lang, 'Dewa & Dewi penting lainnya', 'Other important gods and goddesses'),
                    imagePath: 'assets/images/Hindu/Category/devas.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Tokoh', 'Figures'),
                    category: 'Figures',
                    subtitle: localize(lang, 'Tokoh penting dalam epos Hindu', 'Important figures of Hindu epics'),
                    imagePath: 'assets/images/Hindu/Category/figures.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Makhluk Mitologi', 'Creatures'),
                    category: 'Creature',
                    subtitle: localize(lang, 'Naga, Garuda & makhluk sakti lainnya', 'Nagas, Garuda & other mystical beings'),
                    imagePath: 'assets/images/Hindu/Category/creatures.webp',
                  ),
                  const SizedBox(height: 10),
                  _buildCategoryCard(
                    context,
                    color: color,
                    label: localize(lang, 'Kosmologi', 'Cosmology'),
                    category: 'Cosmology',
                    subtitle: localize(lang, 'Konsep kosmis & siklus zaman', 'Cosmic concepts & cycles of ages'),
                    imagePath: 'assets/images/Hindu/Category/cosmology.webp',
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
            'HINDU',
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
            localize(lang, 'Pilih kategori dewa Hindu', 'Choose a category of Hindu gods'),
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
