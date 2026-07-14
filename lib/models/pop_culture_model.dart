/// A game/film/anime character whose design or story is inspired by a
/// real mythological figure, shown as an educational "pop culture vs.
/// original myth" comparison. Distinct from [God] — these are modern
/// fictional interpretations, not the mythological figures themselves.
class MythicPopCultureCharacter {
  final String id;
  final String name;
  final String sourceMedia;
  final String developer; // studio/author + release year
  final String mediaType; // 'Game' | 'Film' | 'Novel' | 'Anime'
  final String inspiredFrom; // name of the real mythological figure
  final String originVerse; // matches God.mythology, e.g. 'Greek'
  final String domain;
  final String domainEn;
  final String iconicWeapon; // '' if not applicable
  final String iconicWeaponEn;
  final String funFact;
  final String funFactEn;
  final String imageUrl;

  const MythicPopCultureCharacter({
    required this.id,
    required this.name,
    required this.sourceMedia,
    required this.developer,
    required this.mediaType,
    required this.inspiredFrom,
    required this.originVerse,
    required this.domain,
    required this.domainEn,
    this.iconicWeapon = '',
    this.iconicWeaponEn = '',
    required this.funFact,
    required this.funFactEn,
    required this.imageUrl,
  });

  String localizedDomain(String lang) => lang == 'en' ? domainEn : domain;
  String localizedWeapon(String lang) => lang == 'en' ? iconicWeaponEn : iconicWeapon;
  String localizedFunFact(String lang) => lang == 'en' ? funFactEn : funFact;
}
