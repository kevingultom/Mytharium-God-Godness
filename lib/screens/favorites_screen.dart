import 'package:flutter/material.dart';
import '../data/gods_data.dart';
import '../data/pop_culture_data.dart';
import '../models/pop_culture_model.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';
import '../services/pop_culture_bookmark_service.dart';
import '../services/sound_service.dart';
import 'pop_culture_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with SingleTickerProviderStateMixin {
  String? _expandedGodId;
  late final AnimationController _staggerCtrl;

  List get _bookmarkedGods => godsData.where((g) => g.isBookmarked).toList();

  List<MythicPopCultureCharacter> get _favPopChars => popCultureData
      .where((c) => PopCultureBookmarkService.isFavorite(c.id))
      .toList();

  @override
  void initState() {
    super.initState();
    _staggerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _staggerCtrl.dispose();
    super.dispose();
  }

  Animation<double> _stagger(int index) {
    final count = _bookmarkedGods.length.clamp(1, 20);
    final start = (index / count).clamp(0.0, 1.0);
    final end = ((index + 1) / count).clamp(0.0, 1.0);
    return CurvedAnimation(
      parent: _staggerCtrl,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final id = lang == 'id';
    final gods = _bookmarkedGods;
    final popChars = _favPopChars;
    final total = gods.length + popChars.length;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF333333)),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Icon(Icons.bookmark_rounded,
                      color: Color(0xFFB07800), size: 20),
                  const SizedBox(width: 8),
                  Text(
                    id ? 'FAVORIT' : 'FAVORITES',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(
                '$total ${id ? 'favorit' : 'favorites'}',
                style: const TextStyle(color: Color(0xFFD1D5DB), fontSize: 11),
              ),
            ),
            Expanded(
              child: (gods.isEmpty && popChars.isEmpty)
                  ? _buildEmpty(lang)
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      children: [
                        for (int i = 0; i < gods.length; i++)
                          GodCard(
                            god: gods[i],
                            isExpanded: gods[i].id == _expandedGodId,
                            entranceAnim: _stagger(i),
                            onToggle: () {
                              setState(() {
                                final tappedId = gods[i].id;
                                _expandedGodId =
                                    _expandedGodId == tappedId ? null : tappedId;
                              });
                            },
                            onReturn: () => setState(() {}),
                          ),
                        if (popChars.isNotEmpty) ...[
                          const SizedBox(height: 18),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, bottom: 10),
                            child: Text(
                              id ? 'MYTHIC POP CULTURE' : 'MYTHIC POP CULTURE',
                              style: const TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          for (final c in popChars) _buildPopRow(c),
                        ],
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty(String lang) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.bookmark_border_rounded,
              size: 48, color: Color(0xFF555555)),
          const SizedBox(height: 14),
          Text(
            AppStrings.get('emptyBookmarks', lang),
            style: const TextStyle(color: Color(0xFF999999), fontSize: 15),
          ),
          const SizedBox(height: 6),
          Text(
            AppStrings.get('emptyBookmarksSub', lang),
            style: const TextStyle(color: Color(0xFF555555), fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildPopRow(MythicPopCultureCharacter c) {
    final color = GodCard.mythologyColor(c.originVerse);
    return GestureDetector(
      onTap: () {
        SoundService.playClick();
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => PopCultureDetailScreen(character: c),
            transitionsBuilder: (_, anim, __, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 300),
          ),
        ).then((_) {
          if (mounted) setState(() {});
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 54,
                height: 54,
                child: Image.asset(
                  c.imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (_, __, ___) => Container(
                    color: color.withValues(alpha: 0.1),
                    child: Icon(Icons.movie_filter_rounded,
                        color: color.withValues(alpha: 0.4), size: 22),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    c.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    c.sourceMedia,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Color(0xFF9CA3AF), fontSize: 11.5),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () async {
                await PopCultureBookmarkService.toggle(c.id);
                if (mounted) setState(() {});
              },
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.favorite_rounded,
                    color: Color(0xFFE53935), size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
