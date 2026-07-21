import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import '../l10n/language_provider.dart';

/// Handles Firebase Cloud Messaging token management and local daily
/// reminder notifications.
///
/// Daily reminder flow:
/// 1. User toggles "Daily Reminder" ON in Profile.
/// 2. We schedule a daily local notification at 09:00 with a random
///    mythology fact / god-of-the-day teaser.
/// 3. When toggled OFF we cancel all scheduled notifications.
class NotificationService {
  NotificationService._();
  static final instance = NotificationService._();

  /// Lets a notification tap navigate the app even though the tap
  /// callback fires from native/plugin code, outside any widget's
  /// BuildContext. Attached to MaterialApp(navigatorKey: ...) in main.dart.
  static final navigatorKey = GlobalKey<NavigatorState>();

  final _messaging = FirebaseMessaging.instance;
  final _local = FlutterLocalNotificationsPlugin();

  static const _channelId = 'mythera_daily';
  static const _channelName = 'Mythera Daily Reminders';
  static const _scheduledKey = 'notification_scheduled_daily';
  static const _dailyBaseId = 100; // notification ids 100.._dailyFacts.length

  // ── Curated daily content (id, en) ──────────────────────────────
  static const _dailyFacts = <(String, String)>[
    (
      '⚡ Tahukah Zeus memiliki 60+ anak dalam mitologi Yunani?',
      '⚡ Did you know Zeus fathered 60+ children in Greek mythology?',
    ),
    (
      '🌍 Mitologi Mesir kuno punya lebih dari 2000 dewa!',
      '🌍 Ancient Egyptian mythology has more than 2000 gods!',
    ),
    (
      '⚔️ Thor tidak bisa mengangkat Mjolnir kalau tidak memakai sarung tangan besi Járngreipr.',
      '⚔️ Thor cannot lift Mjolnir without wearing his iron gauntlets, Járngreipr.',
    ),
    (
      '🐉 Naga Cina (Long) adalah simbol keberuntungan, bukan kejahatan.',
      '🐉 The Chinese dragon (Long) is a symbol of good fortune, not evil.',
    ),
    (
      '⛩️ Torii gates di Jepang menandai batas dunia suci dan dunia manusia.',
      '⛩️ Torii gates in Japan mark the boundary between the sacred and human worlds.',
    ),
    (
      '🕉️ Trimurti: Brahma sang pencipta, Wisnu sang pemelihara, Siwa sang pelebur.',
      '🕉️ The Trimurti: Brahma the creator, Vishnu the preserver, Shiva the destroyer.',
    ),
    (
      '🐺 Fenrir, serigala raksasa Norse, akan menelan matahari saat Ragnarök tiba.',
      '🐺 Fenrir, the giant Norse wolf, is fated to swallow the sun when Ragnarök arrives.',
    ),
    (
      '🏺 Minotaur tinggal di labirin buatan Daedalus untuk Raja Minos.',
      '🏺 The Minotaur lived in a labyrinth built by Daedalus for King Minos.',
    ),
    (
      '🌅 Amaterasu, dewi matahari Jepang, pernah bersembunyi di gua hingga dunia menjadi gelap.',
      '🌅 Amaterasu, the Japanese sun goddess, once hid in a cave and plunged the world into darkness.',
    ),
    (
      '⚔️ Bima dari Mahabharata adalah pejuang terkuat di antara lima Pandawa.',
      '⚔️ Bhima from the Mahabharata was the mightiest warrior among the five Pandavas.',
    ),
    (
      '🐍 Jörmungandr, ular raksasa Norse, melingkari seluruh dunia sambil menggigit ekornya sendiri.',
      '🐍 Jörmungandr, the giant Norse serpent, encircles the entire world biting its own tail.',
    ),
    (
      '🏹 Hou Yi menembak jatuh 9 dari 10 matahari untuk menyelamatkan bumi.',
      '🏹 Hou Yi shot down 9 of the 10 suns to save the earth.',
    ),
    (
      '💀 Anubis, dewa kematian Mesir, memiliki kepala serigala, bukan anjing.',
      '💀 Anubis, the Egyptian god of death, has the head of a jackal, not a dog.',
    ),
    (
      '🐒 Sun Wukong bisa berubah menjadi 72 bentuk berbeda!',
      '🐒 Sun Wukong can transform into 72 different forms!',
    ),
    (
      '🔱 Poseidon bisa memukul tanah dengan trisulanya untuk menimbulkan gempa bumi.',
      '🔱 Poseidon can strike the ground with his trident to cause earthquakes.',
    ),
    (
      '🌙 Thoth, dewa pengetahuan Mesir, menciptakan kalender 365 hari.',
      '🌙 Thoth, the Egyptian god of knowledge, created the 365-day calendar.',
    ),
    (
      '🦅 Garuda, kendaraan Wisnu, adalah raja semua burung dalam mitologi Hindu.',
      "🦅 Garuda, Vishnu's mount, is the king of all birds in Hindu mythology.",
    ),
    (
      '❄️ Niflheim, dunia es Norse, adalah salah satu semesta pertama yang tercipta.',
      '❄️ Niflheim, the Norse world of ice, was one of the first realms to exist.',
    ),
    (
      '🎭 Loki bukan dewa jahat, dia dewa trik yang kadang membantu, kadang merusak.',
      "🎭 Loki isn't an evil god, he's a trickster who sometimes helps and sometimes causes chaos.",
    ),
    (
      '🏯 Izanagi dan Izanami menciptakan Jepang dengan mencelupkan tombak ke laut.',
      '🏯 Izanagi and Izanami created Japan by dipping a spear into the sea.',
    ),
    (
      '🏛️ Athena lahir langsung dewasa dan bersenjata lengkap dari kepala Zeus.',
      "🏛️ Athena was born fully grown and armored straight from Zeus's head.",
    ),
    (
      '🐍 Wadjet, dewi ular Mesir, digambarkan sebagai kobra di mahkota firaun untuk melindungi mereka.',
      "🐍 Wadjet, the Egyptian cobra goddess, appears on pharaohs' crowns to protect them.",
    ),
    (
      '🌳 Yggdrasil, pohon dunia Norse, menghubungkan sembilan alam semesta yang berbeda.',
      '🌳 Yggdrasil, the Norse world tree, connects nine different realms of existence.',
    ),
    (
      '🐒 Sun Wukong pernah mencuri buah persik keabadian dari kebun Ratu Langit.',
      "🐒 Sun Wukong once stole the peaches of immortality from the Queen of Heaven's garden.",
    ),
    (
      '⚡ Susanoo, dewa badai Jepang, mengalahkan naga berkepala delapan Yamata no Orochi.',
      '⚡ Susanoo, the Japanese storm god, defeated the eight-headed serpent Yamata no Orochi.',
    ),
    (
      '🐘 Ganesha kehilangan kepala aslinya dan diberi kepala gajah oleh Siwa sebagai gantinya.',
      '🐘 Ganesha lost his original head and was given an elephant head by Shiva instead.',
    ),
    (
      '🍇 Dionysus adalah dewa anggur yang juga mengajarkan manusia cara membuat wine.',
      '🍇 Dionysus, the god of wine, also taught humanity how to make it.',
    ),
    (
      '🌊 Banjir Sungai Nil dipercaya sebagai air mata Isis yang berduka atas kematian Osiris.',
      '🌊 The flooding of the Nile was believed to be the tears of Isis mourning Osiris.',
    ),
    (
      '🍎 Idun menjaga apel emas yang membuat para dewa Norse tetap awet muda selamanya.',
      '🍎 Idun guards the golden apples that keep the Norse gods eternally young.',
    ),
    (
      '🦊 Kitsune, rubah dalam cerita rakyat Jepang, bisa memiliki hingga sembilan ekor seiring bertambahnya kebijaksanaan.',
      '🦊 Kitsune, the fox spirits of Japanese folklore, grow up to nine tails as they gain wisdom.',
    ),
  ];

