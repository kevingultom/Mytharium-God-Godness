import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';
import 'quiz_genre_screen.dart';
import 'history_screen.dart';
import 'god_battle_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              // Header
              Text(
                'MYTHOPEDIA',
                style: GoogleFonts.cinzel(
                  color: const Color(0xFFC9A227),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 6,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                lang == 'id'
                    ? 'Pilih menu untuk memulai'
                    : 'Choose a menu to begin',
                style: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              // Language toggle
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    final langN = LanguageProvider.of(context);
                    langN.setLanguage(langN.value == 'id' ? 'en' : 'id');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF333333)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.language, color: Color(0xFFB07800), size: 16),
                        const SizedBox(width: 6),
                        Text(
                          lang == 'id' ? 'EN' : 'ID',
                          style: const TextStyle(
                            color: Color(0xFFB07800),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Menu Cards
              Expanded(
                child: ListView(
                  children: [
                    _MenuCard(
                      title: lang == 'id' ? 'Dewa & Dewi' : 'Gods & Goddesses',
                      subtitle: lang == 'id'
                          ? 'Jelajahi informasi, cari, dan pelajari para dewa'
                          : 'Explore info, search, and learn about the gods',
                      onTap: () {
                        SoundService.playClick();
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const HomeScreen(),
                            transitionsBuilder: (_, anim, __, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: const Duration(milliseconds: 300),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    _MenuCard(
                      title: lang == 'id' ? 'Dewa Mana Kamu?' : "What's Your God?",
                      subtitle: lang == 'id'
                          ? 'Temukan dewa yang cocok denganmu lewat kuis'
                          : 'Find your matching deity through a quiz',
                      onTap: () {
                        SoundService.playClick();
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const QuizScreen(),
                            transitionsBuilder: (_, anim, __, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: const Duration(milliseconds: 300),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    _MenuCard(
                      title: lang == 'id' ? 'Sejarah Mitologi' : 'Mythology History',
                      subtitle: lang == 'id'
                          ? 'Perang, era keemasan, dan kejatuhan peradaban dewa'
                          : 'Wars, golden ages, and the fall of divine civilizations',
                      onTap: () {
                        SoundService.playClick();
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const HistoryScreen(),
                            transitionsBuilder: (_, anim, __, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: const Duration(milliseconds: 300),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    _MenuCard(
                      title: lang == 'id' ? 'Kuis Mitologi' : 'Mythology Quiz',
                      subtitle: lang == 'id'
                          ? 'Uji pengetahuanmu: pilih genre, jawab 10 soal hard'
                          : 'Test your knowledge: pick a genre, answer 10 hard questions',
                      onTap: () {
                        SoundService.playClick();
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const QuizGenreScreen(),
                            transitionsBuilder: (_, anim, __, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: const Duration(milliseconds: 300),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    _MenuCard(
                      title: lang == 'id' ? 'Adu Dewa' : 'God Battle',
                      subtitle: lang == 'id'
                          ? 'Pilih 2 dewa dan adu kekuatan mereka'
                          : 'Pick 2 gods and compare their strength',
                      onTap: () {
                        SoundService.playClick();
                        _showBattleDisclaimer(context, lang);
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBattleDisclaimer(BuildContext context, String lang) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (ctx, a1, a2, child) {
        return FadeTransition(
          opacity: a1,
          child: ScaleTransition(
            scale: CurvedAnimation(parent: a1, curve: Curves.easeOutBack),
            child: child,
          ),
        );
      },
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFB07800).withValues(alpha: 0.3)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Warning icon
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6F00).withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFFF8A00),
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                // Title
                Text(
                  lang == 'id' ? 'Pernyataan Penting' : 'Important Notice',
                  style: GoogleFonts.cinzel(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFFE0E0E0),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 14),
                // Warning text
                Text(
                  lang == 'id'
                      ? 'Fitur "Adu Dewa" dibuat semata-mata untuk hiburan dan edukasi mengenai mitologi.\n\nKami tidak bermaksud untuk menyinggung, menyalahgunakan, atau tidak menghormati dewa-dewi dari berbagai kepercayaan.\n\nGunakan fitur ini dengan bijak dan tetap hormati mitologi yang ada.'
                      : 'The "God Battle" feature is created solely for entertainment and educational purposes about mythology.\n\nWe do not intend to offend, misuse, or disrespect any deities from various beliefs.\n\nUse this feature wisely and remain respectful of existing mythologies.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFAAAAAA),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 24),
                // Buttons
                Row(
                  children: [
                    // Batal
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF333333)),
                          ),
                          child: Center(
                            child: Text(
                              lang == 'id' ? 'Batal' : 'Cancel',
                              style: const TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Lanjut
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const GodBattleScreen(),
                              transitionsBuilder: (_, anim, __, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration: const Duration(milliseconds: 300),
                            ),
                          );
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB07800),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              lang == 'id' ? 'Lanjut' : 'Continue',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  static const _accent = Color(0xFFB07800);

  const _MenuCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _accent.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.cinzel(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 11,
                      height: 1.3,
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
}
