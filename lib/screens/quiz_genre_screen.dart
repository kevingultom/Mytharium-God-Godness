import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
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
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF333333)),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 18),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lang == 'id' ? 'Kuis Mitologi' : 'Mythology Quiz',
                          style: GoogleFonts.cinzel(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          lang == 'id'
                              ? 'Pilih genre, jawab 10 soal acak dari 50'
                              : 'Pick a genre, answer 10 random questions from 50',
                          style: const TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 11,
                          ),
                        ),
                      ],
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
                    subtitle: lang == 'id'
                        ? 'Zeus, Athena, Hades & dewa-dewa Olympus'
                        : 'Zeus, Athena, Hades & the Olympian gods',
                    color: const Color(0xFF6B1013),
                    onTap: () => _startQuiz(context, 'greek', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'Nordic',
                    subtitle: lang == 'id'
                        ? 'Thor, Odin, Loki & dewa-dewa Asgard'
                        : 'Thor, Odin, Loki & the gods of Asgard',
                    color: const Color(0xFF2563EB),
                    onTap: () => _startQuiz(context, 'nordic', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'Egyptian',
                    subtitle: lang == 'id'
                        ? 'Ra, Osiris, Horus & dewa-dewa Mesir'
                        : 'Ra, Osiris, Horus & the gods of Egypt',
                    color: const Color(0xFFD97706),
                    onTap: () => _startQuiz(context, 'egyptian', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'Hindu',
                    subtitle: lang == 'id'
                        ? 'Shiva, Vishnu, Ganesha & Trimurti'
                        : 'Shiva, Vishnu, Ganesha & the Trimurti',
                    color: const Color(0xFFFF6F00),
                    onTap: () => _startQuiz(context, 'hindu', lang),
                  ),
                  const SizedBox(height: 14),
                  _GenreCard(
                    title: 'All Mythologies',
                    subtitle: lang == 'id'
                        ? '20 soal acak dari semua genre, level hard'
                        : '20 random questions from all genres, hard level',
                    color: const Color(0xFFB07800),
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

  void _startQuiz(BuildContext context, String genre, String lang) {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => QuizTriviaScreen(genre: genre),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}

class _GenreCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _GenreCard({
    required this.title,
    required this.subtitle,
    required this.color,
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
          border: Border.all(color: color.withValues(alpha: 0.35)),
          gradient: LinearGradient(
            colors: [color.withValues(alpha: 0.15), const Color(0xFF1A1A1A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: color,
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
            const SizedBox(width: 8),
            Icon(Icons.play_arrow_rounded, color: color, size: 22),
          ],
        ),
      ),
    );
  }
}
