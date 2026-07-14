import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/god_model.dart';
import '../models/history_model.dart';

/// One entry in the "recently read" history shown on the My Myths screen.
class RecentRead {
  final String type; // 'god' | 'story'
  final String id;
  final String name;
  final String verse; // mythology, for the accent color + chip
  final int timestamp; // epoch millis

  const RecentRead({
    required this.type,
    required this.id,
    required this.name,
    required this.verse,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() =>
      {'type': type, 'id': id, 'name': name, 'verse': verse, 'ts': timestamp};

  factory RecentRead.fromJson(Map<String, dynamic> j) => RecentRead(
        type: j['type'] as String? ?? 'god',
        id: j['id'] as String? ?? '',
        name: j['name'] as String? ?? '',
        verse: j['verse'] as String? ?? '',
        timestamp: j['ts'] as int? ?? 0,
      );
}

/// Tracks which god cards and myth stories the user has marked as read, a
/// day-based reading streak, and a recent-reads list — all persisted locally.
/// [init] must run once at startup so the sync getters are populated.
class ReadingService {
  static const _readGodsKey = 'read_god_ids';
  static const _readStoriesKey = 'read_story_ids';
  static const _streakKey = 'reading_streak';
  static const _lastDateKey = 'reading_last_date';
  static const _recentKey = 'reading_recent';

  static Set<String> _readGods = {};
  static Set<String> _readStories = {};
  static int _streak = 0;
  static List<RecentRead> _recent = [];

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _readGods = (prefs.getStringList(_readGodsKey) ?? const []).toSet();
    _readStories = (prefs.getStringList(_readStoriesKey) ?? const []).toSet();
    _streak = prefs.getInt(_streakKey) ?? 0;
    _recent = (prefs.getStringList(_recentKey) ?? const [])
        .map((s) => RecentRead.fromJson(jsonDecode(s) as Map<String, dynamic>))
        .toList();
  }

  static bool isGodRead(String id) => _readGods.contains(id);
  static bool isStoryRead(String id) => _readStories.contains(id);
  static int get streak => _streak;
  static int get godsReadCount => _readGods.length;
  static int get storiesReadCount => _readStories.length;
  static List<RecentRead> get recent => List.unmodifiable(_recent);

  static String _dateStr(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  /// Advances the day-based streak on the first read of a new calendar day.
  static Future<void> _touchStreak(SharedPreferences prefs) async {
    final now = DateTime.now();
    final today = _dateStr(now);
    final last = prefs.getString(_lastDateKey);
    if (last == today) return; // already counted today
    final yesterday = _dateStr(now.subtract(const Duration(days: 1)));
    _streak = (last == yesterday) ? _streak + 1 : 1;
    await prefs.setString(_lastDateKey, today);
    await prefs.setInt(_streakKey, _streak);
  }

  static void _addRecent(RecentRead r) {
    _recent.removeWhere((e) => e.type == r.type && e.id == r.id);
    _recent.insert(0, r);
    if (_recent.length > 12) _recent = _recent.sublist(0, 12);
  }

  static Future<void> _saveRecent(SharedPreferences prefs) async {
    await prefs.setStringList(
        _recentKey, _recent.map((r) => jsonEncode(r.toJson())).toList());
  }

  /// Toggles a god's read state. Returns the new state (true = now read).
  static Future<bool> toggleGodRead(God god) async {
    final prefs = await SharedPreferences.getInstance();
    final nowRead = !_readGods.contains(god.id);
    if (nowRead) {
      _readGods.add(god.id);
      await _touchStreak(prefs);
      _addRecent(RecentRead(
        type: 'god',
        id: god.id,
        name: god.name,
        verse: god.mythology,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ));
    } else {
      _readGods.remove(god.id);
      _recent.removeWhere((e) => e.type == 'god' && e.id == god.id);
    }
    await prefs.setStringList(_readGodsKey, _readGods.toList());
    await _saveRecent(prefs);
    return nowRead;
  }

  /// Toggles a myth story's read state. Returns the new state.
  static Future<bool> toggleStoryRead(MythStory story) async {
    final prefs = await SharedPreferences.getInstance();
    final nowRead = !_readStories.contains(story.id);
    if (nowRead) {
      _readStories.add(story.id);
      await _touchStreak(prefs);
      _addRecent(RecentRead(
        type: 'story',
        id: story.id,
        name: story.title,
        verse: story.mythology,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ));
    } else {
      _readStories.remove(story.id);
      _recent.removeWhere((e) => e.type == 'story' && e.id == story.id);
    }
    await prefs.setStringList(_readStoriesKey, _readStories.toList());
    await _saveRecent(prefs);
    return nowRead;
  }
}
