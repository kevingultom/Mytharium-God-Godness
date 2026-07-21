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

  /// Toggled by quiz screens to hide/show the bottom nav bar. Reset is
  /// tied to the Future returned by the Navigator.push that opens the
  /// quiz (see home_screen.dart / quiz_genre_screen.dart), which the
  /// framework guarantees resolves exactly once that route is popped —
  /// more reliable than trusting a screen's own dispose() alone.
  static final ValueNotifier<bool> quizActive = ValueNotifier<bool>(false);

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;
  final _homeKey = GlobalKey<HomeScreenState>();
  final _storiesKey = GlobalKey<StoriesScreenState>();
  final _profileKey = GlobalKey<ProfileScreenState>();

  /// One Navigator per tab so that pushing deeper screens (god detail,
  /// category lists, quizzes, etc.) keeps the bottom nav bar visible instead
  /// of covering it. Modal dialogs still use the root navigator and cover it.
  final List<GlobalKey<NavigatorState>> _navKeys =
      List.generate(4, (_) => GlobalKey<NavigatorState>());

  late final List<Widget> _rootPages = [
    HomeScreen(key: _homeKey),
    StoriesScreen(key: _storiesKey),
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
      if (index == 0) _homeKey.currentState?.scrollToTop();
      if (index == 1) _storiesKey.currentState?.scrollToTop();
      if (index == 3) _profileKey.currentState?.scrollToTop();
      return;
    }
    SoundService.playClick();
    // Reset the destination tab to its root when switching tabs.
    _navKeys[index].currentState?.popUntil((r) => r.isFirst);
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
        bottomNavigationBar: ValueListenableBuilder<bool>(
          valueListenable: MainShell.quizActive,
          builder: (_, active, __) => active ? const SizedBox.shrink() : _buildNavBar(lang),
        ),
      ),
    );
  }

  Widget _buildNavBar(String lang) {
    final items = [
      (icon: Icons.auto_awesome_rounded, label: 'Discover'),
      (icon: Icons.auto_stories_rounded, label: 'Stories'),
      (icon: Icons.library_books_rounded, label: 'Codex'),
      (icon: Icons.person_rounded, label: localize(lang, 'Profil', 'Profile')),
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
