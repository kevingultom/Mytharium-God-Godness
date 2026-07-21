import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_auth_service.dart';
import 'firestore_service.dart';

class SettingsService {
  static const _dailyRemindersKey = 'setting_daily_reminders';
  static const _soundEffectsKey = 'setting_sound_effects';
  static const _hapticsKey = 'setting_haptics';

  static bool _dailyReminders = false;
  static bool _soundEffects = true;
  static bool _haptics = true;
  static bool _loaded = false;

  static Future<bool> getDailyReminders() async {
    if (!_loaded) await _loadAll();
    return _dailyReminders;
  }

  static Future<void> setDailyReminders(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_dailyRemindersKey, value);
    _dailyReminders = value;
    _syncToCloud();
  }

  static Future<bool> getSoundEffects() async {
    if (!_loaded) await _loadAll();
    return _soundEffects;
  }

  static Future<void> setSoundEffects(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_soundEffectsKey, value);
    _soundEffects = value;
    _syncToCloud();
  }

  static Future<bool> getHaptics() async {
    if (!_loaded) await _loadAll();
    return _haptics;
  }

  static Future<void> setHaptics(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hapticsKey, value);
    _haptics = value;
    _syncToCloud();
  }

  static Future<void> _loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    _dailyReminders = prefs.getBool(_dailyRemindersKey) ?? false;
    _soundEffects = prefs.getBool(_soundEffectsKey) ?? true;
    _haptics = prefs.getBool(_hapticsKey) ?? true;
    _loaded = true;
  }

  /// Fire-and-forget push to Firestore.
  static void _syncToCloud() {
    final uid = FirebaseAuthService.instance.uid;
    if (uid == null || FirebaseAuthService.instance.isAnonymous) return;
    FirestoreService.instance
        .saveSettings(
      uid,
      dailyReminders: _dailyReminders,
      soundEffects: _soundEffects,
      haptics: _haptics,
    )
        .catchError((e) {});
  }
}
