import 'package:flutter/material.dart';
import '../l10n/language_provider.dart';
import '../services/sound_service.dart';
import 'favorites_screen.dart';
import 'my_myths_screen.dart';
import 'mythic_pop_culture_screen.dart';
import 'quiz_genre_screen.dart';
import 'tier_screen.dart';

class CodexScreen extends StatelessWidget {
  const CodexScreen({super.key});

  static const _cardBg = Color(0xFF111111);

  void _open(BuildContext context, Widget page) {
    SoundService.playClick();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final id = lang == 'id';

    // A non-scrolling Column whose cards flex to fill the available height, so
    // the layout always fills one screen — bigger on large phones, still fits
    // on small ones — without ever needing to scroll.
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 2, bottom: 12),
                child: Text(
                  'Codex',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(
                flex: 19,
                child: _BigCard(
                  icon: Icons.favorite_rounded,
                  title: 'Favorites',
                  subtitle: localize(lang, 'Dewa yang kamu simpan', 'Gods you have saved'),
                  imageAsset: 'assets/images/favorite.webp',
                  onTap: () => _open(context, const FavoritesScreen()),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 19,
                child: _BigCard(
                  icon: Icons.auto_stories_rounded,
                  title: 'My Myths',
                  subtitle:
                      localize(lang, 'Kisah yang sudah kamu baca', 'Stories you have read'),
                  imageAsset: 'assets/images/book.webp',
                  onTap: () => _open(context, const MyMythsScreen()),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 19,
                child: _BigCard(
                  icon: Icons.movie_filter_rounded,
                  title: 'Mythic Pop Culture',
                  subtitle: localize(lang, 'Mitologi dalam film, game & budaya populer', 'Mythology in films, games & pop culture'),
                  imageAsset: 'assets/images/myth.webp',
                  onTap: () => _open(context, const MythicPopCultureScreen()),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _SmallCard(
                        icon: Icons.quiz_rounded,
                        title: 'Quiz',
                        subtitle:
                            localize(lang, 'Uji pengetahuanmu', 'Test your knowledge'),
                        onTap: () => _open(context, const QuizGenreScreen()),
                        imageAsset: 'assets/images/quiz.webp',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _SmallCard(
                        icon: Icons.military_tech_rounded,
                        title: 'Tier',
                        subtitle: localize(
                            lang, 'Peringkat kekuatan dewa', 'God power rankings'),
                        onTap: () => _open(context, const TierScreen()),
                        imageAsset: 'assets/images/tier.webp',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 17,
                child: _SupportBanner(id: id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BigCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String imageAsset;
  final VoidCallback onTap;

  const _BigCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    required this.onTap,
  });

  static const _gold = Color(0xFFB07800);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CodexScreen._cardBg,
          borderRadius: BorderRadius.circular(18),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imageAsset,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.88),
                    Colors.black.withValues(alpha: 0.75),
                    Colors.black.withValues(alpha: 0.25),
                  ],
                  stops: const [0.0, 0.45, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: _gold, size: 20),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontSize: 12,
                            height: 1.2,
                          ),
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
}

class _SmallCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final String? imageAsset;

  const _SmallCard({required this.icon, required this.title, required this.subtitle, required this.onTap, this.imageAsset});

  static const _gold = Color(0xFFB07800);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CodexScreen._cardBg,
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (imageAsset != null)
              Image.asset(
                imageAsset!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            if (imageAsset != null)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: 0.88),
                      Colors.black.withValues(alpha: 0.65),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: _gold, size: 17),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11),
                      ),
                    ],
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

class _SupportBanner extends StatelessWidget {
  final bool id;

  const _SupportBanner({required this.id});

  static const _gold = Color(0xFFB07800);

  @override
  Widget build(BuildContext context) {
    final lang = id ? 'id' : 'en';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [_gold.withValues(alpha: 0.35), _gold.withValues(alpha: 0.08)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A1A),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.volunteer_activism_rounded,
                color: _gold, size: 21),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  localize(lang, 'Dukung pengembangan', 'Support the development'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  localize(lang, 'Bantu kami kembangkan fitur baru', 'Help us build more myth features'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xFFB0B0B0), fontSize: 11.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
