import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import '../models/quiz_question_model.dart';
import '../data/quiz_greek_data.dart';
import '../data/quiz_nordic_data.dart';
import '../data/quiz_egyptian_data.dart';
import '../data/quiz_hindu_data.dart';
import '../data/quiz_chinese_data.dart';
import '../data/quiz_japanese_data.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'main_shell.dart';
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

  // The WHOLE quiz shares a single 30-second budget, shown counting down in
  // the top-right — it does not reset between questions. It starts once,
  // right after the pre-quiz countdown, and runs until either the quiz ends
  // normally or it hits zero.
  static const int _totalQuizSeconds = 30;
  int _secondsLeft = _totalQuizSeconds;
  Timer? _timer;

  // "3..2..1..GO" intro before the quiz (and its timer) actually starts.
  bool _preQuizCountdown = true;
  int _countdownNum = 3;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    SoundService.pauseMusic();
    // Belt-and-suspenders alongside the caller's own reset (see
    // quiz_genre_screen.dart) — whichever fires resets the same flag, so
    // it's safe for both to run.
    MainShell.quizActive.value = true;
    final allQuestions = _loadQuestions();
    // Acak soal — 10 untuk genre tunggal, 20 untuk 'all'
    final questionCount = widget.genre == 'all' ? 20 : 10;
    final random = Random();
    final shuffled = List<QuizQuestion>.from(allQuestions)..shuffle(random);
    _questions = shuffled.take(questionCount).toList();
    _startPreQuizCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _countdownTimer?.cancel();
    SoundService.resumeMusic();
    MainShell.quizActive.value = false;
    super.dispose();
  }

  /// Plays "3..2..1..GO" before the first question appears; only once that
  /// finishes does the quiz-wide 30-second timer begin ticking.
  void _startPreQuizCountdown() {
    SoundService.playButton();
    _countdownTimer = Timer.periodic(const Duration(milliseconds: 700), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      if (_countdownNum > 0) {
        SoundService.playButton();
        setState(() => _countdownNum--);
      } else {
        t.cancel();
        setState(() => _preQuizCountdown = false);
        _startTimer();
      }
    });
  }

  /// Starts the single 30-second quiz-wide countdown. Called exactly once,
  /// right after the pre-quiz "3..2..1..GO" intro — NOT on every question,
  /// so answering or advancing never resets it. Keeps ticking regardless of
  /// answered state; when it hits zero the whole quiz ends immediately.
  void _startTimer() {
    _timer?.cancel();
    _secondsLeft = _totalQuizSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      setState(() => _secondsLeft--);
      if (_secondsLeft <= 0) {
        t.cancel();
        // The quiz's whole time budget is spent → end it now.
        _finishQuiz();
      }
    });
  }

  /// Ends the quiz and navigates to the results screen with the current score.
  void _finishQuiz() {
    _timer?.cancel();
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

  List<QuizQuestion> _loadQuestions() {
    switch (widget.genre) {
      case 'greek': return greekQuizData;
      case 'nordic': return nordicQuizData;
      case 'egyptian': return egyptianQuizData;
      case 'hindu': return hinduQuizData;
      case 'chinese': return chineseQuizData;
      case 'japanese': return japaneseQuizData;
      case 'all': return [...greekQuizData, ...nordicQuizData, ...egyptianQuizData, ...hinduQuizData, ...chineseQuizData, ...japaneseQuizData];
      default: return [];
    }
  }

  String get _genreTitle {
    switch (widget.genre) {
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

  void _onAnswer(int index) {
    if (_answered) return;
    // Timer intentionally keeps running after answering — it doesn't freeze.
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
      // Timer is NOT restarted here — it's a single quiz-wide countdown.
    } else {
      _finishQuiz();
    }
  }

  /// Plain countdown in the top-right (no card): white normally, yellow in
  /// the final 10 seconds, red in the final 5.
  Widget _buildTimerBadge() {
    final Color fg;
    if (_secondsLeft <= 5) {
      fg = const Color(0xFFEF4444); // red
    } else if (_secondsLeft <= 10) {
      fg = const Color(0xFFFACC15); // yellow
    } else {
      fg = Colors.white;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.timer_rounded, size: 18, color: fg),
        const SizedBox(width: 5),
        Text(
          '${_secondsLeft.clamp(0, _totalQuizSeconds)}s',
          style: TextStyle(
            color: fg,
            fontSize: 15,
            fontWeight: FontWeight.w800,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }

  /// Full-screen "3..2..1..GO" intro shown before the timer/quiz starts.
  Widget _buildCountdownScreen(String lang) {
    final isGo = _countdownNum <= 0;
    final display = isGo ? localize(lang, 'MULAI!', 'GO!') : '$_countdownNum';
    const green = Color(0xFF22C55E);

    return Scaffold(
      backgroundColor: Colors.black,
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
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _genreTitle,
                      style: AppFonts.cinzel(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      localize(lang, 'Bersiaplah...', 'Get ready...'),
                      style: const TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 36),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      transitionBuilder: (child, anim) => ScaleTransition(
                        scale: anim,
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                      child: Text(
                        display,
                        key: ValueKey(display),
                        style: AppFonts.cinzel(
                          fontSize: isGo ? 56 : 96,
                          fontWeight: FontWeight.w900,
                          color: isGo ? green : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;

    if (_preQuizCountdown) {
      return _buildCountdownScreen(lang);
    }

    final q = _questions[_currentIndex];
    final options = q.localizedOptions(lang);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header — plain back link at top-left, per-question timer at
            // top-right, with the title stacked below.
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      const Spacer(),
                      _buildTimerBadge(),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _genreTitle,
                    style: AppFonts.cinzel(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$_score ${localize(lang, 'benar', 'correct')} · ${_currentIndex + 1}/${_questions.length}',
                    style: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 11,
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
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
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
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${localize(lang, 'Soal', 'Question')} ${_currentIndex + 1}',
                      style: const TextStyle(
                        color: Colors.white,
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _currentIndex < _questions.length - 1
                          ? (localize(lang, 'SELANJUTNYA', 'NEXT'))
                          : (localize(lang, 'LIHAT HASIL', 'VIEW RESULTS')),
                      style: AppFonts.cinzel(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
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
