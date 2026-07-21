import 'package:flutter/material.dart';
import '../models/history_model.dart';
import '../data/history_data.dart';
import '../l10n/language_provider.dart';
import '../widgets/god_card.dart';
import '../services/sound_service.dart';
import 'history_story_detail_screen.dart';

/// Shows the mythological stories that belong to a single pantheon.
/// Reached from the Stories tab's genre cards.
class GenreStoriesScreen extends StatelessWidget {
  final String mythology;

  const GenreStoriesScreen({super.key, required this.mythology});

  List<MythStory> get _stories =>
      historyData.where((s) => s.mythology == mythology).toList();

  void _open(BuildContext context, MythStory story) {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => HistoryStoryDetailScreen(story: story),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 320),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final color = GodCard.mythologyColor(mythology);
    final stories = _stories;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header — plain back link, with the title stacked below it,
            // matching the Favorites / My Myths pattern.
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 8),
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
                  Text(
                    mythology.toUpperCase(),
                    style: GodCard.mythologyFont(
                      mythology,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    localize(lang, 'Kisah ikonik mitologi ${_localizedMyth(mythology, lang)}', 'Iconic tales of ${_localizedMyth(mythology, lang)} myth'),
                    style: const TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 11.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(
                '${stories.length} ${localize(lang, 'kisah', 'stories')}',
                style: const TextStyle(color: Color(0xFFD1D5DB), fontSize: 11),
              ),
            ),
            Expanded(
              child: stories.isEmpty
                  ? _buildEmpty(lang)
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                      itemCount: stories.length,
                      itemBuilder: (_, i) =>
                          _buildStoryCard(context, stories[i], lang, color),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  String _localizedMyth(String m, String lang) {
    if (lang != 'id') return m;
    switch (m) {
      case 'Greek':
        return 'Yunani';
      case 'Egyptian':
        return 'Mesir';
      case 'Nordic':
        return 'Nordik';
      case 'Chinese':
        return 'Tiongkok';
      case 'Japanese':
        return 'Jepang';
      default:
        return m;
    }
  }

  Widget _buildEmpty(String lang) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_stories_outlined,
                size: 48, color: Color(0xFF555555)),
            const SizedBox(height: 14),
            Text(
              localize(lang, 'Kisah segera hadir', 'Stories coming soon'),
              style: const TextStyle(color: Color(0xFF999999), fontSize: 15),
            ),
            const SizedBox(height: 6),
            Text(
              localize(lang, 'Kisah mitologi untuk pantheon ini sedang disiapkan', 'Myth stories for this pantheon are on the way'),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF555555), fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryCard(
      BuildContext context, MythStory story, String lang, Color color) {
    // Stories with an illustration get an image-backed hero card; those
    // without fall back to the original compact text card.
    if (story.imageUrl.isNotEmpty) {
      return _buildImageCard(context, story, lang, color);
    }
    return GestureDetector(
      onTap: () => _open(context, story),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    story.localizedTimeline(lang),
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    story.localizedTitle(lang),
                    style: GodCard.mythologyFont(
                      story.mythology,
                      fontSize: 15.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    story.localizedSummary(lang),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 12,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 12),
              child: Icon(Icons.chevron_right_rounded,
                  color: color.withValues(alpha: 0.7), size: 22),
            ),
          ],
        ),
      ),
    );
  }

  /// Image-backed hero card: the story illustration fills the card, with a
  /// dark bottom-up gradient so the timeline chip, title, and summary stay
  /// legible over it. The border sits on an outer container while the image
  /// is clipped by an inner [ClipRRect] with a slightly smaller radius, so
  /// the rounded corners never show a seam.
  Widget _buildImageCard(
      BuildContext context, MythStory story, String lang, Color color) {
    return GestureDetector(
      onTap: () => _open(context, story),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.45),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  story.imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFF161616),
                    alignment: Alignment.center,
                    child: Text(
                      story.icon,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                // Bottom-up scrim for text legibility.
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.35, 1.0],
                      colors: [Colors.transparent, Color(0xF2000000)],
                    ),
                  ),
                ),
                Positioned(
                  left: 14,
                  right: 14,
                  bottom: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          story.localizedTimeline(lang),
                          style: TextStyle(
                            color: color,
                            fontSize: 9.5,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        story.localizedTitle(lang),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GodCard.mythologyFont(
                          story.mythology,
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 8)
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        story.localizedSummary(lang),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFFE8E1D4),
                          fontSize: 12,
                          height: 1.4,
                          shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
