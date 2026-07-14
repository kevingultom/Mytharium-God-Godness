import 'package:shared_preferences/shared_preferences.dart';

/// Persists which Mythic Pop Culture characters the user has favorited.
/// Kept separate from the god [BookmarkService] since characters aren't gods.
/// [init] must run once at startup so the sync getters are populated.
class PopCultureBookmarkService {
  static const _key = 'pc_bookmark_ids';
  static Set<String> _ids = {};

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _ids = (prefs.getStringList(_key) ?? const []).toSet();
  }

  static bool isFavorite(String id) => _ids.contains(id);
  static Set<String> get ids => Set.unmodifiable(_ids);
  static int get count => _ids.length;

  /// Toggles a character's favorite state. Returns the new state.
  static Future<bool> toggle(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final nowFav = !_ids.contains(id);
    if (nowFav) {
      _ids.add(id);
    } else {
      _ids.remove(id);
    }
    await prefs.setStringList(_key, _ids.toList());
    return nowFav;
  }
}
