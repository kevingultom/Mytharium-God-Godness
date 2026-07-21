import 'package:flutter/material.dart';
import '../models/god_model.dart';
import '../models/history_model.dart';
import '../data/history_data.dart';
import '../data/god_tiers.dart';
import '../l10n/language_provider.dart';
import '../services/bookmark_service.dart';
import '../services/reading_service.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
import '../widgets/god_card.dart';
import 'history_story_detail_screen.dart';

const _goldBright = Color(0xFFE0A82E);
const _readGreen = Color(0xFF66BB6A);

/// Redesigned god detail: a full-bleed portrait, the god's name + powers, a
/// horizontal row of tappable "Stories" cards (the god's own legend plus any
/// myth stories that feature them), and a short one-paragraph description.
class GodDetailScreen extends StatefulWidget {
  final God god;

  const GodDetailScreen({super.key, required this.god});

  @override
  State<GodDetailScreen> createState() => _GodDetailScreenState();
}

class _GodDetailScreenState extends State<GodDetailScreen> {
  late bool _fav;
  bool _compactCard = false;

  @override
  void initState() {
    super.initState();
    _fav = widget.god.isBookmarked;
  }

  // Myth stories (the Stories feature) that feature this god.
  List<MythStory> _relatedStories() {
    final name = widget.god.name;
    bool charHas(List<String> cs) =>
        cs.any((c) => c.split(',').first.trim() == name);
    return historyData.where((s) {
      if (s.mythology != widget.god.mythology) return false;
      return s.titleEn.contains(name) ||
          s.title.contains(name) ||
          charHas(s.charactersEn) ||
          charHas(s.characters);
    }).toList();
  }

  String _powerLabel(List<String> powers) {
    if (powers.isEmpty) return '';
    final shown = powers.take(2).map((p) => p.toLowerCase()).join(' · ');
    final extra = powers.length - 2;
    return extra > 0 ? '$shown  +$extra' : shown;
  }

  Future<void> _toggleFav() async {
    SoundService.playClick();
    final ids = await BookmarkService.load();
    final nowFav = !ids.contains(widget.god.id);
    if (nowFav) {
      ids.add(widget.god.id);
    } else {
      ids.remove(widget.god.id);
    }
    await BookmarkService.save(ids);
    if (mounted) {
      setState(() {
        widget.god.isBookmarked = nowFav;
        _fav = nowFav;
      });
    }
  }

