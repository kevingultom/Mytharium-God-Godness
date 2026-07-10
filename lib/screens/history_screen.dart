import 'package:flutter/material.dart';
import '../models/history_model.dart';
import '../data/history_data.dart';
import '../l10n/language_provider.dart';
import '../widgets/god_card.dart';
import '../services/sound_service.dart';
import 'history_story_detail_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  static const _mythologies = ['All', 'Greek', 'Egyptian', 'Nordic', 'Hindu'];
  String _selected = 'All';

  List<MythStory> get _filtered {
    if (_selected == 'All') return historyData;
    return historyData.where((s) => s.mythology == _selected).toList();
  }

  void _open(MythStory story) {
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
    final stories = _filtered;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(lang),
            _buildFilterChips(),
            _buildCount(lang, stories.length),
            Expanded(
              child: stories.isEmpty
                  ? _buildEmpty(lang)
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                      itemCount: stories.length,
                      itemBuilder: (_, i) => _buildStoryCard(stories[i], lang),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String lang) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'HISTORY',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            lang == 'id'
                ? 'Kisah-kisah ikonik dari mitologi dunia'
                : 'Iconic tales from world mythologies',
            style: const TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12.5,
              letterSpacing: 0.5,
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
          final selected = m == _selected;
          final color =
              m == 'All' ? const Color(0xFFB07800) : GodCard.mythologyColor(m);
          return GestureDetector(
            onTap: () => setState(() => _selected = m),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: selected ? color : const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: selected ? color : const Color(0xFF333333)),
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

  Widget _buildCount(String lang, int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Text(
        '$count ${lang == 'id' ? 'kisah' : 'stories'}',
        style: const TextStyle(color: Color(0xFFD1D5DB), fontSize: 11),
      ),
    );
  }

  Widget _buildEmpty(String lang) {
    return Center(
      child: Text(
        lang == 'id' ? 'Belum ada kisah' : 'No stories yet',
        style: const TextStyle(color: Color(0xFF999999), fontSize: 15),
      ),
    );
  }

  Widget _buildStoryCard(MythStory story, String lang) {
    final color = GodCard.mythologyColor(story.mythology);

    return GestureDetector(
      onTap: () => _open(story),
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
                    story.mythology.toUpperCase(),
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
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
