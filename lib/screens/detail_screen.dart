import 'package:flutter/material.dart';
import '../models/god_model.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';
import '../services/bookmark_service.dart';
import '../data/gods_data.dart';

class DetailScreen extends StatefulWidget {
  final God god;
  final VoidCallback onReturn;

  const DetailScreen({super.key, required this.god, required this.onReturn});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnim = CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.25, 1.0, curve: Curves.easeOut),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.07),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _ctrl,
      curve: const Interval(0.25, 1.0, curve: Curves.easeOutCubic),
    ));
    // Start after hero image settles
    Future.delayed(const Duration(milliseconds: 180), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggleBookmark() {
    setState(() => widget.god.isBookmarked = !widget.god.isBookmarked);
    // Persist bookmark IDs
    final bookmarkedIds = godsData
        .where((g) => g.isBookmarked)
        .map((g) => g.id)
        .toSet();
    BookmarkService.save(bookmarkedIds);
    widget.onReturn();
    final lang = LanguageProvider.of(context).value;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.god.isBookmarked
              ? '${widget.god.name} ${AppStrings.get("bookmarkAdded", lang)}'
              : '${widget.god.name} ${AppStrings.get("bookmarkRemoved", lang)}',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  // Gods whose portrait looks better centered instead of top-anchored.
  static const _centeredGods = {'Crius', 'Hyperion', 'Atlas', 'Menoetius', 'Thanatos', 'Nereus', 'Heracles'};

  Widget _buildHeroImage() {
    final url = widget.god.imageUrl;
    final color = GodCard.mythologyColor(widget.god.mythology);
    final align = _centeredGods.contains(widget.god.name)
        ? Alignment.center
        : Alignment.topCenter;
    if (url.startsWith('assets/')) {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        alignment: align,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, __, ___) => _placeholder(color),
      );
    } else if (url.isNotEmpty) {
      return Image.network(
        url,
        fit: BoxFit.cover,
        alignment: align,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (_, child, progress) =>
            progress == null ? child : _placeholder(color),
        errorBuilder: (_, __, ___) => _placeholder(color),
      );
    }
    return _placeholder(color);
  }

  Widget _placeholder(Color color) {
    return Container(
      color: color.withValues(alpha: 0.06),
      child: Center(
        child: Icon(Icons.image_outlined, color: color.withValues(alpha: 0.25), size: 64),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = GodCard.mythologyColor(widget.god.mythology);
    final lang = LanguageProvider.of(context).value;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(color, lang),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: _buildContent(color, lang),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(Color color, String lang) {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF333333)),
              boxShadow: const [
                BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 2)),
              ],
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            _buildHeroImage(),
            // Cinematic gradient: dark vignette bottom + subtle top
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.35, 0.75, 1.0],
                    colors: [
                      Colors.black.withValues(alpha: 0.25),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.75),
                      Colors.black,
                    ],
                  ),
                ),
              ),
            ),
            // Name + title pinned at bottom of hero
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mythology badge
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: color.withValues(alpha: 0.45)),
                    ),
                    child: Text(
                      widget.god.mythology,
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Text(
                    widget.god.name,
                    style: GodCard.mythologyFont(
                      widget.god.mythology,
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 0.5,
                      shadows: [Shadow(color: Colors.black, blurRadius: 12)],
                    ),
                  ),
                  Text(
                    widget.god.localizedTitle(lang),
                    style: TextStyle(
                      color: color,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
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

  Widget _buildContent(Color color, String lang) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.god.category != 'Cosmology') ...[
            _sectionTitle(AppStrings.get('sectionPowers', lang), color),
            const SizedBox(height: 12),
            _buildPowers(color, lang),
            const SizedBox(height: 28),
          ],
          _sectionTitle(
            AppStrings.get('sectionStory', lang),
            color,
            trailing: GestureDetector(
              onTap: _toggleBookmark,
              child: Icon(
                widget.god.isBookmarked
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: widget.god.isBookmarked
                    ? const Color(0xFF7B1FA2)
                    : Colors.white38,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildStory(lang),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, Color color, {Widget? trailing}) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 18,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        if (trailing != null) ...[
          const Spacer(),
          trailing,
        ],
      ],
    );
  }

  Widget _buildPowers(Color color, String lang) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.god.localizedPowers(lang).map((p) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Text(
                p,
                style: TextStyle(
                  color: color,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStory(String lang) {
    final paragraphs = widget.god
        .localizedStory(lang)
        .split('\n\n')
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < paragraphs.length; i++) ...[
            Text(
              paragraphs[i],
              style: const TextStyle(
                color: Color(0xFFCCCCCC),
                fontSize: 14.5,
                height: 1.8,
              ),
            ),
            if (i != paragraphs.length - 1) const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }
}
