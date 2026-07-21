import 'package:flutter/material.dart';
import '../data/gods_data.dart';
import '../data/history_data.dart';
import '../l10n/language_provider.dart';
import '../services/reading_service.dart';
import '../services/sound_service.dart';
import '../widgets/god_card.dart';
import 'god_detail_screen.dart';
import 'history_story_detail_screen.dart';

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
    final lang = LanguageProvider.of(context).value;
    final id = lang == 'id';

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
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
          children: [
            _buildHeader(context, id),
            const SizedBox(height: 18),
            _buildStatsRow(id),
            const SizedBox(height: 26),

            _sectionLabel(localize(lang, 'KOLEKSI DEWA', 'GOD COLLECTION')),
            const SizedBox(height: 12),
            for (final v in _verses)
              _progressRow(v, godRead[v] ?? 0, godTotals[v] ?? 0),

            const SizedBox(height: 26),
            _sectionLabel(localize(lang, 'KISAH MITOLOGI', 'MYTH STORIES')),
            const SizedBox(height: 12),
            for (final v in versesWithStories)
              _progressRow(v, storyRead[v] ?? 0, storyTotals[v] ?? 0),

            const SizedBox(height: 26),
            _sectionLabel(localize(lang, 'BARU DIBACA', 'RECENTLY READ')),
            const SizedBox(height: 12),
            _buildRecent(context, id),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool id) {
    final lang = id ? 'id' : 'en';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_rounded, color: Colors.white, size: 22),
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
          localize(lang, 'My Myths', 'My Myths'),
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
    final lang = id ? 'id' : 'en';
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
              ? (localize(lang, '$streak hari beruntun', '$streak day streak'))
              : (localize(lang, 'Belum ada streak', 'No streak yet')),
          const Color(0xFFFF8A00),
          highlighted: streak > 0,
        ),
        _statBadge(
          Icons.auto_awesome_rounded,
          localize(lang, '$gods dewa dibaca', '$gods gods read'),
          const Color(0xFFB07800),
        ),
        _statBadge(
          Icons.auto_stories_rounded,
          localize(lang, '$stories kisah dibaca', '$stories stories read'),
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

  Widget _buildRecent(BuildContext context, bool id) {
    final lang = id ? 'id' : 'en';
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
              localize(lang, 'Belum ada yang dibaca.\nTandai kartu dewa atau kisah "sudah dibaca" untuk mulai.', 'Nothing read yet.\nMark a god card or story as read to get started.'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xFF777777), fontSize: 12.5, height: 1.5),
            ),
          ],
        ),
      );
    }
    // Flat text list: bold title, then a subtitle row (main character /
    // god title + a muted verse chip + time), divided by thin lines. Stays
    // compact even with many reads since each item is just two lines.
    return Column(
      children: [
        for (int i = 0; i < recent.length; i++) ...[
          _recentItem(context, recent[i], lang, id),
          if (i < recent.length - 1)
            const Divider(color: Color(0xFF1E1E1E), height: 1),
        ],
      ],
    );
  }

  Widget _recentItem(
      BuildContext context, RecentRead r, String lang, bool id) {
    final subtitle = _recentSubtitle(r, lang);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _openRecent(context, r),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              r.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                if (subtitle.isNotEmpty)
                  Flexible(
                    child: Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                if (subtitle.isNotEmpty) const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF262626),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    r.verse,
                    style: const TextStyle(
                      color: Color(0xFFB0B0B0),
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  _timeAgo(r.timestamp, id),
                  style:
                      const TextStyle(color: Color(0xFF777777), fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Opens the god/story a recent-read entry points to. Silently ignores an
  // entry whose underlying god/story is no longer in the data.
  void _openRecent(BuildContext context, RecentRead r) {
    Widget? page;
    if (r.type == 'story') {
      final matches = historyData.where((s) => s.id == r.id);
      if (matches.isNotEmpty) {
        page = HistoryStoryDetailScreen(story: matches.first);
      }
    } else {
      final matches = godsData.where((g) => g.id == r.id);
      if (matches.isNotEmpty) page = GodDetailScreen(god: matches.first);
    }
    if (page == null) return;
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page!,
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  // Second line under a recent-read title: the story's lead character or the
  // god's epithet, looked up live so it follows the current language.
  String _recentSubtitle(RecentRead r, String lang) {
    if (r.type == 'story') {
      final matches = historyData.where((s) => s.id == r.id);
      if (matches.isEmpty) return '';
      final chars = matches.first.localizedCharacters(lang);
      if (chars.isEmpty) return '';
      return chars.first.split(',').first.trim();
    } else {
      final matches = godsData.where((g) => g.id == r.id);
      if (matches.isEmpty) return '';
      return matches.first.localizedTitle(lang);
    }
  }

  String _timeAgo(int ts, bool id) {
    final lang = id ? 'id' : 'en';
    final diff = DateTime.now().millisecondsSinceEpoch - ts;
    final mins = diff ~/ 60000;
    if (mins < 1) return localize(lang, 'baru saja', 'just now');
    if (mins < 60) return localize(lang, '$mins mnt lalu', '${mins}m ago');
    final hours = mins ~/ 60;
    if (hours < 24) return localize(lang, '$hours jam lalu', '${hours}h ago');
    final days = hours ~/ 24;
    return localize(lang, '$days hari lalu', '${days}d ago');
  }
}
