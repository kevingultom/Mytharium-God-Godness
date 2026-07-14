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
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 20, 8),
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
                          lang == 'id'
                              ? 'Kisah ikonik mitologi ${_localizedMyth(mythology, lang)}'
                              : 'Iconic tales of ${_localizedMyth(mythology, lang)} myth',
                          style: const TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(
                '${stories.length} ${lang == 'id' ? 'kisah' : 'stories'}',
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
              lang == 'id' ? 'Kisah segera hadir' : 'Stories coming soon',
              style: const TextStyle(color: Color(0xFF999999), fontSize: 15),
            ),
            const SizedBox(height: 6),
            Text(
              lang == 'id'
                  ? 'Kisah mitologi untuk pantheon ini sedang disiapkan'
                  : 'Myth stories for this pantheon are on the way',
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
    return GestureDetector(
      onTap: () => _open(context, story),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.3)),
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
}
