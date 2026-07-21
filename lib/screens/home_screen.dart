import 'package:flutter/material.dart';
import '../models/god_model.dart';
import '../models/pop_culture_model.dart';
import '../data/gods_data.dart';
import '../widgets/god_card.dart';
import '../widgets/random_god_dialog.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';
import '../services/bookmark_service.dart';
import '../services/onboarding_service.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
import 'main_shell.dart';
import 'god_detail_screen.dart';
import 'pop_culture_detail_screen.dart';
import 'greek_category_screen.dart';
import 'nordic_category_screen.dart';
import 'egypt_category_screen.dart';
import 'hindu_category_screen.dart';
import 'chinese_category_screen.dart';
import 'japanese_category_screen.dart';
import 'god_battle_screen.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late List<God> _allGods;
  List<God> _filteredGods = [];
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _selectedMythology = 'All';
  String? _expandedGodId;
  late final AnimationController _staggerCtrl;

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

  /// Scrolls the Discover feed back to the top — called by [MainShell] when
  /// the Discover tab is re-tapped while already active.
  void scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(0, duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
    }
  }

  @override
  void dispose() {
    _staggerCtrl.dispose();
    _searchController.dispose();
    _scrollController.dispose();
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
        final matchM =
            _selectedMythology == 'All' || g.mythology == _selectedMythology;
        return matchQ && matchM;
      }).toList();
    });
    _staggerCtrl
      ..reset()
      ..forward();
  }

  Future<void> _startRandomGod() async {
    if (_allGods.isEmpty) return;
    SoundService.playClick();
    final lang = LanguageProvider.of(context).value;

    // The dice spins the 6 mythic realms first, then a god within the one
    // it lands on — so the pool is real gods only, no pop-culture entries.
    final pool = <RandomEntry>[
      for (final g in _allGods)
        RandomEntry(
          imageUrl: g.imageUrl,
          name: g.name,
          subtitle: g.localizedTitle(lang),
          verse: g.mythology,
          payload: g,
        ),
    ];

    final result = await RandomGodDialog.show(context, pool);
    if (result == null || !mounted) return;

    final payload = result.payload;
    Widget page;
    if (payload is God) {
      page = GodDetailScreen(god: payload);
    } else if (payload is MythicPopCultureCharacter) {
      page = PopCultureDetailScreen(character: payload);
    } else {
      return;
    }
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void _selectMythology(String m) {
    // Greek, Nordic, Egyptian, Hindu, Chinese & Japanese open a sub-category chooser
    if (m == 'Greek' || m == 'Nordic' || m == 'Egyptian' || m == 'Hindu' || m == 'Chinese' || m == 'Japanese') {
      SoundService.playClick();
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) {
            if (m == 'Greek') return const GreekCategoryScreen();
            if (m == 'Nordic') return const NordicCategoryScreen();
            if (m == 'Hindu') return const HinduCategoryScreen();
            if (m == 'Chinese') return const ChineseCategoryScreen();
            if (m == 'Japanese') return const JapaneseCategoryScreen();
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
    lang.cycleLanguage();
  }

  void _showBattleDisclaimer(String lang) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: localize(lang, 'Tutup dialog', 'Dismiss dialog'),
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (ctx, a1, a2, child) {
        return FadeTransition(
          opacity: a1,
          child: ScaleTransition(
            scale: CurvedAnimation(parent: a1, curve: Curves.easeOutBack),
            child: child,
          ),
        );
      },
      pageBuilder: (dialogContext, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFB07800).withValues(alpha: 0.3)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Warning icon
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6F00).withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFFF8A00),
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                // Title
                Text(
                  localize(lang, 'Pernyataan Penting', 'Important Notice'),
                  style: AppFonts.cinzel(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFFE0E0E0),
                    letterSpacing: 1,
                  ).copyWith(decoration: TextDecoration.none),
                ),
                const SizedBox(height: 14),
                // Warning text
                Text(
                  localize(lang,
                      'Fitur "Adu Dewa" dibuat semata-mata untuk hiburan dan edukasi mengenai mitologi.\n\nKami tidak bermaksud untuk menyinggung, menyalahgunakan, atau tidak menghormati dewa-dewi dari berbagai kepercayaan.\n\nGunakan fitur ini dengan bijak dan tetap hormati mitologi yang ada.',
                      'The "God Battle" feature is created solely for entertainment and educational purposes about mythology.\n\nWe do not intend to offend, misuse, or disrespect any deities from various beliefs.\n\nUse this feature wisely and remain respectful of existing mythologies.'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFAAAAAA),
                    height: 1.6,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 24),
                // Buttons
                Row(
                  children: [
                    // Batal
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(dialogContext).pop(),
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF333333)),
                          ),
                          child: Center(
                            child: Text(
                              localize(lang, 'Batal', 'Cancel'),
                              style: const TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Lanjut
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(dialogContext).pop();
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const GodBattleScreen(),
                              transitionsBuilder: (_, anim, __, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration: const Duration(milliseconds: 300),
                            ),
                          );
                        },
                        child: Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB07800),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              localize(lang, 'Lanjut', 'Continue'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            _buildHeader(lang),
            _buildGenreCards(lang),
            _buildFeatureCards(lang),
            _buildSearchBar(lang),
            _buildResultCount(lang),
            if (_filteredGods.isEmpty)
              SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search_off_rounded,
                          size: 48, color: Color(0xFF555555)),
                      const SizedBox(height: 14),
                      Text(
                        AppStrings.get('emptyTitle', lang),
                        style: const TextStyle(
                            color: Color(0xFF999999), fontSize: 15),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        AppStrings.get('emptySubtitle', lang),
                        style: const TextStyle(
                            color: Color(0xFF555555), fontSize: 13),
                      ),
                    ],
                  ),
                ),
              )
            else
              ...List.generate(
                _filteredGods.length,
                (i) => Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: GodCard(
                    showInfoIcon: true,
                    god: _filteredGods[i],
                    isExpanded: _filteredGods[i].id == _expandedGodId,
                    entranceAnim: _stagger(i),
                    onToggle: () {
                      setState(() {
                        final tappedId = _filteredGods[i].id;
                        _expandedGodId =
                            _expandedGodId == tappedId ? null : tappedId;
                      });
                    },
                    onReturn: () => setState(() {}),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String lang) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MYTHERA',
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
                  const Icon(Icons.language,
                      color: Color(0xFFB07800), size: 16),
                  const SizedBox(width: 6),
                  Text(
                    LanguageNotifier.shortLabels[LanguageNotifier.supportedLanguages[
                        (LanguageNotifier.supportedLanguages.indexOf(lang) + 1) %
                            LanguageNotifier.supportedLanguages.length]] ?? 'EN',
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
              ),
              child: TextField(
                controller: _searchController,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  hintText: AppStrings.get('searchHint', lang),
                  hintStyle:
                      const TextStyle(color: Color(0xFF777777), fontSize: 13),
                  prefixIcon: const Icon(Icons.search_rounded,
                      color: Color(0xFFB07800), size: 18),
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 40, minHeight: 0),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close_rounded,
                              color: Color(0xFF777777), size: 16),
                          onPressed: () => _searchController.clear(),
                        )
                      : null,
                  suffixIconConstraints:
                      const BoxConstraints(minWidth: 40, minHeight: 0),
                  border: InputBorder.none,
                  isDense: true,
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Random God button — gilded dice, the app's "surprise me" action.
          GestureDetector(
            onTap: _startRandomGod,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
              child: const Icon(Icons.casino_rounded,
                  color: Colors.white, size: 23),
            ),
          ),
        ],
      ),
    );
  }

  // 6 pantheon cards (image background), horizontally scrollable, replacing
  // the old plain filter chips. Tapping opens that pantheon's god catalog.
  static const _genreCards = [
    (key: 'Greek', image: 'assets/images/greek.webp'),
    (key: 'Egyptian', image: 'assets/images/egypt.webp'),
    (key: 'Nordic', image: 'assets/images/nordik.webp'),
    (key: 'Hindu', image: 'assets/images/hindu.webp'),
    (key: 'Chinese', image: 'assets/images/cina.webp'),
    (key: 'Japanese', image: 'assets/images/japanese.webp'),
  ];

  // Genre cards with the user's onboarding realm (their patron god's pantheon)
  // moved to the front, so Discover opens on the world they chose.
  List<({String key, String image})> get _orderedGenreCards {
    final pref = OnboardingService.preferredPantheon;
    if (pref == null) return _genreCards;
    final list = [..._genreCards];
    final idx = list.indexWhere((g) => g.key == pref);
    if (idx > 0) list.insert(0, list.removeAt(idx));
    return list;
  }

  Widget _buildGenreCards(String lang) {
    final cards = _orderedGenreCards;
    return SizedBox(
      height: 108,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        itemCount: cards.length,
        itemBuilder: (_, i) {
          final g = cards[i];
          final color = GodCard.mythologyColor(g.key);
          final count = godsData.where((x) => x.mythology == g.key).length;
          return GestureDetector(
            onTap: () => _selectMythology(g.key),
            child: Container(
              width: 116,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    g.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            color.withValues(alpha: 0.55),
                            const Color(0xFF0E0E0E),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.85),
                        ],
                        stops: const [0.4, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          g.key,
                          style: GodCard.mythologyFont(
                            g.key,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          '$count ${localize(lang, 'dewa', 'gods')}',
                          style: const TextStyle(
                            color: Color(0xFFCFCFCF),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeatureCards(String lang) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: SizedBox(
        height: 54,
        child: Row(
          children: [
            Expanded(
              child: _featureCard(
                image: 'assets/images/yourgods.webp',
                fallback: const Color(0xFFB07800),
                icon: Icons.psychology_rounded,
                title: localize(lang, 'Dewa Apa Dirimu?', "What's Your God?"),
                onTap: () async {
                  // Guards against a fast double-tap pushing two QuizScreen
                  // instances (which would let the second one's early pop
                  // reset this flag while the first is still open).
                  if (MainShell.quizActive.value) return;
                  SoundService.playClick();
                  MainShell.quizActive.value = true;
                  await Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const QuizScreen(),
                      transitionsBuilder: (_, anim, __, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: const Duration(milliseconds: 300),
                    ),
                  );
                  // Guaranteed to run once QuizScreen is popped, no matter
                  // how (back button, system back, multiple pops through
                  // the result screen) — a more reliable reset than relying
                  // on the quiz screen's own dispose() alone.
                  MainShell.quizActive.value = false;
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _featureCard(
                image: 'assets/images/battle.webp',
                fallback: const Color(0xFFB07800),
                icon: Icons.flash_on_rounded,
                title: localize(lang, 'Adu Dewa', 'God Battle'),
                onTap: () {
                  SoundService.playClick();
                  _showBattleDisclaimer(lang);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Same visual language as the "Favorites" card in Codex (icon circle +
  // title + chevron in a row, left-to-right dark gradient over the image),
  // just scaled down so two of these still fit side by side.
  Widget _featureCard({
    required String image,
    required Color fallback,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(14),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      fallback.withValues(alpha: 0.5),
                      const Color(0xFF0E0E0E),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.9),
                    Colors.black.withValues(alpha: 0.7),
                    Colors.black.withValues(alpha: 0.25),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              // ClipRect: guards against overflow if this card is ever
              // squeezed narrower than its icon+text+chevron minimum width
              // (e.g. a very narrow browser window on Flutter Web).
              child: ClipRect(
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A1A),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: fallback, size: 16),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.cinzel(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded,
                        color: fallback, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
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

}

  // _buildList removed — god cards now inline in build() ListView.
