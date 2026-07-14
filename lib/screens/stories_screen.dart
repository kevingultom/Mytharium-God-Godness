import 'package:flutter/material.dart';
import '../data/gods_data.dart';
import '../data/history_data.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import '../widgets/god_card.dart';
import 'genre_stories_screen.dart';
import 'mythic_pop_culture_screen.dart';

class _Genre {
  final String key; // matches the `mythology` field on gods/stories
  final String taglineId;
  final String taglineEn;
  final String image;
  // Where BoxFit.cover anchors the crop inside the featured carousel card.
  // Shifting toward the top (negative y) reveals more of the upper part of
  // the source photo (e.g. a cropped-off head/face) instead of the middle.
  final Alignment featuredAlignment;
  const _Genre(this.key, this.taglineId, this.taglineEn, this.image,
      {this.featuredAlignment = Alignment.center});
}

const List<_Genre> _genres = [
  _Genre('Greek', 'Dewa-dewa Olympus', 'Gods of Olympus',
      'assets/images/greek.jpg'),
  _Genre('Egyptian', 'Dewa Sungai Nil Abadi', 'Gods of the Eternal Nile',
      'assets/images/egypt.jpg'),
  _Genre('Nordic', 'Dewa-dewa Asgard', 'Gods of Asgard',
      'assets/images/nordik.jpg',
      featuredAlignment: Alignment(0, -0.5)),
  _Genre('Hindu', 'Dewa Dharma Abadi', 'Gods of the Eternal Dharma',
      'assets/images/hindu.jpg',
      featuredAlignment: Alignment(0, -0.5)),
  _Genre('Chinese', 'Dewa Istana Surgawi', 'Gods of the Celestial Court',
      'assets/images/cina.jpg',
      featuredAlignment: Alignment(0, -0.5)),
  _Genre('Japanese', 'Dewa Matahari Terbit', 'Gods of the Rising Sun',
      'assets/images/japanese.jpg'),
];

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  static const _gold = Color(0xFFB07800);

  final PageController _carouselCtrl =
      PageController(viewportFraction: 0.9);
  int _carouselPage = 0;

  @override
  void dispose() {
    _carouselCtrl.dispose();
    super.dispose();
  }

  int _deitiesOf(String k) => godsData.where((g) => g.mythology == k).length;
  int _storiesOf(String k) => historyData.where((s) => s.mythology == k).length;

  void _openGenre(String key) {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => GenreStoriesScreen(mythology: key),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void _openMythicPopCulture() {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MythicPopCultureScreen(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = LanguageProvider.of(context).value == 'id';

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          children: [
            const Text(
              'Stories',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 14),

            // Top banner (formerly "Dictionary" in the mockup)
            _mythicPopCultureBanner(id),
            const SizedBox(height: 22),

            _sectionHeader(id ? 'Pilihan & terbaru' : 'New & noteworthy'),
            const SizedBox(height: 12),

            // Swipeable featured carousel
            SizedBox(
              height: 250,
              child: PageView.builder(
                controller: _carouselCtrl,
                itemCount: _genres.length,
                onPageChanged: (i) => setState(() => _carouselPage = i),
                itemBuilder: (_, i) => _FeaturedCard(
                  genre: _genres[i],
                  id: id,
                  deities: _deitiesOf(_genres[i].key),
                  stories: _storiesOf(_genres[i].key),
                  onTap: () => _openGenre(_genres[i].key),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _dots(),
            const SizedBox(height: 24),

            _sectionHeader(id ? 'Jelajahi lainnya' : 'Browse more'),
            const SizedBox(height: 12),

            // 6-genre grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: _genres.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemBuilder: (_, i) => _GenreCard(
                genre: _genres[i],
                id: id,
                deities: _deitiesOf(_genres[i].key),
                stories: _storiesOf(_genres[i].key),
                onTap: () => _openGenre(_genres[i].key),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _mythicPopCultureBanner(bool id) {
    return GestureDetector(
      onTap: _openMythicPopCulture,
      child: Container(
        height: 92,
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF1E1E1E)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/mythic_pop_culture.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.9),
                    Colors.black.withValues(alpha: 0.55),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.movie_filter_rounded,
                        color: _gold, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Mythic Pop Culture',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          id
                              ? 'Mitologi dalam film, game & budaya populer'
                              : 'Mythology in films, games & pop culture',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color(0xFFB0B0B0), fontSize: 11.5),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded,
                      color: Color(0xFF9CA3AF), size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_genres.length, (i) {
        final active = i == _carouselPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: active ? 18 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: active ? _gold : const Color(0xFF444444),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}

/// Large swipeable "New & noteworthy" card (mockup image 2 style).
class _FeaturedCard extends StatelessWidget {
  final _Genre genre;
  final bool id;
  final int deities;
  final int stories;
  final VoidCallback onTap;

  const _FeaturedCard({
    required this.genre,
    required this.id,
    required this.deities,
    required this.stories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = GodCard.mythologyColor(genre.key);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withValues(alpha: 0.4)),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                genre.image,
                fit: BoxFit.cover,
                alignment: genre.featuredAlignment,
                errorBuilder: (_, __, ___) => Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color.withValues(alpha: 0.55),
                        const Color(0xFF0E0E0E),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.55),
                      Colors.black.withValues(alpha: 0.92),
                    ],
                    stops: const [0.35, 0.7, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      genre.key,
                      style: GodCard.mythologyFont(
                        genre.key,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      id ? genre.taglineId : genre.taglineEn,
                      style: const TextStyle(
                          color: Color(0xFFD1D5DB), fontSize: 12.5),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$deities ${id ? 'dewa' : 'deities'}  ·  '
                      '$stories ${id ? 'kisah' : 'stories'}',
                      style: const TextStyle(
                          color: Color(0xFF9CA3AF), fontSize: 11),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        id ? 'Kisah & Fakta' : 'Stories & Facts',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
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
    );
  }
}

/// Tall grid card (mockup image 1 style).
class _GenreCard extends StatelessWidget {
  final _Genre genre;
  final bool id;
  final int deities;
  final int stories;
  final VoidCallback onTap;

  const _GenreCard({
    required this.genre,
    required this.id,
    required this.deities,
    required this.stories,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = GodCard.mythologyColor(genre.key);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.35)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              genre.image,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withValues(alpha: 0.5),
                      const Color(0xFF0E0E0E),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.5),
                    Colors.black.withValues(alpha: 0.9),
                  ],
                  stops: const [0.4, 0.72, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    genre.key,
                    style: GodCard.mythologyFont(
                      genre.key,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$deities ${id ? 'dewa' : 'gods'}  ·  '
                    '$stories ${id ? 'kisah' : 'stories'}',
                    style: const TextStyle(
                        color: Color(0xFFB0B0B0), fontSize: 10.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
