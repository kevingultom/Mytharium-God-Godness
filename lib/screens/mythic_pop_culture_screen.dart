import 'package:flutter/material.dart';
import '../data/pop_culture_data.dart';
import '../models/pop_culture_model.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import '../services/pop_culture_bookmark_service.dart';
import '../utils/app_fonts.dart';
import '../widgets/god_card.dart';
import 'pop_culture_detail_screen.dart';

/// Full-screen "immersive" feed of game/film/anime characters inspired by real
/// mythology — one character per screenful, scrolled vertically. The filters
/// (verse + media type) sit in a header that scrolls away above the feed.
class MythicPopCultureScreen extends StatefulWidget {
  const MythicPopCultureScreen({super.key});

  @override
  State<MythicPopCultureScreen> createState() => _MythicPopCultureScreenState();
}

class _MythicPopCultureScreenState extends State<MythicPopCultureScreen> {
  static const _verses = ['All', 'Greek', 'Nordic', 'Chinese', 'Japanese', 'Hindu'];
  static const _mediaTypes = ['All', 'Game', 'Film', 'Novel'];

  String _verseFilter = 'All';
  String _mediaFilter = 'All';

  List<MythicPopCultureCharacter> get _filtered {
    return popCultureData.where((c) {
      final matchVerse = _verseFilter == 'All' || c.originVerse == _verseFilter;
      final matchMedia = _mediaFilter == 'All' || c.mediaType == _mediaFilter;
      return matchVerse && matchMedia;
    }).toList();
  }

  void _open(MythicPopCultureCharacter c) {
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
      // Reflect a favorite that may have been toggled on the detail page.
      if (mounted) setState(() {});
    });
  }

  Future<void> _toggleFav(MythicPopCultureCharacter c) async {
    SoundService.playClick();
    await PopCultureBookmarkService.toggle(c.id);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final id = LanguageProvider.of(context).value == 'id';
    final filtered = _filtered;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cardHeight = constraints.maxHeight;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context, id),
                      _buildChipRow(_verses, _verseFilter,
                          (v) => setState(() => _verseFilter = v)),
                      const SizedBox(height: 4),
                      _buildChipRow(_mediaTypes, _mediaFilter,
                          (v) => setState(() => _mediaFilter = v)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 6, 20, 2),
                        child: Text(
                          '${filtered.length} ${id ? 'karakter' : 'characters'}',
                          style: const TextStyle(
                              color: Color(0xFFD1D5DB), fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
                if (filtered.isEmpty)
                  SliverToBoxAdapter(
                    child: SizedBox(height: cardHeight, child: _buildEmpty(id)),
                  )
                else
                  SliverFixedExtentList(
                    itemExtent: cardHeight,
                    delegate: SliverChildBuilderDelegate(
                      (context, i) => _ImmersivePcCard(
                        character: filtered[i],
                        onTap: () => _open(filtered[i]),
                        isFavorite: PopCultureBookmarkService
                            .isFavorite(filtered[i].id),
                        onToggleFavorite: () => _toggleFav(filtered[i]),
                      ),
                      childCount: filtered.length,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool id) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 20, 8),
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
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white, size: 16),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mythic Pop Culture',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  id
                      ? 'Karakter game/film & padanan mitologi aslinya'
                      : 'Game/film characters & their mythological counterparts',
                  style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChipRow(
      List<String> options, String selected, ValueChanged<String> onTap) {
    return SizedBox(
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        itemCount: options.length,
        itemBuilder: (_, i) {
          final o = options[i];
          final active = o == selected;
          const accent = Color(0xFFB07800);
          return GestureDetector(
            onTap: () {
              SoundService.playClick();
              onTap(o);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: active ? accent : const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: active ? accent : const Color(0xFF333333)),
              ),
              alignment: Alignment.center,
              child: Text(
                o,
                style: TextStyle(
                  color: active ? Colors.white : const Color(0xFFAAAAAA),
                  fontSize: 11.5,
                  fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmpty(bool id) {
    return Center(
      child: Text(
        id ? 'Tidak ada karakter ditemukan' : 'No characters found',
        style: const TextStyle(color: Color(0xFF999999), fontSize: 14),
      ),
    );
  }
}

/// Full-screen-height immersive card for one pop culture character.
class _ImmersivePcCard extends StatelessWidget {
  final MythicPopCultureCharacter character;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const _ImmersivePcCard({
    required this.character,
    required this.onTap,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  IconData get _mediaIcon {
    switch (character.mediaType) {
      case 'Film':
        return Icons.movie_rounded;
      case 'Novel':
        return Icons.menu_book_rounded;
      case 'Anime':
        return Icons.animation_rounded;
      default:
        return Icons.sports_esports_rounded; // Game
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = LanguageProvider.of(context).value == 'id';
    final color = GodCard.mythologyColor(character.originVerse);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTap,
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
                            Colors.black.withValues(alpha: 0.6),
                          ],
                          stops: const [0.62, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
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
                            Icon(_mediaIcon, color: color, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                character.sourceMedia,
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
                            isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: isFavorite
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      character.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.cinzel(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      id
                          ? 'Terinspirasi: ${character.inspiredFrom}'
                          : 'Inspired by: ${character.inspiredFrom}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xFFB0B0B0), fontSize: 12.5),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${character.originVerse} · ${character.mediaType}',
                      style: const TextStyle(
                          color: Color(0xFF777777), fontSize: 11.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 40,
                  height: 40,
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
        ],
      ),
    );
  }

  Widget _buildImage(Color color) {
    Widget placeholder() => Container(
          color: color.withValues(alpha: 0.08),
          child: Center(
            child: Icon(Icons.movie_filter_rounded,
                color: color.withValues(alpha: 0.25), size: 64),
          ),
        );
    return Image.asset(
      character.imageUrl,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      errorBuilder: (_, __, ___) => placeholder(),
    );
  }
}
