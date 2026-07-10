import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      case 'all': return 'All Mythologies';
      default: return '';
    }
  }

  Color get _genreColor {
    switch (genre) {
      case 'greek': return const Color(0xFF6B1013);
      case 'nordic': return const Color(0xFF2563EB);
      case 'egyptian': return const Color(0xFFD97706);
      case 'hindu': return const Color(0xFFFF6F00);
      case 'all': return const Color(0xFFB07800);
      default: return const Color(0xFFB07800);
    }
  }

  String _rank(String lang) {
    final pct = score / total;
    if (pct == 1.0) return lang == 'id' ? 'Sempurna! Dewa sejati!' : 'Perfect! A true god!';
    if (pct >= 0.8) return lang == 'id' ? 'Luar biasa! Hampir dewa!' : 'Amazing! Almost divine!';
    if (pct >= 0.6) return lang == 'id' ? 'Bagus! Pengetahuan solid' : 'Good! Solid knowledge';
    if (pct >= 0.4) return lang == 'id' ? 'Lumayan, terus belajar' : 'Decent, keep learning';
    return lang == 'id' ? 'Masih banyak yang harus dipelajari' : 'Much to learn still';
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final color = _genreColor;
    final pct = (score / total * 100).round();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              // Back
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
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
              ),
              const SizedBox(height: 32),
              // Score circle
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withValues(alpha: 0.12),
                  border: Border.all(color: color, width: 3),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$pct%',
                      style: GoogleFonts.cinzel(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: color,
                      ),
                    ),
                    Text(
                      '$score/$total',
                      style: TextStyle(
                        color: color.withValues(alpha: 0.7),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _genreTitle,
                style: GoogleFonts.cinzel(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: color,
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
              _statRow(lang == 'id' ? 'Benar' : 'Correct', '$score', const Color(0xFF22C55E)),
              _statRow(lang == 'id' ? 'Salah' : 'Wrong', '${total - score}', const Color(0xFFEF4444)),
              _statRow(lang == 'id' ? 'Soal' : 'Questions', '$total', const Color(0xFF9CA3AF)),
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
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    lang == 'id' ? 'COBA LAGI' : 'TRY AGAIN',
                    style: GoogleFonts.cinzel(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
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
                  lang == 'id' ? 'Kembali ke Menu Kuis' : 'Back to Quiz Menu',
                  style: TextStyle(
                    color: color,
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
