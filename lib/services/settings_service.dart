import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  static const _dailyRemindersKey = 'setting_daily_reminders';
  static const _soundEffectsKey = 'setting_sound_effects';
  static const _hapticsKey = 'setting_haptics';

  static Future<bool> getDailyReminders() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_dailyRemindersKey) ?? false;
  }

  static Future<void> setDailyReminders(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_dailyRemindersKey, value);
  }

  static Future<bool> getSoundEffects() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_soundEffectsKey) ?? true;
  }

  static Future<void> setSoundEffects(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_soundEffectsKey, value);
  }

  static Future<bool> getHaptics() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hapticsKey) ?? true;
  }

  static Future<void> setHaptics(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hapticsKey, value);
  }
}
