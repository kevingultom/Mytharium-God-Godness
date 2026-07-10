import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/god_model.dart';
import '../screens/detail_screen.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';
import '../services/sound_service.dart';

class GodCard extends StatefulWidget {
  final God god;
  final bool isExpanded;
  final Animation<double> entranceAnim;
  final VoidCallback onToggle;
  final VoidCallback onReturn;

  const GodCard({
    super.key,
    required this.god,
    required this.isExpanded,
    required this.entranceAnim,
    required this.onToggle,
    required this.onReturn,
  });

  static Color mythologyColor(String mythology) {
    switch (mythology) {
      case 'Greek':    return const Color(0xFF6B1013);
      case 'Egyptian': return const Color(0xFFD97706);
      case 'Nordic':   return const Color(0xFF2563EB);
      case 'Hindu':    return const Color(0xFFFF6F00);
      default:         return const Color(0xFF7C3AED);
    }
  }

  static TextStyle mythologyFont(String mythology, {
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w700,
    Color? color,
    List<Shadow>? shadows,
    letterSpacing,
  }) {
    switch (mythology) {
      case 'Greek':
        return GoogleFonts.cinzel(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      case 'Egyptian':
        return GoogleFonts.cinzelDecorative(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      case 'Nordic':
        return GoogleFonts.medievalSharp(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      case 'Hindu':
        return GoogleFonts.yatraOne(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          shadows: shadows,
          letterSpacing: letterSpacing,
        );
      default:
        return GoogleFonts.cinzel(
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

  Widget _buildImage() {
    final url = widget.god.imageUrl;
    if (url.startsWith('assets/')) {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, __, ___) => Container(color: const Color(0xFF222222)),
      );
    } else if (url.isNotEmpty) {
      return Image.network(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, __, ___) => Container(color: const Color(0xFF222222)),
      );
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
        pageBuilder: (_, __, ___) =>
            DetailScreen(god: widget.god, onReturn: widget.onReturn),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
                        onPressed: _navigateToDetail,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                        ),
                        child: Text(
                          AppStrings.get('learnMore', lang),
                          style: const TextStyle(
                            color: Colors.white,
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
