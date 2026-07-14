import 'package:flutter/material.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
import 'home_screen.dart';
import 'stories_screen.dart';
import 'codex_screen.dart';
import 'profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;
  final _profileKey = GlobalKey<ProfileScreenState>();

  /// One Navigator per tab so that pushing deeper screens (god detail,
  /// category lists, quizzes, etc.) keeps the bottom nav bar visible instead
  /// of covering it. Modal dialogs still use the root navigator and cover it.
  final List<GlobalKey<NavigatorState>> _navKeys =
      List.generate(4, (_) => GlobalKey<NavigatorState>());

  late final List<Widget> _rootPages = [
    const HomeScreen(),
    const StoriesScreen(),
    const CodexScreen(),
    ProfileScreen(key: _profileKey),
  ];

  Widget _tabNavigator(int index) {
    return Navigator(
      key: _navKeys[index],
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (_) => _rootPages[index],
      ),
    );
  }

  void _onTabTapped(int index) {
    if (index == _currentIndex) {
      // Re-tapping the active tab returns it to its root screen.
      _navKeys[index].currentState?.popUntil((r) => r.isFirst);
      return;
    }
    SoundService.playClick();
    setState(() => _currentIndex = index);
    if (index == 3) _profileKey.currentState?.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        // Pop the active tab's own stack first; if it's already at its root,
        // fall back to the Discover tab before letting the app close.
        final nav = _navKeys[_currentIndex].currentState;
        if (nav != null && nav.canPop()) {
          nav.pop();
        } else if (_currentIndex != 0) {
          setState(() => _currentIndex = 0);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: IndexedStack(
          index: _currentIndex,
          children: List.generate(_rootPages.length, _tabNavigator),
        ),
        bottomNavigationBar: _buildNavBar(lang),
      ),
    );
  }

  Widget _buildNavBar(String lang) {
    final items = [
      (icon: Icons.auto_awesome_rounded, label: 'Discover'),
      (icon: Icons.auto_stories_rounded, label: 'Stories'),
      (icon: Icons.library_books_rounded, label: 'Codex'),
      (icon: Icons.person_rounded, label: lang == 'id' ? 'Profil' : 'Profile'),
    ];

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFF0A0A0A),
        border: Border(top: BorderSide(color: Color(0xFF262626))),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            children: List.generate(items.length, (i) {
              final selected = i == _currentIndex;
              const accent = Color(0xFFB07800);
              final item = items[i];
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _onTabTapped(i),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: selected ? accent : const Color(0xFF6B6B6B),
                        size: 22,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.label,
                        style: AppFonts.cinzel(
                          fontSize: 10,
                          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                          color: selected ? accent : const Color(0xFF6B6B6B),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
