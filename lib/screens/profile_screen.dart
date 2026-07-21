import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../l10n/language_provider.dart';
import '../services/settings_service.dart';
import '../services/sound_service.dart';
import '../services/firebase_auth_service.dart';
import '../services/notification_service.dart';
import 'about_screen.dart';
import 'terms_of_service_screen.dart';
import 'privacy_policy_screen.dart';
import 'help_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  static const _cardBg = Color(0xFF111111);
  static const _cardBorder = Color(0xFF1E1E1E);
  static const _gold = Color(0xFFB07800);

  bool _dailyReminders = false;
  bool _soundEffects = true;
  bool _haptics = true;

  final _scrollCtrl = ScrollController();

  void scrollToTop() {
    if (_scrollCtrl.hasClients) {
      _scrollCtrl.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final reminders = await SettingsService.getDailyReminders();
    if (!mounted) return;
    setState(() {
      _dailyReminders = reminders;
      _soundEffects = SoundService.soundEnabled;
      _haptics = SoundService.hapticsEnabled;
    });
  }

  /// Called by MainShell whenever this tab becomes visible again.
  void refresh() {
    if (mounted) _loadSettings();
  }

  void _openPage(Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 280),
      ),
    );
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          controller: _scrollCtrl,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
          children: [
            Text(
              localize(lang, 'Profil', 'Profile'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),

            // Account card
            _buildAccountCard(lang),

            const SizedBox(height: 18),

            // Preferences card
            _card(
              children: [
                _toggleRow(
                  title: localize(lang, 'Pengingat Harian', 'Daily Reminders'),
                  subtitle: localize(lang,
                      'Temukan dewa dan mitologi baru setiap hari.',
                      'Discover a new god and mythology every day.'),
                  value: _dailyReminders,
                  onChanged: (v) async {
                    setState(() => _dailyReminders = v);
                    await SettingsService.setDailyReminders(v);
                    if (v) {
                      await NotificationService.instance.scheduleDailyReminder();
                    } else {
                      await NotificationService.instance.cancelDailyReminder();
                    }
                  },
                ),
                _divider(),
                _toggleRow(
                  title: localize(lang, 'Efek Suara', 'Sound Effects'),
                  subtitle: localize(lang,
                      'Mainkan suara saat menekan tombol dan interaksi.',
                      'Play sounds on button taps and interactions.'),
                  value: _soundEffects,
                  onChanged: (v) async {
                    setState(() => _soundEffects = v);
                    await SoundService.setSoundEnabled(v);
                  },
                ),
                _divider(),
                _toggleRow(
                  title: localize(lang, 'Getaran', 'Haptics'),
                  subtitle: localize(lang,
                      'Umpan balik getaran saat menekan dan berinteraksi.',
                      'Vibration feedback on taps and interactions.'),
                  value: _haptics,
                  onChanged: (v) async {
                    setState(() => _haptics = v);
                    await SoundService.setHapticsEnabled(v);
                  },
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Information card
            _card(
              children: [
                _infoRow(
                  label: localize(lang, 'Tentang', 'About'),
                  onTap: () => _openPage(const AboutScreen()),
                ),
                _divider(),
                _infoRow(
                  label: localize(lang, 'Ketentuan Layanan', 'Terms of Service'),
                  onTap: () => _openPage(const TermsOfServiceScreen()),
                ),
                _divider(),
                _infoRow(
                  label: localize(lang, 'Kebijakan Privasi', 'Privacy Policy'),
                  onTap: () => _openPage(const PrivacyPolicyScreen()),
                ),
                _divider(),
                _infoRow(
                  label: localize(lang, 'Bantuan', 'Help'),
                  onTap: () => _openPage(const HelpScreen()),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // App info footer
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  const Text(
                    'Version 1.0.0',
                    style: TextStyle(color: Color(0xFF555555), fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Explore Every God, Every Legend, Every Realm.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 11.5,
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard(String lang) {
    final auth = FirebaseAuthService.instance;
    final user = auth.currentUser;
    final isAnon = auth.isAnonymous;
    final displayName = user?.displayName ?? (isAnon
        ? localize(lang, 'Pengguna Anonim', 'Anonymous User')
        : user?.email ?? '');
    final photoUrl = user?.photoURL;

    Future<void> _handleAuthTap() async {
      if (isAnon) {
        try {
          final result = await auth.signInWithGoogle();
          if (mounted) {
            setState(() {});
            if (result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(localize(
                      lang, 'Berhasil login!', 'Signed in successfully!')),
                  backgroundColor: const Color(0xFF2E7D32),
                ),
              );
            }
          }
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login error: $e'),
                backgroundColor: Colors.red.shade800,
              ),
            );
          }
        }
      } else {
        await auth.signOutGoogle();
        if (mounted) {
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(localize(lang, 'Telah logout', 'Signed out')),
            ),
          );
        }
      }
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF111111),
            isAnon ? const Color(0xFF151515) : const Color(0xFF141210),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isAnon
              ? _cardBorder
              : _gold.withValues(alpha: 0.25),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        child: Column(
          children: [
            // Avatar with ring
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isAnon
                      ? Colors.white.withValues(alpha: 0.12)
                      : _gold,
                  width: 2,
                ),
                gradient: isAnon
                    ? null
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          _gold,
                          _gold.withValues(alpha: 0.5),
                        ],
                      ),
              ),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: const Color(0xFF2A2A2A),
                backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
                child: photoUrl == null
                    ? Icon(
                        isAnon
                            ? Icons.person_outline_rounded
                            : Icons.person_rounded,
                        color: isAnon
                            ? const Color(0xFF666666)
                            : _gold.withValues(alpha: 0.7),
                        size: 30,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 14),
            // Display name
            Text(
              displayName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Status with dot indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isAnon ? const Color(0xFF666666) : const Color(0xFF4CAF50),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  isAnon
                      ? localize(lang, 'Belum login', 'Not signed in')
                      : localize(lang, 'Tersync ke cloud', 'Synced to cloud'),
                  style: TextStyle(
                    color: isAnon ? const Color(0xFF777777) : const Color(0xFF4CAF50),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            // Auth button
            GestureDetector(
              onTap: _handleAuthTap,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: isAnon
                      ? LinearGradient(
                          colors: [
                            _gold,
                            _gold.withValues(alpha: 0.75),
                          ],
                        )
                      : null,
                  color: isAnon ? null : const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isAnon
                        ? Colors.transparent
                        : const Color(0xFF3A3A3A),
                  ),
                  boxShadow: isAnon
                      ? [
                          BoxShadow(
                            color: _gold.withValues(alpha: 0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isAnon ? Icons.login_rounded : Icons.logout_rounded,
                      color: isAnon ? Colors.black : const Color(0xFF999999),
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        isAnon
                            ? localize(lang, 'Masuk dengan Google', 'Sign in with Google')
                            : localize(lang, 'Keluar', 'Sign Out'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isAnon ? Colors.black : const Color(0xFF999999),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _cardBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(children: children),
    );
  }

  Widget _divider() {
    return const Divider(height: 1, thickness: 1, color: _cardBorder);
  }

  Widget _toggleRow({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: _gold,
            inactiveTrackColor: const Color(0xFF3A3A3C),
          ),
        ],
      ),
    );
  }

  Widget _infoRow({required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: Color(0xFF6B6B6B), size: 22),
            ],
          ),
        ),
      ),
    );
  }
}
