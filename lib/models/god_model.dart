class God {
  final String id;
  final String name;
  final String mythology;
  final String title;
  final String titleEn;
  final String symbol;
  final List<String> powers;
  final List<String> powersEn;
  final String story;
  final String storyEn;
  final String imageUrl;
  final String category;
  bool isBookmarked;

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

  String localizedTitle(String lang) => lang == 'en' ? titleEn : title;
  String localizedStory(String lang) => lang == 'en' ? storyEn : story;
  List<String> localizedPowers(String lang) => lang == 'en' ? powersEn : powers;
}
