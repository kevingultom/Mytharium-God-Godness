import 'package:cloud_firestore/cloud_firestore.dart';
/// Cloud Firestore CRUD for all user-specific data.
///
/// Firestore layout:
/// ```
/// users/{uid}
///   ├── displayName, email, photoUrl, createdAt
///   ├── settings/
///   │     ├── dailyReminders: bool
///   │     ├── soundEffects: bool
///   │     └── haptics: bool
///   ├── favorites/
///   │     ├── godIds: List<String>
///   │     └── pcIds: List<String>
///   └── reading/
///         ├── readGodIds: List<String>
///         ├── readStoryIds: List<String>
///         ├── streak: int
///         ├── lastDate: String
///         └── recent: List<Map>
/// ```
class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  final _db = FirebaseFirestore.instance;

  /// Helper to get the user's root document.
  DocumentReference<Map<String, dynamic>> _userDoc(String uid) =>
      _db.collection('users').doc(uid);

  // ── Settings ──────────────────────────────────────────────────
  Future<void> saveSettings(String uid, {
    required bool dailyReminders,
    required bool soundEffects,
    required bool haptics,
  }) async {
    await _userDoc(uid).collection('settings').doc('prefs').set({
      'dailyReminders': dailyReminders,
      'soundEffects': soundEffects,
      'haptics': haptics,
    }, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>> loadSettings(String uid) async {
    final snap = await _userDoc(uid).collection('settings').doc('prefs').get();
    return snap.data() ?? {};
  }

  // ── God Favorites ─────────────────────────────────────────────
  Future<void> saveGodFavorites(String uid, Set<String> ids) async {
    await _userDoc(uid).collection('favorites').doc('gods').set({
      'ids': ids.toList(),
    }, SetOptions(merge: true));
  }

  Future<Set<String>> loadGodFavorites(String uid) async {
    final snap = await _userDoc(uid).collection('favorites').doc('gods').get();
    final data = snap.data();
    if (data == null || data['ids'] == null) return {};
    return (data['ids'] as List).cast<String>().toSet();
  }

  // ── Pop Culture Favorites ─────────────────────────────────────
  Future<void> savePcFavorites(String uid, Set<String> ids) async {
    await _userDoc(uid).collection('favorites').doc('popCulture').set({
      'ids': ids.toList(),
    }, SetOptions(merge: true));
  }

  Future<Set<String>> loadPcFavorites(String uid) async {
    final snap =
        await _userDoc(uid).collection('favorites').doc('popCulture').get();
    final data = snap.data();
    if (data == null || data['ids'] == null) return {};
    return (data['ids'] as List).cast<String>().toSet();
  }

  // ── Reading Progress ──────────────────────────────────────────
  Future<void> saveReadingProgress(String uid, {
    required Set<String> readGodIds,
    required Set<String> readStoryIds,
    required int streak,
    required String lastDate,
    required List<Map<String, dynamic>> recent,
  }) async {
    await _userDoc(uid).collection('reading').doc('progress').set({
      'readGodIds': readGodIds.toList(),
      'readStoryIds': readStoryIds.toList(),
      'streak': streak,
      'lastDate': lastDate,
      'recent': recent,
    }, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>> loadReadingProgress(String uid) async {
    final snap =
        await _userDoc(uid).collection('reading').doc('progress').get();
    return snap.data() ?? {};
  }

  // ── User Profile ──────────────────────────────────────────────
  Future<void> saveUserProfile(String uid, {
    String? displayName,
    String? email,
    String? photoUrl,
  }) async {
    await _userDoc(uid).set({
      if (displayName != null) 'displayName': displayName,
      if (email != null) 'email': email,
      if (photoUrl != null) 'photoUrl': photoUrl,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Future<void> markCreatedAt(String uid) async {
    final doc = _userDoc(uid);
    final snap = await doc.get();
    if (!snap.exists || snap.data()?['createdAt'] == null) {
      await doc.set({
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }
  }

  // ── FCM Token ─────────────────────────────────────────────────
  Future<void> saveFcmToken(String uid, String token) async {
    await _userDoc(uid).set({
      'fcmTokens': FieldValue.arrayUnion([token]),
    }, SetOptions(merge: true));
  }

  Future<void> removeFcmToken(String uid, String token) async {
    await _userDoc(uid).update({
      'fcmTokens': FieldValue.arrayRemove([token]),
    });
  }

  // ── Full Sync: Local → Firestore ──────────────────────────────
  /// Uploads all local data to Firestore. Called after sign-in or
  /// on periodic background sync.
  Future<void> syncLocalToCloud(String uid, {
    required Set<String> godFavorites,
    required Set<String> pcFavorites,
    required Set<String> readGods,
    required Set<String> readStories,
    required int streak,
    required String lastDate,
    required List<Map<String, dynamic>> recent,
    required bool dailyReminders,
    required bool soundEffects,
    required bool haptics,
  }) async {
    final batch = _db.batch();

    final userRef = _userDoc(uid);
    batch.set(userRef, {
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    batch.set(userRef.collection('favorites').doc('gods'), {
      'ids': godFavorites.toList(),
    }, SetOptions(merge: true));

    batch.set(userRef.collection('favorites').doc('popCulture'), {
      'ids': pcFavorites.toList(),
    }, SetOptions(merge: true));

    batch.set(userRef.collection('reading').doc('progress'), {
      'readGodIds': readGods.toList(),
      'readStoryIds': readStories.toList(),
      'streak': streak,
      'lastDate': lastDate,
      'recent': recent,
    }, SetOptions(merge: true));

    batch.set(userRef.collection('settings').doc('prefs'), {
      'dailyReminders': dailyReminders,
      'soundEffects': soundEffects,
      'haptics': haptics,
    }, SetOptions(merge: true));

    await batch.commit();
  }

  // ── Full Sync: Firestore → Local ──────────────────────────────
  /// Downloads all cloud data and returns it. Caller merges into local.
  Future<Map<String, dynamic>> syncCloudToLocal(String uid) async {
    final results = await Future.wait([
      loadGodFavorites(uid),
      loadPcFavorites(uid),
      loadReadingProgress(uid),
      loadSettings(uid),
    ]);

    return {
      'godFavorites': results[0],
      'pcFavorites': results[1],
      'reading': results[2],
      'settings': results[3],
    };
  }
}
