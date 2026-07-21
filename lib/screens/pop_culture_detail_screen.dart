import 'package:flutter/material.dart';
import '../data/god_tiers.dart';
import '../data/gods_data.dart';
import '../models/pop_culture_model.dart';
import '../l10n/language_provider.dart';
import '../services/pop_culture_bookmark_service.dart';
import '../services/sound_service.dart';
import '../utils/app_fonts.dart';
import '../widgets/god_card.dart';
import 'god_detail_screen.dart';

class PopCultureDetailScreen extends StatefulWidget {
  final MythicPopCultureCharacter character;

  const PopCultureDetailScreen({super.key, required this.character});

  @override
  State<PopCultureDetailScreen> createState() => _PopCultureDetailScreenState();
}

class _PopCultureDetailScreenState extends State<PopCultureDetailScreen> {
  bool _compactCard = false;

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final color = GodCard.mythologyColor(widget.character.originVerse);
    final original = godsData.where(
      (g) => g.name.toLowerCase() == widget.character.inspiredFrom.toLowerCase(),
    );
    final originalGod = original.isEmpty ? null : original.first;
    final character = widget.character;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero image — full 3:4 portrait, scrolls away with the rest
                // of the content, exactly like the god detail screen.
                SizedBox(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                      _buildImage(color, _compactCard),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.6),
                              Colors.black,
                            ],
                            stops: const [0.3, 0.75, 1.0],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      // Favorite button lives inside the scrollable hero
                      // image (not the outer Stack) so it scrolls away with
                      // the content, unlike the back button below.
                      Positioned(
                        top: 40,
                        right: 12,
                        child: StatefulBuilder(
                          builder: (context, setLocal) {
                            final fav = PopCultureBookmarkService.isFavorite(
                                character.id);
                            return _circleButton(
                              icon: fav
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              iconColor: fav
                                  ? const Color(0xFFE53935)
                                  : Colors.white,
                              onTap: () async {
                                SoundService.playClick();
                                await PopCultureBookmarkService.toggle(
                                    character.id);
                                if (mounted) setLocal(() {});
                              },
                            );
                          },
                        ),
                      ),
                      // Image size toggle — bottom-right of portrait.
                      Positioned(
                        bottom: 20,
                        right: 12,
                        child: _buildZoomToggle(),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                color: color.withValues(alpha: 0.25),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: color.withValues(alpha: 0.6)),
                              ),
                              child: Text(
                                '${character.mediaType} · ${character.originVerse}',
                                style: TextStyle(
                                  color: color,
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: Text(
                                    character.name,
                                    style: AppFonts.cinzel(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.military_tech_rounded,
                                          color: popCultureTier.color,
                                          size: 15),
                                      const SizedBox(width: 4),
                                      Text(
                                        popCultureTier.label,
                                        style: TextStyle(
                                          color: popCultureTier.color,
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
                            const SizedBox(height: 2),
                            Text(
                              character.sourceMedia,
                              style: const TextStyle(
                                color: Color(0xFFD1D5DB),
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _infoRow(localize(lang, 'Developer/Rilis', 'Developer/Release'),
                          character.developer),
                      const SizedBox(height: 14),
                      _sectionLabel(localize(lang, 'DOMAIN', 'DOMAIN'), color),
                      const SizedBox(height: 6),
                      Text(
                        character.localizedDomain(lang),
                        style: const TextStyle(
                            color: Color(0xFFDDDDDD),
                            fontSize: 13.5,
                            height: 1.5),
                      ),
                      if (character.iconicWeapon.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        _sectionLabel(
                            localize(lang, 'SENJATA IKONIK', 'ICONIC WEAPON'), color),
                        const SizedBox(height: 6),
                        Text(
                          character.localizedWeapon(lang),
                          style: const TextStyle(
                              color: Color(0xFFDDDDDD),
                              fontSize: 13.5,
                              height: 1.5),
                        ),
                      ],
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF111111),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.lightbulb_rounded,
                                    color: Colors.white, size: 16),
                                const SizedBox(width: 8),
                                Text(
                                  localize(lang, 'TAHUKAH KAMU?', 'DID YOU KNOW?'),
                                  style: AppFonts.cinzel(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              character.localizedFunFact(lang),
                              style: const TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontSize: 13,
                                height: 1.55,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        localize(lang, 'BANDINGKAN DENGAN ASLINYA', 'COMPARE TO ORIGINAL'),
                        style: AppFonts.cinzel(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF9CA3AF),
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      originalGod != null
                          ? _buildOriginalCard(context, originalGod, lang)
                          : _buildNoMatchCard(lang == 'id'),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF111111),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.military_tech_rounded,
                                    color: popCultureTier.color, size: 16),
                                const SizedBox(width: 8),
                                Text(
                                  'TIER: ${popCultureTier.label.toUpperCase()}',
                                  style: TextStyle(
                                    color: popCultureTier.color,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              popCultureTier.localizedDescription(lang),
                              style: const TextStyle(
                                color: Color(0xFF999999),
                                fontSize: 11.5,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Floating back button — top left, stays on top while scrolling.
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

  Widget _buildImage(Color color, bool compact) {
    Widget placeholder() => Container(
          color: color.withValues(alpha: 0.08),
          child: Center(
            child: Icon(Icons.movie_filter_rounded,
                color: color.withValues(alpha: 0.3), size: 64),
          ),
        );
    Widget img = Image.asset(
      widget.character.imageUrl,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      errorBuilder: (_, __, ___) => placeholder(),
    );
    if (compact) {
      return Center(
        child: FractionallySizedBox(
          widthFactor: 0.90,
          heightFactor: 0.90,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                img,
                IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
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
                IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
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
              ],
            ),
          ),
        ),
      );
    }
    return img;
  }

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

  Widget _sectionLabel(String text, Color color) {
    return Text(
      text,
      style: AppFonts.cinzel(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          child: Text(
            label,
            style: const TextStyle(color: Color(0xFF888888), fontSize: 12.5),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontSize: 12.5, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildOriginalCard(BuildContext context, dynamic originalGod, String lang) {
    final color = GodCard.mythologyColor(originalGod.mythology);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => GodDetailScreen(god: originalGod),
            transitionsBuilder: (_, anim, __, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 300),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 56,
                height: 72,
                child: originalGod.imageUrl.toString().startsWith('assets/')
                    ? Image.asset(originalGod.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                            color: color.withValues(alpha: 0.1)))
                    : Container(color: color.withValues(alpha: 0.1)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    originalGod.name,
                    style: GodCard.mythologyFont(
                      originalGod.mythology,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    originalGod.localizedTitle(lang),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: color, fontSize: 11.5),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNoMatchCard(bool id) {
    final lang = id ? 'id' : 'en';
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline_rounded,
              color: Color(0xFF666666), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              localize(lang, 'Belum ada kartu dewa untuk "${widget.character.inspiredFrom}" di katalog utama — tokoh ini terlalu minor dalam mitologi asli untuk punya kisah tersendiri.', 'No god card yet for "${widget.character.inspiredFrom}" in the main catalog — this figure is too minor in the original mythology to have a story of its own.'),
              style: const TextStyle(
                color: Color(0xFF999999),
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
