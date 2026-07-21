import 'package:flutter/material.dart';
import '../data/gods_data.dart';
import '../data/pop_culture_data.dart';
import '../models/god_model.dart';
import '../models/pop_culture_model.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';
import '../services/pop_culture_bookmark_service.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
import 'god_detail_screen.dart';
import 'pop_culture_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<God> get _bookmarkedGods =>
      godsData.where((g) => g.isBookmarked).toList();

  List<MythicPopCultureCharacter> get _favPopChars => popCultureData
      .where((c) => PopCultureBookmarkService.isFavorite(c.id))
      .toList();

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final gods = _bookmarkedGods;
    final popChars = _favPopChars;
    final total = gods.length + popChars.length;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header — plain back link, with the title stacked below it.
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_rounded,
                            color: Colors.white, size: 22),
                        SizedBox(width: 4),
                        Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.bookmark_rounded,
                          color: Colors.white, size: 24),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          localize(lang, 'Favorit', 'Favorites'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        '$total ${localize(lang, 'favorit', 'favorites')}',
                        style: const TextStyle(
                            color: Color(0xFFD1D5DB), fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: (gods.isEmpty && popChars.isEmpty)
                  ? _buildEmpty(lang)
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      children: [
                        if (gods.isNotEmpty)
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.72,
                            ),
                            itemCount: gods.length,
                            itemBuilder: (context, i) =>
                                _favGodCard(context, gods[i]),
                          ),
                        if (popChars.isNotEmpty) ...[
                          const SizedBox(height: 18),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, bottom: 10),
                            child: Text(
                              localize(lang, 'MYTHIC POP CULTURE', 'MYTHIC POP CULTURE'),
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

  // Full-bleed image card for a favorited god — 2 per row, name + a small
  // "mythology · category" caption overlaid at the bottom of the image.
  Widget _favGodCard(BuildContext context, God god) {
    final color = GodCard.mythologyColor(god.mythology);
    return GestureDetector(
      onTap: () {
        SoundService.playClick();
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => GodDetailScreen(god: god),
            transitionsBuilder: (_, anim, __, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 300),
          ),
        ).then((_) {
          if (mounted) setState(() {});
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              god.imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (_, __, ___) => Container(
                color: color.withValues(alpha: 0.12),
                child: Icon(Icons.shield_moon_rounded,
                    color: color.withValues(alpha: 0.5), size: 40),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.85),
                  ],
                  stops: const [0.5, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    god.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.cinzel(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${god.mythology} · ${god.category}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Color(0xFFB0B0B0), fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
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
