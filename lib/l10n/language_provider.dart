import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends InheritedNotifier<LanguageNotifier> {
  const LanguageProvider({
    super.key,
    required LanguageNotifier notifier,
    required super.child,
  }) : super(notifier: notifier);

  static LanguageNotifier of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LanguageProvider>()!.notifier!;
  }
}

class LanguageNotifier extends ValueNotifier<String> {
  LanguageNotifier() : super('id');

  /// SharedPreferences key for the persisted language code — also read
  /// directly by NotificationService, which isn't part of the widget tree.
  static const key = 'language_code';

  /// All supported language codes in display order.
  static const supportedLanguages = ['id', 'en'];

  /// Language display names (native script).
  static const displayNames = {
    'id': 'Bahasa Indonesia',
    'en': 'English',
  };

  /// Short labels for the toggle button.
  static const shortLabels = {
    'id': 'ID',
    'en': 'EN',
  };

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(key) ?? 'id';
    value = supportedLanguages.contains(saved) ? saved : 'id';
  }

  Future<void> setLanguage(String code) async {
    if (!supportedLanguages.contains(code)) return;
    value = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, code);
  }

  /// Cycle to the next language in the list.
  Future<void> cycleLanguage() async {
    final idx = supportedLanguages.indexOf(value);
    final next = supportedLanguages[(idx + 1) % supportedLanguages.length];
    await setLanguage(next);
  }

  bool get isEnglish => value == 'en';
  bool get isIndonesian => value == 'id';
}

/// Inline translation helper.
/// Usage: localize(lang, 'Teks ID', 'Text EN')
String localize(String lang, String id, String en) {
  return lang == 'en' ? en : id;
}
