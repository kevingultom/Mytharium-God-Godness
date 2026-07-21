import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_auth_service.dart';
import 'firestore_service.dart';

class BookmarkService {
  static const _key = 'bookmarked_god_ids';

  /// Load saved bookmark IDs from SharedPreferences.
  static Future<Set<String>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key);
    if (raw == null) return {};
    return raw.toSet();
  }

  /// Persist the full set of bookmarked IDs.
  static Future<void> save(Set<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, ids.toList());
    _syncToCloud(ids);
  }

  /// Convenience: toggle one ID and persist.
  static Future<Set<String>> toggle(String id, Set<String> current) async {
    final updated = Set<String>.from(current);
    if (updated.contains(id)) {
      updated.remove(id);
    } else {
      updated.add(id);
    }
    await save(updated);
    return updated;
  }

  /// Fire-and-forget push to Firestore.
  static void _syncToCloud(Set<String> ids) {
    final uid = FirebaseAuthService.instance.uid;
    if (uid == null || FirebaseAuthService.instance.isAnonymous) return;
    FirestoreService.instance.saveGodFavorites(uid, ids).catchError((e) {
      // ignore — local data is still valid
    });
  }
}
