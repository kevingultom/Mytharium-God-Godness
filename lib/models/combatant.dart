import 'pop_culture_model.dart';
import '../data/pop_culture_data.dart';

/// Anything that can enter the God Battle arena. Both [God] and pop-culture
/// characters implement this, so the battle engine and UI work with either.
abstract interface class Combatant {
  String get id;
  String get name;
  String get mythology; // pantheon / origin verse — drives the accent color
  String get category;
  String get imageUrl;
  String get title;
  String get titleEn;
  List<String> get powers;
  List<String> get powersEn;

  /// A fixed status tier, or null to let the engine derive it from its maps.
  double? get tierOverride;

  /// True for game/film/anime characters (shown with a small badge).
  bool get isPopCulture;

  /// A one-line myth/game fact used as an extra winning factor, or null.
  String? get combatLoreId;
  String? get combatLoreEn;

  String localizedTitle(String lang);
  List<String> localizedPowers(String lang);
}

/// Combat profile for a pop-culture character: derived powers (for the
/// domain-matching engine + display), a status tier, and a signature
/// myth/game fact that acts as an extra factor when they win.
class _PcProfile {
  final List<String> powers;
  final List<String> powersEn;
  final double tier;
  final String loreId;
  final String loreEn;
  const _PcProfile(
      this.powers, this.powersEn, this.tier, this.loreId, this.loreEn);
}

