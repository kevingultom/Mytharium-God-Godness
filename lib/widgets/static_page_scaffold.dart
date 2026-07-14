import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';

/// Shared layout for simple static content pages (About, Terms, Privacy, Help):
/// a back arrow + title header, plus a scrollable body of [children].
class StaticPageScaffold extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const StaticPageScaffold({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
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
                          color: Colors.white, size: 18),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    title,
                    style: AppFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A single body paragraph with the standard static-page text style.
class StaticPageParagraph extends StatelessWidget {
  final String text;

  const StaticPageParagraph(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFB0B0B0),
          fontSize: 13.5,
          height: 1.6,
        ),
      ),
    );
  }
}

/// A section heading used to break up a static page into parts.
class StaticPageHeading extends StatelessWidget {
  final String text;

  const StaticPageHeading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
