import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/god_model.dart';
import '../data/gods_data.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';
import '../services/bookmark_service.dart';
import '../services/sound_service.dart';
import 'detail_screen.dart';
import 'bookmark_screen.dart';
import 'greek_category_screen.dart';
import 'nordic_category_screen.dart';
import 'egypt_category_screen.dart';
import 'hindu_category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late List<God> _allGods;
  List<God> _filteredGods = [];
  final TextEditingController _searchController = TextEditingController();
  String _selectedMythology = 'All';
  String? _expandedGodId;
  late final AnimationController _staggerCtrl;

  // Random God animation state
  bool _isRandomizing = false;
  God? _randomDisplayGod;
  Timer? _randomTimer;
  int _randomStep = 0;
  static const _randomTotalSteps = 25;

  static const _mythologies = ['All', 'Greek', 'Egyptian', 'Nordic', 'Hindu'];

  @override
  void initState() {
    super.initState();
    _allGods = List.from(godsData);
    _filteredGods = List.from(godsData);
    _searchController.addListener(_applyFilters);
    _staggerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
    _loadBookmarks();
  }

  /// Returns a staggered animation for card at [index].
  Animation<double> _stagger(int index) {
    final count = _filteredGods.length.clamp(1, 20);
    final start = (index / count).clamp(0.0, 1.0);
    final end = ((index + 1) / count).clamp(0.0, 1.0);
    return CurvedAnimation(
      parent: _staggerCtrl,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
  }

  Future<void> _loadBookmarks() async {
    final ids = await BookmarkService.load();
    for (final god in _allGods) {
      god.isBookmarked = ids.contains(god.id);
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _staggerCtrl.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    setState(() {
      final q = _searchController.text.toLowerCase();
      final lang = LanguageProvider.of(context).value;
      _filteredGods = _allGods.where((g) {
        final matchQ = q.isEmpty ||
            g.name.toLowerCase().contains(q) ||
            g.localizedTitle(lang).toLowerCase().contains(q) ||
            g.localizedPowers(lang).any((p) => p.toLowerCase().contains(q));
        final matchM = _selectedMythology == 'All' || g.mythology == _selectedMythology;
        return matchQ && matchM;
      }).toList();
    });
    _staggerCtrl
      ..reset()
      ..forward();
  }

  void _startRandomGod() {
    if (_isRandomizing || _allGods.isEmpty) return;
    SoundService.playClick();
    setState(() {
      _isRandomizing = true;
      _randomStep = 0;
      _randomDisplayGod = _allGods[DateTime.now().millisecondsSinceEpoch % _allGods.length];
    });
    _showRandomOverlay();
    _runRandomCycle();
  }

  void _runRandomCycle() {
    const durations = [
      80, 80, 100, 100, 120, 140, 160, 180, 220, 260,
      300, 350, 420, 500, 600, 720, 850, 1000, 1200, 1500,
      1800, 2200, 2800, 3500, 4000,
    ];
    _randomTimer?.cancel();
    _randomTimer = Timer(const Duration(milliseconds: 80), () {
      if (!mounted || !_isRandomizing) return;
      _randomStep++;
      final idx = DateTime.now().millisecondsSinceEpoch % _allGods.length;
      setState(() => _randomDisplayGod = _allGods[idx]);
      if (_randomStep < _randomTotalSteps) {
        final ms = durations[_randomStep.clamp(0, durations.length - 1)];
        _randomTimer = Timer(Duration(milliseconds: ms ~/ (1 + _randomStep * 0.15)), _runRandomCycle);
      } else {
        _finishRandom();
      }
    });
  }

  void _finishRandom() {
    final finalGod = _allGods[DateTime.now().millisecondsSinceEpoch % _allGods.length];
    setState(() {
      _randomDisplayGod = finalGod;
      _isRandomizing = false;
    });
    _randomTimer?.cancel();
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      Navigator.of(context).pop(); // close overlay
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => DetailScreen(
            god: finalGod,
            onReturn: () {},
          ),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    });
  }

  void _showRandomOverlay() {
    final lang = LanguageProvider.of(context).value;
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black87,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (ctx, a1, a2, child) {
        return FadeTransition(
          opacity: a1,
          child: ScaleTransition(scale: CurvedAnimation(parent: a1, curve: Curves.easeOutBack), child: child),
        );
      },
      pageBuilder: (_, __, ___) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            // Listen to parent state changes
            if (_isRandomizing) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) setDialogState(() {});
              });
            }
            final god = _randomDisplayGod;
            if (god == null) return const SizedBox();
            return Center(
              child: Container(
                width: 280,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF111111),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _isRandomizing
                        ? const Color(0xFFFF6F00).withValues(alpha: 0.5 + (DateTime.now().millisecondsSinceEpoch % 1000) / 2000)
                        : const Color(0xFFB07800),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF6F00).withValues(alpha: _isRandomizing ? 0.3 : 0.1),
                      blurRadius: _isRandomizing ? 30 : 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      _isRandomizing
                          ? (lang == 'id' ? 'MENARIK...' : 'DRAWING...')
                          : (lang == 'id' ? 'KAMU DAPAT!' : 'YOU GOT!'),
                      style: GoogleFonts.cinzel(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFFF8A00),
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // God card
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 60),
                      child: Container(
                        key: ValueKey(god.id),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: GodCard.mythologyColor(god.mythology).withValues(alpha: 0.5),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: god.imageUrl.isNotEmpty
                              ? Image.asset(god.imageUrl, fit: BoxFit.cover)
                              : Center(
                                  child: Text(
                                    god.name[0],
                                    style: const TextStyle(fontSize: 64, color: Color(0xFFB07800)),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    // God name
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 60),
                      child: Text(
                        god.name,
                        key: ValueKey(god.id),
                        style: GoogleFonts.cinzel(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // God title
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 60),
                      child: Text(
                        god.localizedTitle(lang),
                        key: ValueKey('${god.id}_title'),
                        style: TextStyle(
                          fontSize: 12,
                          color: GodCard.mythologyColor(god.mythology),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Mythology tag
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: GodCard.mythologyColor(god.mythology).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        god.mythology,
                        style: TextStyle(
                          fontSize: 10,
                          color: GodCard.mythologyColor(god.mythology),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (!_isRandomizing) ...[
                      const SizedBox(height: 16),
                      Text(
                        lang == 'id' ? 'Menutup otomatis...' : 'Closing automatically...',
                        style: const TextStyle(fontSize: 11, color: Color(0xFF666666)),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _selectMythology(String m) {
    // Greek, Nordic & Egyptian open a sub-category chooser
    if (m == 'Greek' || m == 'Nordic' || m == 'Egyptian' || m == 'Hindu') {
      SoundService.playClick();
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            if (m == 'Greek') return const GreekCategoryScreen();
            if (m == 'Nordic') return const NordicCategoryScreen();
            if (m == 'Hindu') return const HinduCategoryScreen();
            return const EgyptCategoryScreen();
          },
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
      return;
    }
    setState(() => _selectedMythology = m);
    _applyFilters();
  }

  void _toggleLanguage() {
    final lang = LanguageProvider.of(context);
    lang.setLanguage(lang.value == 'id' ? 'en' : 'id');
  }

  void _openBookmarks() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const BookmarkScreen()),
    );
    // Re-sync bookmarks when returning
    for (final god in _allGods) {
      final ids = await BookmarkService.load();
      god.isBookmarked = ids.contains(god.id);
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(lang),
            _buildSearchBar(lang),
            _buildFilterChips(),
            _buildResultCount(lang),
            Expanded(child: _buildList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String lang) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MYTHOPEDIA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  AppStrings.get('homeSubtitle', lang),
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 12.5,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _openBookmarks,
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF333333)),
              ),
              child: const Icon(Icons.bookmark_rounded, color: Color(0xFFB07800), size: 16),
            ),
          ),
          GestureDetector(
            onTap: _toggleLanguage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF333333)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.language, color: Color(0xFFB07800), size: 16),
                  const SizedBox(width: 6),
                  Text(
                    lang == 'id' ? 'EN' : 'ID',
                    style: const TextStyle(
                      color: Color(0xFFB07800),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(String lang) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(
        children: [
          // Search field
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF333333)),
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  hintText: AppStrings.get('searchHint', lang),
                  hintStyle: const TextStyle(color: Color(0xFF777777), fontSize: 13),
                  prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFFB07800), size: 18),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close_rounded, color: Color(0xFF777777), size: 16),
                          onPressed: () => _searchController.clear(),
                        )
                      : null,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Random God button
          GestureDetector(
            onTap: _startRandomGod,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFB07800).withValues(alpha: 0.4)),
              ),
              child: const Icon(Icons.casino_rounded, color: Color(0xFFB07800), size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        itemCount: _mythologies.length,
        itemBuilder: (_, i) {
          final m = _mythologies[i];
          final selected = m == _selectedMythology;
          final color = m == 'All' ? const Color(0xFFB07800) : GodCard.mythologyColor(m);
          return GestureDetector(
            onTap: () => _selectMythology(m),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: selected ? color : const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: selected ? color : const Color(0xFF333333)),
              ),
              child: Text(
                m,
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFFAAAAAA),
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResultCount(String lang) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Text(
        '${_filteredGods.length} ${AppStrings.get("resultCount", lang)}',
        style: const TextStyle(color: Color(0xFFD1D5DB), fontSize: 11),
      ),
    );
  }

  Widget _buildList() {
    final lang = LanguageProvider.of(context).value;
    if (_filteredGods.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off_rounded, size: 48, color: Color(0xFF555555)),
            const SizedBox(height: 14),
            Text(AppStrings.get('emptyTitle', lang),
                style: const TextStyle(color: Color(0xFF999999), fontSize: 15)),
            const SizedBox(height: 6),
            Text(AppStrings.get('emptySubtitle', lang),
                style: const TextStyle(color: Color(0xFF555555), fontSize: 13)),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: _filteredGods.length,
      itemBuilder: (_, i) => GodCard(
        god: _filteredGods[i],
        isExpanded: _filteredGods[i].id == _expandedGodId,
        entranceAnim: _stagger(i),
        onToggle: () {
          setState(() {
            final tappedId = _filteredGods[i].id;
            _expandedGodId = _expandedGodId == tappedId ? null : tappedId;
          });
        },
        onReturn: () => setState(() {}),
      ),
    );
  }
}
