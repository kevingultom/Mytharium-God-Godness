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

  static const _key = 'language_code';

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getString(_key) ?? 'id';
  }

  Future<void> setLanguage(String code) async {
    value = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, code);
  }

  bool get isEnglish => value == 'en';
  bool get isIndonesian => value == 'id';
}
