/// One chapter of a myth story's main narrative. Each chapter becomes its
/// own "page" in the book-style paginated detail view.
class StoryChapter {
  final String heading;
  final String headingEn;
  final String body;
  final String bodyEn;

  const StoryChapter({
    required this.heading,
    required this.headingEn,
    required this.body,
    required this.bodyEn,
  });

  String localizedHeading(String lang) => lang == 'en' ? headingEn : heading;
  String localizedBody(String lang) => lang == 'en' ? bodyEn : body;
}

/// A single iconic mythological event, told in encyclopedia depth:
/// a multi-chapter narrative plus structured sections (main characters,
/// chronology, impact, mythological meaning).
class MythStory {
  final String id;
  final String mythology; // 'Greek' | 'Egyptian' | 'Nordic' | 'Hindu'
  final String icon; // emoji shown on the card
  final String title;
  final String titleEn;
  final String summary; // 1–2 sentence card summary
  final String summaryEn;
  final String timeline; // subtitle / era shown under the title
  final String timelineEn;
  final List<StoryChapter> chapters; // main narrative, chapter by chapter
  final List<String> characters; // "Nama — peran"
  final List<String> charactersEn;
  final List<String> chronology; // ordered chronological steps
  final List<String> chronologyEn;
  final String impact; // Dampak
  final String impactEn;
  final String meaning; // Makna Mitologis
  final String meaningEn;

  const MythStory({
    required this.id,
    required this.mythology,
    required this.icon,
    required this.title,
    required this.titleEn,
    required this.summary,
    required this.summaryEn,
    required this.timeline,
    required this.timelineEn,
    required this.chapters,
    required this.characters,
    required this.charactersEn,
    required this.chronology,
    required this.chronologyEn,
    required this.impact,
    required this.impactEn,
    required this.meaning,
    required this.meaningEn,
  });

  String localizedTitle(String lang) => lang == 'en' ? titleEn : title;
  String localizedSummary(String lang) => lang == 'en' ? summaryEn : summary;
  String localizedTimeline(String lang) => lang == 'en' ? timelineEn : timeline;
  List<String> localizedCharacters(String lang) =>
      lang == 'en' ? charactersEn : characters;
  List<String> localizedChronology(String lang) =>
      lang == 'en' ? chronologyEn : chronology;
  String localizedImpact(String lang) => lang == 'en' ? impactEn : impact;
  String localizedMeaning(String lang) => lang == 'en' ? meaningEn : meaning;
}
