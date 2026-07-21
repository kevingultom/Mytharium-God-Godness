import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';

class QuizTriviaResultScreen extends StatelessWidget {
  final String genre;
  final int score;
  final int total;

  const QuizTriviaResultScreen({
    super.key,
    required this.genre,
    required this.score,
    required this.total,
  });

  String get _genreTitle {
    switch (genre) {
      case 'greek': return 'Greek Mythology';
      case 'nordic': return 'Nordic Mythology';
      case 'egyptian': return 'Egyptian Mythology';
      case 'hindu': return 'Hindu Mythology';
      case 'chinese': return 'Chinese Mythology';
      case 'japanese': return 'Japanese Mythology';
      case 'all': return 'All Mythologies';
      default: return '';
    }
  }

  String _rank(String lang) {
    final pct = score / total;
    if (pct == 1.0) return localize(lang, 'Sempurna! Dewa sejati!', 'Perfect! A true god!');
    if (pct >= 0.8) return localize(lang, 'Luar biasa! Hampir dewa!', 'Amazing! Almost divine!');
    if (pct >= 0.6) return localize(lang, 'Bagus! Pengetahuan solid', 'Good! Solid knowledge');
    if (pct >= 0.4) return localize(lang, 'Lumayan, terus belajar', 'Decent, keep learning');
    return localize(lang, 'Masih banyak yang harus dipelajari', 'Much to learn still');
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final pct = (score / total * 100).round();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Back
              Align(
                alignment: Alignment.centerLeft,
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
              const SizedBox(height: 32),
              // Score circle
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.1),
                  border: Border.all(color: Colors.white, width: 3),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$pct%',
                      style: AppFonts.cinzel(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$score/$total',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _genreTitle,
                style: AppFonts.cinzel(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _rank(lang),
                style: const TextStyle(
                  color: Color(0xFFD1D5DB),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              // Stats
              _statRow(localize(lang, 'Benar', 'Correct'), '$score', const Color(0xFF22C55E)),
              _statRow(localize(lang, 'Salah', 'Wrong'), '${total - score}', const Color(0xFFEF4444)),
              _statRow(localize(lang, 'Soal', 'Questions'), '$total', const Color(0xFF9CA3AF)),
              const SizedBox(height: 28),
              // Retry button
              GestureDetector(
                onTap: () {
                  SoundService.playClick();
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    localize(lang, 'COBA LAGI', 'TRY AGAIN'),
                    style: AppFonts.cinzel(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Back to menu
              GestureDetector(
                onTap: () {
                  SoundService.playClick();
                  Navigator.pop(context); // back to trivia result
                  Navigator.pop(context); // back to genre
                },
                child: Text(
                  localize(lang, 'Kembali ke Menu Kuis', 'Back to Quiz Menu'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statRow(String label, String value, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
          Text(value, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
