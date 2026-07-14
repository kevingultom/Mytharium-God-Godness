import 'combatant.dart';

class God implements Combatant {
  @override
  final String id;
  @override
  final String name;
  @override
  final String mythology;
  @override
  final String title;
  @override
  final String titleEn;
  final String symbol;
  @override
  final List<String> powers;
  @override
  final List<String> powersEn;
  final String story;
  final String storyEn;
  @override
  final String imageUrl;
  @override
  final String category;
  bool isBookmarked;

  // Combatant hooks: gods use the engine's tier maps and have no pop-culture
  // badge or game-fact lore.
  @override
  double? get tierOverride => null;
  @override
  bool get isPopCulture => false;
  @override
  String? get combatLoreId => null;
  @override
  String? get combatLoreEn => null;

  God({
    required this.id,
    required this.name,
    required this.mythology,
    required this.title,
    required this.titleEn,
    required this.symbol,
    required this.powers,
    required this.powersEn,
    required this.story,
    required this.storyEn,
    required this.imageUrl,
    this.category = '',
    this.isBookmarked = false,
  });

  @override
  String localizedTitle(String lang) => lang == 'en' ? titleEn : title;
  String localizedStory(String lang) => lang == 'en' ? storyEn : story;
  @override
  List<String> localizedPowers(String lang) => lang == 'en' ? powersEn : powers;
}