/// Curated per-character combat data, grounded in each character's abilities
/// in their source media and their mythological inspiration.
const Map<String, _PcProfile> _pcProfiles = {
  'kratos-greek': _PcProfile(
    ['Perang', 'Kemarahan', 'Kekuatan', 'Pembunuh Dewa', 'Chaos'],
    ['War', 'Rage', 'Strength', 'Godslayer', 'Chaos'],
    8.7,
    'Dalam God of War, Kratos secara harfiah membantai hampir seluruh jajaran dewa Olympus — termasuk Ares, Poseidon, hingga Zeus sendiri.',
    'In God of War, Kratos literally slaughters nearly the entire Olympian pantheon — Ares, Poseidon, and even Zeus himself.'),
  'zagreus': _PcProfile(
    ['Dunia Bawah', 'Ketangkasan', 'Pedang', 'Kelahiran Kembali', 'Keabadian'],
    ['Underworld', 'Agility', 'Blade', 'Rebirth', 'Immortality'],
    6.2,
    'Sebagai putra Hades, Zagreus bangkit kembali setiap kali gugur, menjadikannya lawan yang mustahil benar-benar dikalahkan.',
    'As the son of Hades, Zagreus rises again each time he falls, making him an opponent nearly impossible to truly defeat.'),
  'percy-jackson': _PcProfile(
    ['Air', 'Laut', 'Pedang', 'Keberanian', 'Darah Dewa'],
    ['Water', 'Sea', 'Swordsmanship', 'Courage', 'Divine Blood'],
    6.6,
    'Sebagai putra Poseidon, Percy mengendalikan air dan pernah mengalahkan monster serta Titan yang jauh lebih tua darinya.',
    "As a son of Poseidon, Percy commands water and has bested monsters and Titans far older than himself.'"),
  'thor-marvel': _PcProfile(
    ['Petir', 'Guntur', 'Kekuatan', 'Mjolnir', 'Keabadian'],
    ['Lightning', 'Thunder', 'Strength', 'Mjolnir', 'Immortality'],
    8.8,
    'Thor versi Marvel bertahan dari ledakan bintang neutron dan menghadapi entitas kosmik — jauh melampaui versi mitos aslinya.',
    "Marvel's Thor survives the blast of a neutron star and faces cosmic entities — far beyond his original mythic self."),
  'loki-marvel': _PcProfile(
    ['Tipu Daya', 'Sihir', 'Ilusi', 'Kecerdikan', 'Perubahan Wujud'],
    ['Trickery', 'Magic', 'Illusion', 'Cunning', 'Shapeshifting'],
    7.2,
    'Loki mengalahkan lawan bukan dengan kekuatan, melainkan ilusi dan tipu daya — bahkan pernah memperdaya Thanos dan para dewa sekaligus.',
    'Loki wins not through strength but illusion and deception — he has outwitted Thanos and the gods alike.'),
  'kratos-nordic': _PcProfile(
    ['Perang', 'Kekuatan', 'Pembunuh Dewa', 'Leviathan', 'Kebijaksanaan'],
    ['War', 'Strength', 'Godslayer', 'Leviathan', 'Wisdom'],
    8.8,
    'Di era Nordik, Kratos yang lebih bijak membunuh Baldur dan menantang Thor serta Odin — dua dewa terkuat Asgard.',
    'In the Norse era, a wiser Kratos kills Baldur and challenges both Thor and Odin — Asgard\'s two mightiest gods.'),
  'sun-wukong-blackmyth': _PcProfile(
    ['Kesaktian', 'Transformasi', 'Tongkat Sakti', 'Kekuatan', 'Keabadian'],
    ['Mystic Power', 'Transformation', 'Magic Staff', 'Strength', 'Immortality'],
    8.5,
    'Sun Wukong pernah mengobrak-abrik seluruh Istana Surga dan melawan bala tentara langit seorang diri sebelum ditundukkan Buddha.',
    'Sun Wukong once wreaked havoc across all of Heaven and fought its entire celestial army alone before Buddha subdued him.'),
  'nezha-film': _PcProfile(
    ['Api', 'Roda Api', 'Kesaktian', 'Pemberontakan', 'Kelahiran Kembali'],
    ['Fire', 'Fire Wheels', 'Mystic Power', 'Defiance', 'Rebirth'],
    7.2,
    'Nezha melawan takdirnya sendiri sebagai iblis reinkarnasi dan bangkit dalam tubuh teratai, mengendalikan api roda surgawi.',
    'Nezha defies his fate as a reincarnated demon and is reborn in a lotus body, wielding the fire of the celestial wheels.'),
  'monkey-king-general': _PcProfile(
    ['Transformasi', 'Kesaktian', 'Tongkat Sakti', 'Kelincahan', 'Keabadian'],
    ['Transformation', 'Mystic Power', 'Magic Staff', 'Agility', 'Immortality'],
    7.8,
    'Reinterpretasi Sun Wukong ini mewarisi 72 transformasi dan lompatan awan yang menempuh ribuan mil dalam sekejap.',
    'This reinterpretation of Sun Wukong inherits the 72 transformations and cloud-leaps that cross thousands of miles instantly.'),
  'raiden-mk': _PcProfile(
    ['Petir', 'Langit', 'Perlindungan', 'Teleportasi', 'Keabadian'],
    ['Lightning', 'Sky', 'Protection', 'Teleportation', 'Immortality'],
    8.0,
    'Sebagai Dewa Petir pelindung Earthrealm, Raiden memukul lawan dengan kilat dan berteleportasi lebih cepat dari mata memandang.',
    'As the Thunder God protecting Earthrealm, Raiden strikes with lightning and teleports faster than the eye can follow.'),
  'amaterasu-okami': _PcProfile(
    ['Matahari', 'Cahaya', 'Sihir', 'Penciptaan', 'Penyembuhan'],
    ['Sun', 'Light', 'Magic', 'Creation', 'Healing'],
    8.5,
    'Amaterasu dalam Okami memakai Celestial Brush untuk melukis ulang realitas itu sendiri — menciptakan, menyembuhkan, dan menghancurkan.',
    "Amaterasu in Okami wields the Celestial Brush to repaint reality itself — creating, healing, and destroying."),
  'asura-wrath': _PcProfile(
    ['Kemarahan', 'Kekuatan', 'Perang', 'Ketahanan', 'Keabadian'],
    ['Wrath', 'Strength', 'War', 'Endurance', 'Immortality'],
    8.4,
    'Kemarahan Asura tumbuh tanpa batas; ia pernah bertarung dengan wujud sebesar planet dan meninju entitas seukuran galaksi.',
    "Asura's wrath grows without limit; he has fought at planetary scale and punched a galaxy-sized being."),
  'ravana-general': _PcProfile(
    ['Sihir', 'Kekuatan', 'Kegelapan', 'Pengetahuan', 'Kesaktian'],
    ['Sorcery', 'Strength', 'Darkness', 'Knowledge', 'Mystic Power'],
    7.6,
    'Ravana sang raja iblis berkepala sepuluh menguasai sihir dahsyat dan anugerah yang membuatnya nyaris tak terkalahkan oleh dewa maupun iblis.',
    'Ravana, the ten-headed demon king, commands mighty sorcery and boons that make him nearly invincible to gods and demons alike.'),
};

/// A pop-culture character adapted as a battle [Combatant].
class PcCombatant implements Combatant {
  final MythicPopCultureCharacter character;
  final _PcProfile _p;

  const PcCombatant._(this.character, this._p);

  @override
  String get id => 'pc_${character.id}';
  @override
  String get name => character.name;
  @override
  String get mythology => character.originVerse;
  @override
  String get category => 'PopCulture';
  @override
  String get imageUrl => character.imageUrl;
  @override
  String get title => character.sourceMedia;
  @override
  String get titleEn => character.sourceMedia;
  @override
  List<String> get powers => _p.powers;
  @override
  List<String> get powersEn => _p.powersEn;
  @override
  double? get tierOverride => _p.tier;
  @override
  bool get isPopCulture => true;
  @override
  String? get combatLoreId => _p.loreId;
  @override
  String? get combatLoreEn => _p.loreEn;
  @override
  String localizedTitle(String lang) => character.sourceMedia;
  @override
  List<String> localizedPowers(String lang) =>
      lang == 'en' ? _p.powersEn : _p.powers;
}

/// All pop-culture characters that have a combat profile, as combatants.
final List<PcCombatant> popCultureCombatants = [
  for (final c in popCultureData)
    if (_pcProfiles.containsKey(c.id)) PcCombatant._(c, _pcProfiles[c.id]!),
];
