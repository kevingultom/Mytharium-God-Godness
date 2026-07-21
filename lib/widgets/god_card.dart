import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import '../models/god_model.dart';
import '../screens/god_detail_screen.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';
import '../services/sound_service.dart';

class GodCard extends StatefulWidget {
  final God god;
  final bool isExpanded;
  final Animation<double> entranceAnim;
  final VoidCallback onToggle;
  final VoidCallback onReturn;
  final bool showInfoIcon;

  const GodCard({
    super.key,
    required this.god,
    required this.isExpanded,
    required this.entranceAnim,
    required this.onToggle,
    required this.onReturn,
    this.showInfoIcon = true,
  });

  static Color mythologyColor(String mythology) {
    switch (mythology) {
      case 'Greek':
        return const Color(0xFF0E7490);
      case 'Egyptian':
        return const Color(0xFFD97706);
      case 'Nordic':
        return const Color(0xFF2563EB);
      case 'Hindu':
        return const Color(0xFFFF6F00);
      case 'Chinese':
        return const Color(0xFFC8102E);
      case 'Japanese':
        return const Color(0xFFDB2763);
      default:
        return const Color(0xFF7C3AED);
    }
  }

  static TextStyle mythologyFont(
    String mythology, {
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w700,
    Color? color,
    List<Shadow>? shadows,
    double? letterSpacing,
  }) {
    switch (mythology) {
      case 'Greek':
        return AppFonts.cinzel(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      case 'Egyptian':
        return AppFonts.cinzelDecorative(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      case 'Nordic':
        return AppFonts.medievalSharp(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      case 'Hindu':
        return AppFonts.yatraOne(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      case 'Chinese':
        return AppFonts.cinzelDecorative(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      case 'Japanese':
        return AppFonts.cinzel(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      default:
        return AppFonts.cinzel(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
    }
  }

  @override
  State<GodCard> createState() => _GodCardState();
}

class _GodCardState extends State<GodCard> {
  static const _bottomAlignNames = {'Yama'};
  // Portraits whose faces sit well above image-center; raised further up
  // than the default topCenter crop so the face is never cut off.
  static const _raisedAlignments = {
    'Bhishma': Alignment(0, -0.7),
    'Ashwini Kumaras': Alignment(0, -0.55),
    'Vishwakarma': Alignment(0, -0.3),
    'Asura': Alignment(0, -0.25),
  };

  Widget _buildImage() {
    final url = widget.god.imageUrl;
    final name = widget.god.name;
    final align = _bottomAlignNames.contains(name)
        ? Alignment.bottomCenter
        : (_raisedAlignments[name] ?? Alignment.topCenter);

    if (url.startsWith('assets/')) {
      return Image.asset(url, fit: BoxFit.cover, alignment: align,
        width: double.infinity, height: double.infinity,
        errorBuilder: (_, __, ___) => Container(color: const Color(0xFF222222)));
    } else if (url.isNotEmpty) {
      return Image.network(url, fit: BoxFit.cover, alignment: align,
        width: double.infinity, height: double.infinity,
        errorBuilder: (_, __, ___) => Container(color: const Color(0xFF222222)));
    }
    return Container(color: const Color(0xFF222222));
  }

  Future<void> _navigateToDetail() async {
    SoundService.playClick();
    await Future.delayed(const Duration(milliseconds: 80));
    if (!mounted) return;
    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => GodDetailScreen(god: widget.god),
        transitionsBuilder: (_, anim, __, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
    widget.onReturn();
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;

    return FadeTransition(
      opacity: widget.entranceAnim,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).animate(widget.entranceAnim),
        child: GestureDetector(
          onTap: widget.onToggle,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(bottom: 2),
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Banner Section
                SizedBox(
                  height: 110,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _buildImage(),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withValues(alpha: 0.9),
                              Colors.black.withValues(alpha: 0.5),
                              Colors.transparent,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                      if (widget.showInfoIcon)
                        Positioned(
                          top: 12,
                          right: 12,
                          child: GestureDetector(
                            onTap: _navigateToDetail,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.info_outline,
                                color: Colors.white70,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.god.name,
                              style: GodCard.mythologyFont(
                                widget.god.mythology,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.god.localizedTitle(lang),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Expanded Section
                if (widget.isExpanded)
                  Container(
                    color: const Color(0xFF1A1A1A),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.god.localizedStory(lang).split('\n\n').first,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: OutlinedButton(
                            onPressed: widget.showInfoIcon ? widget.onToggle : _navigateToDetail,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: widget.showInfoIcon ? Colors.white24 : Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 10),
                            ),
                            child: Text(
                              widget.showInfoIcon
                                  ? localize(lang, 'Tutup', 'Close')
                                  : AppStrings.get('learnMore', lang),
                              style: TextStyle(
                                color: widget.showInfoIcon ? Colors.white54 : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
