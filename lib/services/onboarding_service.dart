import 'package:shared_preferences/shared_preferences.dart';

/// Stores whether the one-time onboarding has been completed and the choices
/// the user made during it (their revealed patron god, that god's pantheon,
/// and their reading rhythm). Loaded once at startup into a static cache so
/// the rest of the app can read it synchronously.
class OnboardingService {
  static const _completeKey = 'onboarding_complete';
  static const _patronKey = 'onboarding_patron_god_id';
  static const _pantheonKey = 'onboarding_pantheon';
  static const _rhythmKey = 'onboarding_rhythm';

  static bool _complete = false;
  static String? _patronGodId;
  static String? _pantheon;
  static String? _rhythm;

  /// Load persisted onboarding state into the cache. Call once at startup.
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _complete = prefs.getBool(_completeKey) ?? false;
    _patronGodId = prefs.getString(_patronKey);
    _pantheon = prefs.getString(_pantheonKey);
    _rhythm = prefs.getString(_rhythmKey);
  }

  static bool get isComplete => _complete;
  static String? get patronGodId => _patronGodId;

  /// The pantheon of the revealed patron god (e.g. 'Nordic'), or null.
  /// Used to lightly bias the Discover ordering toward the user's realm.
  static String? get preferredPantheon => _pantheon;
  static String? get rhythm => _rhythm;

  /// Persist the onboarding results and mark it finished.
  static Future<void> complete({
    required String patronGodId,
    required String pantheon,
    required String rhythm,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_completeKey, true);
    await prefs.setString(_patronKey, patronGodId);
    await prefs.setString(_pantheonKey, pantheon);
    await prefs.setString(_rhythmKey, rhythm);
    _complete = true;
    _patronGodId = patronGodId;
    _pantheon = pantheon;
    _rhythm = rhythm;
  }

  /// Test/debug helper: wipe the cached state (does not touch disk).
  static void debugReset() {
    _complete = false;
    _patronGodId = null;
    _pantheon = null;
    _rhythm = null;
  }
}
