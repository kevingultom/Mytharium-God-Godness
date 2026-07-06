import 'package:flutter/material.dart';
import '../models/god_model.dart';
import '../widgets/god_card.dart';

class DetailScreen extends StatefulWidget {
  final God god;
  final VoidCallback onReturn;

  const DetailScreen({super.key, required this.god, required this.onReturn});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void _toggleBookmark() {
    setState(() => widget.god.isBookmarked = !widget.god.isBookmarked);
    widget.onReturn();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.god.isBookmarked
              ? '❤️  ${widget.god.name} ditambahkan ke favorit'
              : '🤍  ${widget.god.name} dihapus dari favorit',
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF0D1528),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = GodCard.mythologyColor(widget.god.mythology);

    return Scaffold(
      backgroundColor: const Color(0xFF050812),
      body: CustomScrollView(
        slivers: [
          _buildHero(color),
          SliverToBoxAdapter(child: _buildContent(color)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleBookmark,
        backgroundColor:
            widget.god.isBookmarked ? const Color(0xFF4C1D95) : const Color(0xFFFFC107),
        foregroundColor:
            widget.god.isBookmarked ? Colors.white : Colors.black,
        elevation: 8,
        icon: Icon(
          widget.god.isBookmarked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          size: 20,
        ),
        label: Text(
          widget.god.isBookmarked ? 'Favorit' : 'Simpan',
          style: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.3),
        ),
      ),
    );
  }

  Widget _buildHero(Color color) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: const Color(0xFF050812),
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 18),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Radial glow background
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.0,
                  colors: [
                    color.withValues(alpha: 0.25),
                    const Color(0xFF050812),
                  ],
                ),
              ),
            ),
            // God image or fallback
            if (widget.god.imageUrl.isNotEmpty)
              Image.network(
                widget.god.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (_, child, progress) =>
                    progress == null ? child : _heroFallback(color),
                errorBuilder: (_, __, ___) => _heroFallback(color),
              )
            else
              _heroFallback(color),
            // Bottom gradient so content blends into screen
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.35, 0.75, 1.0],
                    colors: [
                      Colors.transparent,
                      const Color(0xFF050812).withValues(alpha: 0.7),
                      const Color(0xFF050812),
                    ],
                  ),
                ),
              ),
            ),
            // Name overlay at bottom of hero
            Positioned(
              bottom: 16,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.god.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(color: Colors.black, blurRadius: 8),
                      ],
                    ),
                  ),
                  Text(
                    widget.god.title,
                    style: TextStyle(
                      color: const Color(0xFFFFC107).withValues(alpha: 0.9),
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      shadows: const [Shadow(color: Colors.black, blurRadius: 6)],
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

  Widget _heroFallback(Color color) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.85,
          colors: [
            color.withValues(alpha: 0.3),
            const Color(0xFF050812),
          ],
        ),
      ),
      child: Center(
        child: Text(
          widget.god.symbol,
          style: const TextStyle(fontSize: 90),
        ),
      ),
    );
  }

  Widget _buildContent(Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mythology badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withValues(alpha: 0.35)),
            ),
            child: Text(
              widget.god.mythology,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _sectionTitle('Kekuatan'),
          const SizedBox(height: 12),
          _buildPowers(color),
          const SizedBox(height: 24),
          _sectionTitle('Kisah'),
          const SizedBox(height: 12),
          _buildStory(),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 18,
          decoration: BoxDecoration(
            color: const Color(0xFFFFC107),
            borderRadius: BorderRadius.circular(2),
          ),
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
      ],
    );
  }

  Widget _buildPowers(Color color) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.god.powers.map((p) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withValues(alpha: 0.3)),
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
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStory() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1528),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Text(
        widget.god.story,
        style: const TextStyle(
          color: Color(0xFFB8C4D4),
          fontSize: 14.5,
          height: 1.8,
        ),
      ),
    );
  }
}
