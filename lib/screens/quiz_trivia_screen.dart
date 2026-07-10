import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/quiz_question_model.dart';
import '../data/quiz_greek_data.dart';
import '../data/quiz_nordic_data.dart';
import '../data/quiz_egyptian_data.dart';
import '../data/quiz_hindu_data.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'quiz_trivia_result_screen.dart';

class QuizTriviaScreen extends StatefulWidget {
  final String genre; // 'greek', 'nordic', 'egyptian', 'hindu', 'all'

  const QuizTriviaScreen({super.key, required this.genre});

  @override
  State<QuizTriviaScreen> createState() => _QuizTriviaScreenState();
}

class _QuizTriviaScreenState extends State<QuizTriviaScreen> {
  late List<QuizQuestion> _questions;
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedAnswer;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    final allQuestions = _loadQuestions();
    // Acak soal — 10 untuk genre tunggal, 20 untuk 'all'
    final questionCount = widget.genre == 'all' ? 20 : 10;
    final random = Random();
    final shuffled = List<QuizQuestion>.from(allQuestions)..shuffle(random);
    _questions = shuffled.take(questionCount).toList();
  }

  List<QuizQuestion> _loadQuestions() {
    switch (widget.genre) {
      case 'greek': return greekQuizData;
      case 'nordic': return nordicQuizData;
      case 'egyptian': return egyptianQuizData;
      case 'hindu': return hinduQuizData;
      case 'all': return [...greekQuizData, ...nordicQuizData, ...egyptianQuizData, ...hinduQuizData];
      default: return [];
    }
  }

  String get _genreTitle {
    switch (widget.genre) {
      case 'greek': return 'Greek Mythology';
      case 'nordic': return 'Nordic Mythology';
      case 'egyptian': return 'Egyptian Mythology';
      case 'hindu': return 'Hindu Mythology';
      case 'all': return 'All Mythologies';
      default: return '';
    }
  }

  Color get _genreColor {
    switch (widget.genre) {
      case 'greek': return const Color(0xFF6B1013);
      case 'nordic': return const Color(0xFF2563EB);
      case 'egyptian': return const Color(0xFFD97706);
      case 'hindu': return const Color(0xFFFF6F00);
      case 'all': return const Color(0xFFB07800);
      default: return const Color(0xFFB07800);
    }
  }

  void _onAnswer(int index) {
    if (_answered) return;
    SoundService.playButton();
    setState(() {
      _selectedAnswer = index;
      _answered = true;
      if (index == _questions[_currentIndex].correctIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    SoundService.playButton();
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null;
        _answered = false;
      });
    } else {
      // Selesai → ke hasil
      SoundService.playResult();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => QuizTriviaResultScreen(
            genre: widget.genre,
            score: _score,
            total: _questions.length,
          ),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final q = _questions[_currentIndex];
    final options = q.localizedOptions(lang);
    final color = _genreColor;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
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
                          _genreTitle,
                          style: GoogleFonts.cinzel(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: color,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$_score ${lang == 'id' ? 'benar' : 'correct'} · ${_currentIndex + 1}/${_questions.length}',
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
            const SizedBox(height: 12),
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (_currentIndex + 1) / _questions.length,
                  backgroundColor: const Color(0xFF333333),
                  valueColor: AlwaysStoppedAnimation(color),
                  minHeight: 4,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Question
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // Question number
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${lang == 'id' ? 'Soal' : 'Question'} ${_currentIndex + 1}',
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Question text
                  Text(
                    q.localizedQuestion(lang),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Options
                  ...List.generate(options.length, (i) {
                    final isSelected = _selectedAnswer == i;
                    final isCorrect = i == q.correctIndex;
                    Color bgColor = const Color(0xFF1A1A1A);
                    Color borderColor = const Color(0xFF333333);
                    Color textColor = const Color(0xFFAAAAAA);

                    if (_answered) {
                      if (isCorrect) {
                        bgColor = const Color(0xFF0D3B0D);
                        borderColor = const Color(0xFF22C55E);
                        textColor = const Color(0xFF22C55E);
                      } else if (isSelected && !isCorrect) {
                        bgColor = const Color(0xFF3B0D0D);
                        borderColor = const Color(0xFFEF4444);
                        textColor = const Color(0xFFEF4444);
                      }
                    }

                    return GestureDetector(
                      onTap: _answered ? null : () => _onAnswer(i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? (isCorrect ? const Color(0xFF22C55E) : const Color(0xFFEF4444))
                                    : const Color(0xFF333333),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                String.fromCharCode(65 + i), // A, B, C, D
                                style: TextStyle(
                                  color: isSelected ? Colors.white : const Color(0xFF777777),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                options[i],
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            // Next button
            if (_answered)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: GestureDetector(
                  onTap: _nextQuestion,
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _currentIndex < _questions.length - 1
                          ? (lang == 'id' ? 'SELANJUTNYA' : 'NEXT')
                          : (lang == 'id' ? 'LIHAT HASIL' : 'VIEW RESULTS'),
                      style: GoogleFonts.cinzel(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
