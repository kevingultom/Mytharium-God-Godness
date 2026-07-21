import 'package:flutter/material.dart';
import '../models/god_model.dart';
import '../data/gods_data.dart';
import '../l10n/language_provider.dart';
import '../services/bookmark_service.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
import '../widgets/god_card.dart';
import 'god_detail_screen.dart';

/// Full-screen "immersive" feed of gods for a single category — one god per
/// screenful, scrolled vertically, styled like the Mythic Pop Culture feed.
/// Same constructor as [CategoryGodListScreen] so it can be swapped in per
/// mythology.
class ImmersiveGodListScreen extends StatefulWidget {
  final String mythology;
  final String category;
  final String titleLabel;

  const ImmersiveGodListScreen({
    super.key,
    required this.mythology,
    required this.category,
    required this.titleLabel,
  });

  @override
  State<ImmersiveGodListScreen> createState() => _ImmersiveGodListScreenState();
}

class _ImmersiveGodListScreenState extends State<ImmersiveGodListScreen> {
  late List<God> _gods;

  @override
  void initState() {
    super.initState();
    _gods = godsData
        .where((g) =>
            g.mythology == widget.mythology && g.category == widget.category)
        .toList();
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final ids = await BookmarkService.load();
    for (final g in _gods) {
      g.isBookmarked = ids.contains(g.id);
    }
    if (mounted) setState(() {});
  }

  Future<void> _toggleFav(God god) async {
    SoundService.playClick();
    final ids = await BookmarkService.load();
    final nowFav = !ids.contains(god.id);
    if (nowFav) {
      ids.add(god.id);
    } else {
      ids.remove(god.id);
    }
    await BookmarkService.save(ids);
    if (mounted) setState(() => god.isBookmarked = nowFav);
  }

  void _openDetail(God god) {
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
      if (mounted) _loadBookmarks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;

    return Scaffold(
      backgroundColor: Colors.black,
      // Exactly one back button for the whole screen — a Positioned overlay
      // sitting on top of the scrolling feed, same structure and offsets as
      // GodDetailScreen's floating button. (Each card keeps its own
      // favorite heart, since that's genuinely per-god; the back button
      // isn't, so it no longer lives inside _ImmersiveGodCard.)
      body: Stack(
        children: [
          SafeArea(
            child: _gods.isEmpty
                ? _buildEmpty(lang)
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final cardHeight = constraints.maxHeight.isFinite
                          ? constraints.maxHeight
                          : MediaQuery.of(context).size.height;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemExtent: cardHeight,
                        itemCount: _gods.length,
                        itemBuilder: (context, i) => _ImmersiveGodCard(
                          god: _gods[i],
                          lang: lang,
                          onTap: () => _openDetail(_gods[i]),
                          onToggleFavorite: () => _toggleFav(_gods[i]),
                        ),
                      );
                    },
                  ),
          ),
          Positioned(
            top: 40,
            left: 12,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2)),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty(String lang) {
    return Center(
      child: Text(
        localize(lang, 'Belum ada dewa di kategori ini', 'No gods in this category yet'),
        style: const TextStyle(color: Color(0xFF999999), fontSize: 14),
      ),
    );
  }
}

/// Full-screen-height immersive card for one god.
class _ImmersiveGodCard extends StatelessWidget {
  final God god;
  final String lang;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  const _ImmersiveGodCard({
    required this.god,
    required this.lang,
    required this.onTap,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final color = GodCard.mythologyColor(god.mythology);
    final powers = god.localizedPowers(lang).take(3).join(' · ');

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: ClipRect(
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildImage(color),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.62),
                          ],
                          stops: const [0.6, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    // Role badge (gold-book icon + title) — the book matches
                    // the "My Myths" feature icon for a consistent look.
                    Positioned(
                      left: 14,
                      right: 14,
                      bottom: 14,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 11),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.45),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.25)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.auto_stories_rounded,
                                color: Color(0xFFB07800), size: 15),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                god.localizedTitle(lang),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Favorite heart
                    Positioned(
                      top: 12,
                      right: 12,
                      child: GestureDetector(
                        onTap: onToggleFavorite,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.45),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white.withValues(alpha: 0.2)),
                          ),
                          child: Icon(
                            god.isBookmarked
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: god.isBookmarked
                                ? const Color(0xFFE53935)
                                : Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Wrapped in ClipRect: guards against a brief 1-frame RenderFlex
          // overflow on Flutter Web while the custom Cinzel font is still
          // loading (the fallback font's metrics are slightly wider until
          // the real font swaps in).
          ClipRect(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        god.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.cinzel(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.15,
                        ),
                      ),
                      if (powers.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          powers,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color(0xFFB0B0B0), fontSize: 12.5),
                        ),
                      ],
                      const SizedBox(height: 3),
                      Text(
                        '${god.mythology} · ${god.category}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Color(0xFF777777), fontSize: 11.5),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF333333)),
                    ),
                    child: const Icon(Icons.info_outline_rounded,
                        color: Colors.white, size: 20),
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

  Widget _buildImage(Color color) {
    Widget placeholder() => Container(
          color: color.withValues(alpha: 0.08),
          child: Center(
            child: Icon(Icons.temple_hindu_rounded,
                color: color.withValues(alpha: 0.25), size: 64),
          ),
        );
    final url = god.imageUrl;
    if (url.startsWith('assets/')) {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        errorBuilder: (_, __, ___) => placeholder(),
      );
    } else if (url.isNotEmpty) {
      return Image.network(
        url,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        loadingBuilder: (_, child, progress) =>
            progress == null ? child : placeholder(),
        errorBuilder: (_, __, ___) => placeholder(),
      );
    }
    return placeholder();
  }
}