  /// Reads the app's current language directly from SharedPreferences —
  /// this service lives outside the widget tree, so it can't read
  /// LanguageProvider.of(context).
  Future<String> _currentLang() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(LanguageNotifier.key) ?? 'id';
  }

  // ── Init ──────────────────────────────────────────────────────
  Future<void> init() async {
    tz_data.initializeTimeZones();

    // Request notification permission.
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Initialize local notifications.
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await _local.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    // Create Android notification channel.
    const androidChannel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: 'Daily mythology facts and god-of-the-day reminders',
      importance: Importance.high,
    );
    await _local
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    // Listen for FCM token refreshes.
    _messaging.onTokenRefresh.listen((token) {
      // Caller should save token to Firestore.
    });
  }

  /// Tapping a notification should land the user somewhere useful instead
  /// of doing nothing — closes any pushed screens and returns to the main
  /// app shell (Discover).
  void _onNotificationTap(NotificationResponse response) {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  // ── FCM Token ─────────────────────────────────────────────────
  Future<String?> getToken() async {
    return _messaging.getToken();
  }

  // ── Daily Reminder ────────────────────────────────────────────
  /// Schedules one distinct local notification per day at 09:00, one for
  /// each of the next [_dailyFacts.length] days, each with a different
  /// shuffled fact — a single *repeating* notification can't do this,
  /// since its body is baked in once at schedule time and Android just
  /// re-shows that same text every time it repeats. This way the fact
  /// genuinely changes every day even if the app is never reopened.
  ///
  /// [force] bypasses the "already scheduled" guard. This matters because
  /// Android clears all AlarmManager-backed alarms (which is what
  /// zonedSchedule uses under the hood) on every device reboot, and this
  /// app has no BOOT_COMPLETED receiver to re-arm them automatically —
  /// so [_scheduledKey] can say "true" while the actual OS-level alarms are
  /// gone. The app-launch re-arm call in main.dart passes force: true so
  /// it always re-issues them rather than trusting the stale flag.
  Future<void> scheduleDailyReminder({bool force = false}) async {
    final prefs = await SharedPreferences.getInstance();
    if (!force && prefs.getBool(_scheduledKey) == true) return;

    // Clear whatever's pending before laying down a fresh rolling batch —
    // otherwise reopening the app mid-cycle would leave stale, unshuffled
    // notifications from the previous batch still queued alongside new ones.
    await _local.cancelAll();

    final lang = await _currentLang();
    final shuffled = List<(String, String)>.from(_dailyFacts)..shuffle();
    final firstNineAM = _nextInstanceOfNineAM();

    for (var i = 0; i < shuffled.length; i++) {
      final fact = shuffled[i];
      await _local.zonedSchedule(
        _dailyBaseId + i,
        'Mythera ✨',
        lang == 'en' ? fact.$2 : fact.$1,
        firstNineAM.add(Duration(days: i)),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: 'Daily mythology reminders',
            icon: '@mipmap/ic_launcher',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        // No matchDateTimeComponents — each of these fires exactly once,
        // on its own specific date, unlike a single repeating schedule.
      );
    }

    await prefs.setBool(_scheduledKey, true);
  }

  /// Cancels the daily reminder.
  Future<void> cancelDailyReminder() async {
    await _local.cancelAll();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_scheduledKey);
  }

  /// Returns `true` if the daily reminder is currently scheduled.
  Future<bool> isDailyReminderScheduled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_scheduledKey) ?? false;
  }

  // ── Helpers ───────────────────────────────────────────────────
  tz.TZDateTime _nextInstanceOfNineAM() {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, 9);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }
}

// ── Background message handler (must be top-level function) ─────
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // No action needed — local notifications handle display.
}