  void _openGodStory() {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => _GodStoryReaderScreen(god: widget.god),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ).then((_) {
      if (mounted) setState(() {});
    });
  }

  void _openMythStory(MythStory s) {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => HistoryStoryDetailScreen(story: s),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ).then((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final g = widget.god;
    final color = GodCard.mythologyColor(g.mythology);
    final powerLabel = _powerLabel(g.localizedPowers(lang));
    final tier = tierOf(g.mythology, g.name);
    final related = _relatedStories();
    final firstPara = g.localizedStory(lang).split('\n\n').first.trim();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Full god portrait — no crop, full image visible.
                SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        _buildImage(color, _compactCard),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 90,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black],
                              ),
                            ),
                          ),
                        ),
                        // Image size toggle — bottom-right of portrait.
                        Positioned(
                          bottom: 20,
                          right: 12,
                          child: _buildZoomToggle(),
                        ),
                        // Favorite button lives inside the scrollable
                        // portrait (not the outer Stack) so it scrolls away
                        // with the content, unlike the back button below.
                        Positioned(
                          top: 40,
                          right: 12,
                          child: _circleButton(
                            icon: _fav
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            iconColor:
                                _fav ? const Color(0xFFE53935) : Colors.white,
                            onTap: _toggleFav,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 14, 24, 44),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              g.name,
                              style: AppFonts.cinzel(
                                fontSize: 33,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          if (tier != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.military_tech_rounded,
                                      color: tier.color, size: 15),
                                  const SizedBox(width: 4),
                                  Text(
                                    tier.label,
                                    style: TextStyle(
                                      color: tier.color,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      if (powerLabel.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          powerLabel,
                          style: const TextStyle(
                            color: _goldBright,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      const SizedBox(height: 28),
                      Text(
                        localize(lang, 'Kisah', 'Stories'),
                        style: AppFonts.cinzel(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        height: 156,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          children: [
                            _storyCard(
                              title: localize(lang, 'Legenda ${g.name}', 'The Legend of ${g.name}'),
                              excerpt: firstPara,
                              read: ReadingService.isGodRead(g.id),
                              color: color,
                              lang: lang,
                              onTap: _openGodStory,
                            ),
                            for (final s in related)
                              _storyCard(
                                title: s.localizedTitle(lang),
                                excerpt: s.localizedSummary(lang),
                                read: ReadingService.isStoryRead(s.id),
                                color: color,
                                lang: lang,
                                onTap: () => _openMythStory(s),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        firstPara,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Color(0xFFB8B8B8),
                          fontSize: 15.5,
                          height: 1.75,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Floating back button — always top left, stays on scroll.
          Positioned(
            top: 40,
            left: 12,
            child: _circleButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.45),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        ),
        child: Icon(icon, color: iconColor, size: 18),
      ),
    );
  }

  /// Pill-shaped segmented control for the portrait size toggle: a sliding
  /// gold thumb animates behind whichever icon is active, so switching
  /// between full-bleed and framed portrait feels like one continuous
  /// motion instead of an instant swap.
  Widget _buildZoomToggle() {
    const btn = 34.0;
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: SizedBox(
        width: btn * 2,
        height: btn,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
              left: _compactCard ? btn : 0,
              top: 0,
              width: btn,
              height: btn,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
            ),
            Row(
              children: [
                _zoomIconBtn(
                  icon: Icons.fullscreen_rounded,
                  active: !_compactCard,
                  size: btn,
                  onTap: () => setState(() => _compactCard = false),
                ),
                _zoomIconBtn(
                  icon: Icons.fullscreen_exit_rounded,
                  active: _compactCard,
                  size: btn,
                  onTap: () => setState(() => _compactCard = true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _zoomIconBtn({
    required IconData icon,
    required bool active,
    required double size,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: AnimatedScale(
            duration: const Duration(milliseconds: 260),
            curve: Curves.easeOutCubic,
            scale: active ? 1.1 : 1.0,
            child: Icon(
              icon,
              color: active ? Colors.white : Colors.white.withValues(alpha: 0.6),
              size: 17,
            ),
          ),
        ),
      ),
    );
  }

  Widget _storyCard({
    required String title,
    required String excerpt,
    required bool read,
    required Color color,
    required String lang,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 290,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 14),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (read) ...[
                const SizedBox(width: 6),
                const Icon(Icons.check_circle_rounded,
                    color: _readGreen, size: 16),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              excerpt,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 12.5,
                height: 1.45,
              ),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  localize(lang, 'Baca', 'Read'),
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.arrow_forward_rounded, color: color, size: 13),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(Color color, bool compact) {
    Widget placeholder() => Container(
          color: color.withValues(alpha: 0.1),
          child: Center(
            child: Icon(Icons.temple_hindu_rounded,
                color: color.withValues(alpha: 0.3), size: 64),
          ),
        );
    Widget img;
    final url = widget.god.imageUrl;
    if (url.startsWith('assets/')) {
      img = Image.asset(url,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          errorBuilder: (_, __, ___) => placeholder());
    } else if (url.isNotEmpty) {
      img = Image.network(url,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          loadingBuilder: (_, child, p) => p == null ? child : placeholder(),
          errorBuilder: (_, __, ___) => placeholder());
    } else {
      img = placeholder();
    }
    // Animate continuously between full-bleed (t=0) and framed/compact
    // (t=1) instead of snapping instantly, so the toggle reads as a real
    // zoom in/out rather than a hard cut.
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: compact ? 1 : 0),
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOutCubic,
      builder: (context, t, _) {
        final scale = 1 - 0.10 * t;
        final radius = 18 * t;
        return Center(
          child: FractionallySizedBox(
            widthFactor: scale,
            heightFactor: scale,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  img,
                  // Fade edges to black for a soft frame effect, easing in
                  // alongside the shrink.
                  Opacity(
                    opacity: t,
                    child: const IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black54,
                            ],
                            stops: [0.0, 0.12, 0.88, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: t,
                    child: const IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black54,
                            ],
                            stops: [0.0, 0.12, 0.88, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// A clean reader for a god's own legend, with a Mark-as-read button.
class _GodStoryReaderScreen extends StatefulWidget {
  final God god;

  const _GodStoryReaderScreen({required this.god});

  @override
  State<_GodStoryReaderScreen> createState() => _GodStoryReaderScreenState();
}

class _GodStoryReaderScreenState extends State<_GodStoryReaderScreen> {
  late bool _read;

  @override
  void initState() {
    super.initState();
    _read = ReadingService.isGodRead(widget.god.id);
  }

  Future<void> _toggleRead() async {
    SoundService.playClick();
    final nowRead = await ReadingService.toggleGodRead(widget.god);
    if (mounted) setState(() => _read = nowRead);
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final g = widget.god;
    final color = GodCard.mythologyColor(g.mythology);
    final paragraphs = g
        .localizedStory(lang)
        .split('\n\n')
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 20, 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
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
                  Expanded(
                    child: Text(
                      localize(lang, 'Legenda ${g.name}', 'The Legend of ${g.name}'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppFonts.cinzel(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < paragraphs.length; i++) ...[
                      Text(
                        paragraphs[i],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontSize: 15,
                          height: 1.85,
                        ),
                      ),
                      if (i != paragraphs.length - 1) const SizedBox(height: 16),
                    ],
                    const SizedBox(height: 28),
                    // Mark-as-read button — part of the scrollable story
                    // itself (not a fixed bar), so it only comes into view
                    // once the user scrolls all the way to the end,
                    // confirming they've actually read through it.
                    GestureDetector(
                      onTap: _toggleRead,
                      child: Container(
                        width: double.infinity,
                        height: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _read
                              ? _readGreen.withValues(alpha: 0.16)
                              : color.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                              color: _read
                                  ? _readGreen.withValues(alpha: 0.7)
                                  : color.withValues(alpha: 0.6)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _read
                                  ? Icons.check_circle_rounded
                                  : Icons.check_circle_outline_rounded,
                              color: _read ? _readGreen : color,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _read
                                  ? (localize(lang, 'Sudah Dibaca', 'Read'))
                                  : (localize(
                                      lang, 'Tandai Dibaca', 'Mark as Read')),
                              style: TextStyle(
                                color: _read ? _readGreen : Colors.white,
                                fontSize: 14.5,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
