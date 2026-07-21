import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'main_shell.dart';
import 'quiz_trivia_screen.dart';

class QuizGenreScreen extends StatelessWidget {
  const QuizGenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header — plain back link, with the title stacked below it,
            // matching the other screens' header convention.
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
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
                  const SizedBox(height: 12),
                  Text(
                    localize(lang, 'Kuis Mitologi', 'Mythology Quiz'),
                    style: AppFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    localize(lang, 'Pilih genre, jawab 10 soal acak', 'Pick a genre, answer 10 random questions'),
                    style: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Genre list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _GenreCard(
                    title: 'Greek',
                    subtitle: localize(lang, 'Zeus, Athena, Hades & dewa-dewa Olympus', 'Zeus, Athena, Hades & the Olympian gods'),
                    color: const Color(0xFF6B1013),
                    imageAsset: 'assets/images/quizgreek.webp',
                    onTap: () => _startQuiz(context, 'greek', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'Nordic',
                    subtitle: localize(lang, 'Thor, Odin, Loki & dewa-dewa Asgard', 'Thor, Odin, Loki & the gods of Asgard'),
                    color: const Color(0xFF2563EB),
                    imageAsset: 'assets/images/nordikquiz.webp',
                    onTap: () => _startQuiz(context, 'nordic', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'Egyptian',
                    subtitle: localize(lang, 'Ra, Osiris, Horus & dewa-dewa Mesir', 'Ra, Osiris, Horus & the gods of Egypt'),
                    color: const Color(0xFFD97706),
                    imageAsset: 'assets/images/egyptquiz.webp',
                    onTap: () => _startQuiz(context, 'egyptian', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'Hindu',
                    subtitle: localize(lang, 'Shiva, Vishnu, Ganesha & Trimurti', 'Shiva, Vishnu, Ganesha & the Trimurti'),
                    color: const Color(0xFFFF6F00),
                    imageAsset: 'assets/images/hinduquiz.webp',
                    onTap: () => _startQuiz(context, 'hindu', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'Chinese',
                    subtitle: localize(lang, 'Sun Wukong, Nezha, Naga & dewa-dewa Tiongkok', 'Sun Wukong, Nezha, Dragons & Chinese gods'),
                    color: const Color(0xFFC8102E),
                    imageAsset: 'assets/images/chinesequiz.webp',
                    onTap: () => _startQuiz(context, 'chinese', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'Japanese',
                    subtitle: localize(lang, 'Amaterasu, Susanoo, Izanagi & dewa-dewa Jepang', 'Amaterasu, Susanoo, Izanagi & Japanese gods'),
                    color: const Color(0xFFDB2763),
                    imageAsset: 'assets/images/japanesequiz.webp',
                    onTap: () => _startQuiz(context, 'japanese', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'All Mythologies',
                    subtitle: localize(lang, '20 soal acak dari semua genre, level hard', '20 random questions from all genres, hard level'),
                    color: const Color(0xFFB07800),
                    imageAsset: 'assets/images/quiz.webp',
                    onTap: () => _startQuiz(context, 'all', lang),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startQuiz(BuildContext context, String genre, String lang) async {
    // Guards against a fast double-tap pushing two QuizTriviaScreen
    // instances (which would let the second one's early pop reset this
    // flag while the first is still open).
    if (MainShell.quizActive.value) return;
    SoundService.playClick();
    MainShell.quizActive.value = true;
    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => QuizTriviaScreen(genre: genre),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
    // Guaranteed to run once QuizTriviaScreen is popped, no matter how —
    // more reliable than trusting the quiz screen's own dispose() alone.
    MainShell.quizActive.value = false;
  }
}

class _GenreCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;
  final String? imageAsset;

  const _GenreCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
    this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(14),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (imageAsset != null)
              Image.asset(
                imageAsset!,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: imageAsset != null ? 0.82 : 0.15),
                    Colors.black.withValues(alpha: imageAsset != null ? 0.65 : 0.0),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: AppFonts.cinzel(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontSize: 11,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.play_arrow_rounded,
                      color: Colors.white, size: 22),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
