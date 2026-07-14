import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../l10n/language_provider.dart';
import '../services/settings_service.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
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
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final id = lang == 'id';

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          children: [
            Row(
              children: [
                const Icon(Icons.person_rounded, color: _gold, size: 24),
                const SizedBox(width: 8),
                Text(
                  id ? 'PROFIL' : 'PROFILE',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Preferences card
            _card(
              children: [
                _toggleRow(
                  title: id ? 'Pengingat Harian' : 'Daily Reminders',
                  subtitle: id
                      ? 'Temukan dewa dan mitologi baru setiap hari.'
                      : 'Discover a new god and mythology every day.',
                  value: _dailyReminders,
                  onChanged: (v) async {
                    setState(() => _dailyReminders = v);
                    await SettingsService.setDailyReminders(v);
                  },
                ),
                _divider(),
                _toggleRow(
                  title: id ? 'Efek Suara' : 'Sound Effects',
                  subtitle: id
                      ? 'Mainkan suara saat menekan tombol dan interaksi.'
                      : 'Play sounds on button taps and interactions.',
                  value: _soundEffects,
                  onChanged: (v) async {
                    setState(() => _soundEffects = v);
                    await SoundService.setSoundEnabled(v);
                  },
                ),
                _divider(),
                _toggleRow(
                  title: id ? 'Getaran' : 'Haptics',
                  subtitle: id
                      ? 'Umpan balik getaran saat menekan dan berinteraksi.'
                      : 'Vibration feedback on taps and interactions.',
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
                  label: id ? 'Tentang' : 'About',
                  onTap: () => _openPage(const AboutScreen()),
                ),
                _divider(),
                _infoRow(
                  label: id ? 'Ketentuan Layanan' : 'Terms of Service',
                  onTap: () => _openPage(const TermsOfServiceScreen()),
                ),
                _divider(),
                _infoRow(
                  label: id ? 'Kebijakan Privasi' : 'Privacy Policy',
                  onTap: () => _openPage(const PrivacyPolicyScreen()),
                ),
                _divider(),
                _infoRow(
                  label: id ? 'Bantuan' : 'Help',
                  onTap: () => _openPage(const HelpScreen()),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // App info footer
            Center(
              child: Column(
                children: [
                  Text(
                    'MYTHARIUM',
                    style: AppFonts.cinzel(
                      color: const Color(0xFF6B6B6B),
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 3,
                    ),
                  ),
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
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF8A8A8A),
                    fontSize: 12,
                    height: 1.3,
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
