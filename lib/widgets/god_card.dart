import 'package:flutter/material.dart';
import '../models/god_model.dart';
import '../screens/detail_screen.dart';

class GodCard extends StatelessWidget {
  final God god;
  final VoidCallback onReturn;

  const GodCard({super.key, required this.god, required this.onReturn});

  static Color mythologyColor(String mythology) {
    switch (mythology) {
      case 'Greek': return const Color(0xFF60A5FA);
      case 'Egyptian': return const Color(0xFFFBBF24);
      case 'Nordic': return const Color(0xFF34D399);
      case 'Hindu': return const Color(0xFFF472B6);
      default: return const Color(0xFFA78BFA);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = mythologyColor(god.mythology);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, a, __) => DetailScreen(god: god, onReturn: onReturn),
            transitionsBuilder: (_, anim, __, child) => SlideTransition(
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
              child: child,
            ),
            transitionDuration: const Duration(milliseconds: 280),
          ),
        ).then((_) => onReturn());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1528),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withValues(alpha: 0.18), width: 1),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.07),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            _Portrait(god: god, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            god.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                        if (god.isBookmarked)
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.favorite,
                              color: const Color(0xFFA78BFA),
                              size: 14,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      god.title,
                      style: TextStyle(
                        color: const Color(0xFFFFC107).withValues(alpha: 0.85),
                        fontSize: 11.5,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 9),
                    Row(
                      children: [
                        _MythBadge(label: god.mythology, color: color),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: color.withValues(alpha: 0.4),
                          size: 13,
                        ),
                        const SizedBox(width: 14),
                      ],
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

class _Portrait extends StatelessWidget {
  final God god;
  final Color color;
  const _Portrait({required this.god, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.45), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.22),
            blurRadius: 14,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.5),
        child: god.imageUrl.isNotEmpty
            ? Image.network(
                god.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (_, child, progress) =>
                    progress == null ? child : _Fallback(god: god, color: color),
                errorBuilder: (_, __, ___) =>
                    _Fallback(god: god, color: color),
              )
            : _Fallback(god: god, color: color),
      ),
    );
  }
}

class _Fallback extends StatelessWidget {
  final God god;
  final Color color;
  const _Fallback({required this.god, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withValues(alpha: 0.35),
            const Color(0xFF050810),
          ],
        ),
      ),
      child: Center(
        child: Text(god.symbol, style: const TextStyle(fontSize: 36)),
      ),
    );
  }
}

class _MythBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _MythBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10.5,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
