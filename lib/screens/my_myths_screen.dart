import 'package:flutter/material.dart';
import '../data/gods_data.dart';
import '../data/history_data.dart';
import '../l10n/language_provider.dart';
import '../services/reading_service.dart';
import '../widgets/god_card.dart';

/// The user's reading "Library": how many god cards and myth stories they've
/// read (per pantheon), a day-based reading streak, and their recent reads.
/// Reflects whatever has been marked read from the god/story detail screens.
class MyMythsScreen extends StatelessWidget {
  const MyMythsScreen({super.key});

  static const _verses = [
    'Greek',
    'Egyptian',
    'Nordic',
    'Hindu',
    'Chinese',
    'Japanese',
  ];

  @override
  Widget build(BuildContext context) {
    final id = LanguageProvider.of(context).value == 'id';

    // Per-pantheon totals & read counts.
    final godTotals = <String, int>{};
    final godRead = <String, int>{};
    final storyTotals = <String, int>{};
    final storyRead = <String, int>{};
    for (final v in _verses) {
      final gods = godsData.where((g) => g.mythology == v);
      godTotals[v] = gods.length;
      godRead[v] = gods.where((g) => ReadingService.isGodRead(g.id)).length;
      final stories = historyData.where((s) => s.mythology == v);
      storyTotals[v] = stories.length;
      storyRead[v] =
          stories.where((s) => ReadingService.isStoryRead(s.id)).length;
    }
    final versesWithStories =
        _verses.where((v) => (storyTotals[v] ?? 0) > 0).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          children: [
            _buildHeader(context, id),
            const SizedBox(height: 18),
            _buildStatsRow(id),
            const SizedBox(height: 26),

            _sectionLabel(id ? 'KOLEKSI DEWA' : 'GOD COLLECTION'),
            const SizedBox(height: 12),
            for (final v in _verses)
              _progressRow(v, godRead[v] ?? 0, godTotals[v] ?? 0),

            const SizedBox(height: 26),
            _sectionLabel(id ? 'KISAH MITOLOGI' : 'MYTH STORIES'),
            const SizedBox(height: 12),
            for (final v in versesWithStories)
              _progressRow(v, storyRead[v] ?? 0, storyTotals[v] ?? 0),

            const SizedBox(height: 26),
            _sectionLabel(id ? 'BARU DIBACA' : 'RECENTLY READ'),
            const SizedBox(height: 12),
            _buildRecent(id),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool id) {
    return Row(
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
        const SizedBox(width: 14),
        Text(
          id ? 'My Myths' : 'My Myths',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow(bool id) {
    final streak = ReadingService.streak;
    final gods = ReadingService.godsReadCount;
    final stories = ReadingService.storiesReadCount;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _statBadge(
          Icons.local_fire_department_rounded,
          streak > 0
              ? (id ? '$streak hari beruntun' : '$streak day streak')
              : (id ? 'Belum ada streak' : 'No streak yet'),
          const Color(0xFFFF8A00),
          highlighted: streak > 0,
        ),
        _statBadge(
          Icons.auto_awesome_rounded,
          id ? '$gods dewa dibaca' : '$gods gods read',
          const Color(0xFFB07800),
        ),
        _statBadge(
          Icons.auto_stories_rounded,
          id ? '$stories kisah dibaca' : '$stories stories read',
          const Color(0xFFB07800),
        ),
      ],
    );
  }

  Widget _statBadge(IconData icon, String text, Color color,
      {bool highlighted = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: highlighted
            ? color.withValues(alpha: 0.12)
            : const Color(0xFF141414),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: highlighted
                ? color.withValues(alpha: 0.6)
                : const Color(0xFF2A2A2A)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 15),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: highlighted ? color : const Color(0xFFCCCCCC),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF9CA3AF),
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _progressRow(String verse, int read, int total) {
    final color = GodCard.mythologyColor(verse);
    final pct = total == 0 ? 0.0 : (read / total).clamp(0.0, 1.0);
    final done = total > 0 && read >= total;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          SizedBox(
            width: 84,
            child: Text(
              verse,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: pct,
                minHeight: 6,
                backgroundColor: const Color(0xFF222222),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 46,
            child: Text(
              '$read/$total',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: done ? color : const Color(0xFF9CA3AF),
                fontSize: 11.5,
                fontWeight: done ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecent(bool id) {
    final recent = ReadingService.recent;
    if (recent.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF222222)),
        ),
        child: Column(
          children: [
            const Icon(Icons.menu_book_outlined,
                color: Color(0xFF555555), size: 32),
            const SizedBox(height: 10),
            Text(
              id
                  ? 'Belum ada yang dibaca.\nTandai kartu dewa atau kisah "sudah dibaca" untuk mulai.'
                  : 'Nothing read yet.\nMark a god card or story as read to get started.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xFF777777), fontSize: 12.5, height: 1.5),
            ),
          ],
        ),
      );
    }
    return Column(
      children: recent.map((r) => _recentItem(r, id)).toList(),
    );
  }

  Widget _recentItem(RecentRead r, bool id) {
    final color = GodCard.mythologyColor(r.verse);
    final isStory = r.type == 'story';
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF222222)),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isStory ? Icons.auto_stories_rounded : Icons.person_rounded,
              color: color,
              size: 19,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  r.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 1.5),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        r.verse,
                        style: TextStyle(
                          color: color,
                          fontSize: 9.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _timeAgo(r.timestamp, id),
                      style: const TextStyle(
                          color: Color(0xFF777777), fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _timeAgo(int ts, bool id) {
    final diff = DateTime.now().millisecondsSinceEpoch - ts;
    final mins = diff ~/ 60000;
    if (mins < 1) return id ? 'baru saja' : 'just now';
    if (mins < 60) return id ? '$mins mnt lalu' : '${mins}m ago';
    final hours = mins ~/ 60;
    if (hours < 24) return id ? '$hours jam lalu' : '${hours}h ago';
    final days = hours ~/ 24;
    return id ? '$days hari lalu' : '${days}d ago';
  }
}
