class God {
  final String id;
  final String name;
  final String mythology;
  final String title;
  final String symbol;
  final List<String> powers;
  final String story;
  final String imageUrl;
  bool isBookmarked;

  God({
    required this.id,
    required this.name,
    required this.mythology,
    required this.title,
    required this.symbol,
    required this.powers,
    required this.story,
    required this.imageUrl,
    this.isBookmarked = false,
  });
}
