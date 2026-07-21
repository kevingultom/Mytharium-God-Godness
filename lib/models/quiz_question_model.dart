import '../l10n/language_provider.dart';

class QuizQuestion {
  final String question;
  final String questionEn;
  final List<String> options; // 4 pilihan
  final List<String> optionsEn;
  final int correctIndex; // 0-3

  const QuizQuestion({
    required this.question,
    required this.questionEn,
    required this.options,
    required this.optionsEn,
    required this.correctIndex,
  });

  String localizedQuestion(String lang) => localize(lang, question, questionEn);
  List<String> localizedOptions(String lang) => lang == 'en' ? optionsEn : options;
}
