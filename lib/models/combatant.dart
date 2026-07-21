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
    9.5,
    'Dalam God of War, Kratos secara harfiah membantai hampir seluruh jajaran dewa Olympus, termasuk Ares, Poseidon, hingga Zeus sendiri.',
    'In God of War, Kratos literally slaughters nearly the entire Olympian pantheon, Ares, Poseidon, and even Zeus himself.'),
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
    9.0,
    'Thor versi Marvel bertahan dari ledakan bintang neutron dan menghadapi entitas kosmik, jauh melampaui versi mitos aslinya.',
    "Marvel's Thor survives the blast of a neutron star and faces cosmic entities — far beyond his original mythic self."),
  'loki-marvel': _PcProfile(
    ['Tipu Daya', 'Sihir', 'Ilusi', 'Kecerdikan', 'Perubahan Wujud'],
    ['Trickery', 'Magic', 'Illusion', 'Cunning', 'Shapeshifting'],
    7.2,
    'Loki mengalahkan lawan bukan dengan kekuatan, melainkan ilusi dan tipu daya, bahkan pernah memperdaya Thanos dan para dewa sekaligus.',
    'Loki wins not through strength but illusion and deception, he has outwitted Thanos and the gods alike.'),
  'kratos-nordic': _PcProfile(
    ['Perang', 'Kekuatan', 'Pembunuh Dewa', 'Leviathan', 'Kebijaksanaan'],
    ['War', 'Strength', 'Godslayer', 'Leviathan', 'Wisdom'],
    9.6,
    'Di era Nordik, Kratos yang lebih bijak membunuh Baldur dan menantang Thor serta Odin, dua dewa terkuat Asgard.',
    'In the Norse era, a wiser Kratos kills Baldur and challenges both Thor and Odin, Asgard\'s two mightiest gods.'),
  'sun-wukong-blackmyth': _PcProfile(
    ['Kesaktian', 'Transformasi', 'Tongkat Sakti', 'Kekuatan', 'Keabadian'],
    ['Mystic Power', 'Transformation', 'Magic Staff', 'Strength', 'Immortality'],
    8.7,
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
    8.9,
    'Amaterasu dalam Okami memakai Celestial Brush untuk melukis ulang realitas itu sendiri, menciptakan, menyembuhkan, dan menghancurkan.',
    "Amaterasu in Okami wields the Celestial Brush to repaint reality itself — creating, healing, and destroying."),
  'asura-wrath': _PcProfile(
    ['Kemarahan', 'Kekuatan', 'Perang', 'Ketahanan', 'Keabadian'],
    ['Wrath', 'Strength', 'War', 'Endurance', 'Immortality'],
    9.7,
    'Kemarahan Asura tumbuh tanpa batas; ia pernah bertarung dengan wujud sebesar planet dan meninju entitas seukuran galaksi.',
    "Asura's wrath grows without limit; he has fought at planetary scale and punched a galaxy-sized being."),
  'ravana-general': _PcProfile(
    ['Sihir', 'Kekuatan', 'Kegelapan', 'Pengetahuan', 'Kesaktian'],
    ['Sorcery', 'Strength', 'Darkness', 'Knowledge', 'Mystic Power'],
    7.6,
    'Ravana sang raja iblis berkepala sepuluh menguasai sihir dahsyat dan anugerah yang membuatnya nyaris tak terkalahkan oleh dewa maupun iblis.',
    'Ravana, the ten-headed demon king, commands mighty sorcery and boons that make him nearly invincible to gods and demons alike.'),

  // ── Greek ──
  'medusa-percyjackson': _PcProfile(
    ['Tatapan Mematikan', 'Sihir Kutukan', 'Ular Berbisa', 'Insting Predator', 'Amarah Tragis'],
    ['Petrifying Gaze', 'Curse Magic', 'Venomous Serpents', 'Predator Instinct', 'Tragic Wrath'],
    6.3,
    'Dalam serial Percy Jackson and the Olympians, Medusa menjalankan toko pajangan taman sebagai kedok, namun tatapannya tetap mampu mengubah Percy, Annabeth, dan Grover menjadi batu jika mereka lengah.',
    'In Percy Jackson and the Olympians, Medusa runs a garden-gnome shop as a cover, her gaze still capable of turning Percy, Annabeth, and Grover to stone if they let their guard down.'),
  'ares-godofwar': _PcProfile(
    ['Perang', 'Senjata Berapi', 'Kekuatan Raksasa', 'Tipu Daya', 'Kemarahan'],
    ['War', 'Flame Weapons', 'Giant Strength', 'Deception', 'Wrath'],
    7.3,
    'Sebagai dewa perang sekaligus mentor awal Kratos, Ares mengendalikan senjata raksasa berselimut api dan mampu mengubah ukuran tubuhnya sendiri, sebelum akhirnya tewas di tangan muridnya sendiri.',
    "As the god of war and Kratos's original mentor, Ares wields giant flame-wreathed weapons and can change his own size at will, before ultimately falling at the hands of his own student."),
  'cerberus-hades': _PcProfile(
    ['Dunia Bawah', 'Penjaga Gerbang', 'Tiga Kepala', 'Kesetiaan', 'Gigitan Maut'],
    ['Underworld', 'Gate Guardian', 'Three Heads', 'Loyalty', 'Deadly Bite'],
    6.0,
    'Dalam game Hades, Cerberus tampil sebagai anjing penjaga House of Hades yang ramah dan bisa dielus pemain, tetap setia mengawasi tepian Sungai Styx.',
    'In the game Hades, Cerberus appears as the friendly guard dog of the House of Hades that the player can pet, faithfully watching over the banks of the River Styx.'),
  'harpy-gow': _PcProfile(
    ['Terbang', 'Cakar Tajam', 'Serangan Udara', 'Kecepatan', 'Insting Buas'],
    ['Flight', 'Sharp Claws', 'Aerial Assault', 'Speed', 'Feral Instinct'],
    2.8,
    'Dalam God of War (2018), Harpy muncul sebagai musuh reguler di Midgard yang menyerang para petualang dengan terjangan cakar tajam dari udara.',
    'In God of War (2018), Harpies appear as regular enemies across Midgard, striking adventurers with sharp claw dives from above.'),
  'satyr-gow': _PcProfile(
    ['Tombak', 'Perisai', 'Kekuatan Kambing', 'Taktik Pasukan', 'Kelincahan'],
    ['Spear', 'Shield', 'Goat Strength', 'Squad Tactics', 'Agility'],
    3.2,
    'Dalam God of War (2018), Satyr bertarung dengan tombak dan perisai sebagai bagian pasukan musuh di Alfheim dan Midgard.',
    'In God of War (2018), Satyrs fight with spear and shield as part of enemy patrols across Alfheim and Midgard.'),
  'pegasus-gow': _PcProfile(
    ['Terbang', 'Kecepatan', 'Kekuatan Dewa', 'Daya Tahan', 'Kesetiaan'],
    ['Flight', 'Speed', 'Divine Strength', 'Endurance', 'Loyalty'],
    3.6,
    'Dalam God of War, Pegasus digunakan Kratos sebagai tunggangan untuk terbang melintasi berbagai alam dengan kecepatan dan kekuatan seekor kuda dewa.',
    "In God of War, Pegasus serves as Kratos's mount, flying him across realms with the speed and strength of a godly steed."),
  'basilisk-hp': _PcProfile(
    ['Tatapan Mematikan', 'Bisa Mematikan', 'Ukuran Raksasa', 'Kegelapan', 'Insting Predator'],
    ['Deadly Gaze', 'Lethal Venom', 'Massive Size', 'Darkness', 'Predator Instinct'],
    4.5,
    'Basilisk raksasa dalam Harry Potter and the Chamber of Secrets bersembunyi di ruang bawah tanah Hogwarts dan mampu membunuh siapa pun yang bertatapan langsung dengannya, ditambah bisa ularnya yang mematikan.',
    'The giant Basilisk in Harry Potter and the Chamber of Secrets lurks beneath Hogwarts and can kill anyone who meets its gaze directly, backed by its lethal venomous fangs.'),
  'centaur-gow': _PcProfile(
    ['Tombak Panjang', 'Kecepatan Berkuda', 'Serangan Formasi', 'Kekuatan Fisik', 'Ketahanan'],
    ['Long Spear', 'Cavalry Speed', 'Formation Charge', 'Physical Strength', 'Endurance'],
    4.0,
    'Dalam God of War dan Hades, Centaur tampil sebagai musuh penunggang kuda yang menyerang dengan tombak panjang dan kecepatan menerjang dari atas punggung kuda.',
    'In God of War and Hades, Centaurs appear as mounted enemies charging with long spears and horseback speed.'),
  'griffin-gow': _PcProfile(
    ['Cakar Tajam', 'Terbang', 'Kekuatan Singa', 'Paruh Elang', 'Serangan Udara'],
    ['Sharp Claws', 'Flight', 'Lion Strength', 'Eagle Beak', 'Aerial Assault'],
    4.2,
    'Griffin dalam God of War menyerang sebagai musuh terbang yang gesit, memadukan cakar tajam dan paruh elang dengan kekuatan tubuh singa saat menukik dari udara.',
    "The Griffin in God of War attacks as an agile flying enemy, combining sharp claws and an eagle beak with a lion's bodily strength when diving from above."),
  'nemean-lion-gow': _PcProfile(
    ['Kulit Kebal Senjata', 'Cakar Tajam', 'Kekuatan Dahsyat', 'Ketahanan Tinggi', 'Insting Buas'],
    ['Weapon-Proof Hide', 'Sharp Claws', 'Devastating Strength', 'High Endurance', 'Feral Instinct'],
    4.8,
    'Nemean Lion memiliki kulit yang kebal terhadap segala senjata tajam, sehingga Heracles harus mengalahkannya dengan mencekiknya langsung menggunakan tangan kosong.',
    "The Nemean Lion's hide was impervious to all bladed weapons, forcing Heracles to defeat it by strangling it bare-handed."),
  'stymphalian-birds-gow': _PcProfile(
    ['Paruh Perunggu', 'Bulu Logam Tajam', 'Serangan Beruntun', 'Terbang', 'Serangan Kelompok'],
    ['Bronze Beak', 'Sharp Metal Feathers', 'Barrage Attack', 'Flight', 'Swarm Assault'],
    2.7,
    'Sebagai Tugas Keenam Heracles, Stymphalian Birds menembakkan bulu logam tajam seperti anak panah dan baru bisa diusir dari sarangnya berkat krotala perunggu pemberian Athena.',
    "As Heracles' sixth labor, the Stymphalian Birds fired sharp metal feathers like arrows and could only be flushed from their nest with the bronze krotala given by Athena."),
  'lamia-fgo': _PcProfile(
    ['Tatapan Mematikan', 'Tubuh Ular Lentur', 'Perubahan Wujud', 'Pesona Menggoda', 'Bisa Mematikan'],
    ['Deadly Gaze', 'Flexible Serpent Body', 'Shapeshifting', 'Seductive Allure', 'Lethal Venom'],
    4.3,
    'Dalam Fate/Grand Order, Lamia tampil sebagai monster wanita-ular yang memadukan sisi mematikan dan sisi manusiawi yang tragis akibat kutukan Hera.',
    "In Fate/Grand Order, Lamia appears as a half-woman half-serpent monster blending a lethal side with the tragic humanity left by Hera's curse."),

  // ── Nordic (God of War) ──
  'baldur-gow': _PcProfile(
    ['Kekuatan Super', 'Sihir Es', 'Kekebalan', 'Kemarahan', 'Tangan Kosong'],
    ['Superhuman Strength', 'Frost Magic', 'Invulnerability', 'Rage', 'Bare Hands'],
    8.3,
    'Kutukan dari ibunya sendiri, Freya, membuat Baldur kebal terhadap segala serangan fisik maupun sihir, menjadikannya antagonis utama yang memburu Kratos dan Atreus ke seluruh penjuru Sembilan Alam.',
    "Cursed by his own mother, Freya, Baldur is rendered invulnerable to all physical and magical harm, making him the main antagonist who hunts Kratos and Atreus across all Nine Realms."),
  'fenrir-gow': _PcProfile(
    ['Wujud Raksasa', 'Celah Antardimensi', 'Cakar', 'Kesetiaan', 'Kekuatan Fisik'],
    ['Giant Form', 'Dimensional Rifts', 'Claws', 'Loyalty', 'Physical Strength'],
    6.5,
    'Setelah dihidupkan kembali lewat sihir Atreus, Fenrir tumbuh menjadi serigala raksasa yang mampu merobek celah antardimensi dan membantu pertempuran puncak di Ragnarök.',
    "After being revived through Atreus's magic, Fenrir grows into a giant wolf capable of tearing rifts between dimensions and helps in Ragnarök's climactic battle."),
  'hela-mcu': _PcProfile(
    ['Dewi Kematian', 'Pedang Ganda', 'Kekuatan Super', 'Kebangkitan', 'Ambisi Menaklukkan'],
    ['Goddess of Death', 'Twin Swords', 'Superhuman Strength', 'Resurrection', 'Conquest'],
    8.0,
    'Hela menghancurkan palu Mjolnir hanya dengan tangan kosong dan hampir merebut takhta Asgard seorang diri.',
    'Hela crushes the hammer Mjolnir with her bare hand and nearly seizes the throne of Asgard single-handedly.'),
  'atreus-loki-gow': _PcProfile(
    ['Busur Panah', 'Ketangkasan', 'Sihir', 'Strategi', 'Jiwa Loki'],
    ['Bow and Arrow', 'Agility', 'Magic', 'Strategy', 'Spirit of Loki'],
    6.0,
    'Meski lebih mengandalkan busur panah ketimbang kekuatan jarak dekat, Atreus terungkap sebagai wujud muda dewa Loki, berdarah raksasa (Jötunn) dari ibunya, Laufey.',
    "Though he relies more on his bow than close-quarters strength, Atreus is revealed to be the young form of the god Loki, of giant (Jötunn) blood through his mother, Laufey."),
  'mimir-gow': _PcProfile(
    ['Kebijaksanaan', 'Pengetahuan', 'Ramalan', 'Nasihat', 'Kecerdasan'],
    ['Wisdom', 'Knowledge', 'Prophecy', 'Counsel', 'Intellect'],
    2.5,
    'Sebagai kepala terpenggal tanpa tubuh, Mimir sama sekali tak memiliki kemampuan bertarung fisik — kekuatannya murni terletak pada kebijaksanaan dan nasihatnya setelah dibebaskan dari 109 tahun penyiksaan Odin.',
    "As a disembodied severed head, Mimir has no physical combat ability whatsoever — his power lies purely in his wisdom and counsel after being freed from 109 years of torture at Odin's hands."),
  'troll-gow': _PcProfile(
    ['Pukulan Batu', 'Lemparan Bebatuan', 'Lapisan Batu', 'Kekuatan Kasar', 'Ketahanan'],
    ['Stone Punches', 'Boulder Throwing', 'Rock Armor', 'Brute Strength', 'Endurance'],
    5.0,
    'Troll menjadi bos pertama yang harus dihadapi Kratos dan Atreus bersama, menghancurkan segalanya dengan pukulan batu raksasa dan lemparan bebatuan.',
    'The Troll is the first boss Kratos and Atreus face together, smashing everything with massive stone punches and boulder throws.'),
  'wulver-gowr': _PcProfile(
    ['Gigitan', 'Kegelapan', 'Kecepatan', 'Cakar', 'Insting Buas'],
    ['Bite', 'Darkness', 'Speed', 'Claw', 'Feral Instinct'],
    3.4,
    'Wulver menyerang dari kegelapan dengan gigitan mematikan di God of War Ragnarök, padahal dalam folklor Shetland aslinya ia adalah manusia serigala baik hati yang membagikan ikan pada orang miskin.',
    'The Wulver strikes from darkness with a devastating bite in God of War Ragnarök, even though in the original Shetland folklore it was a benevolent wolfman who left fish for the poor.'),
  'nightmare-gow': _PcProfile(
    ['Sihir Gelap', 'Terbang', 'Proyektil Energi', 'Kegelapan', 'Kelincahan'],
    ['Dark Magic', 'Flight', 'Energy Projectiles', 'Darkness', 'Agility'],
    2.3,
    'Nightmare menyerang dari udara dengan proyektil sihir energi gelap sambil terus bergerak cepat, menjadikannya musuh God of War yang jauh lebih sulit ditangkap ketimbang dikalahkan.',
    "The Nightmare strikes from the air with dark-energy magic projectiles while constantly darting around, making it a God of War enemy that's far harder to catch than to actually defeat."),
  'revenant-gow': _PcProfile(
    ['Teleportasi', 'Sihir Racun', 'Kegelapan', 'Menghilang', 'Kecepatan'],
    ['Teleportation', 'Poison Magic', 'Darkness', 'Phasing', 'Speed'],
    3.2,
    'Revenant terus-menerus berteleportasi dan melontarkan sihir racun di God of War, menjadikannya musuh yang lebih mengandalkan kelicikan menghilang-muncul ketimbang kekuatan mentah.',
    'The Revenant constantly teleports and hurls poison magic in God of War, relying more on its vanish-and-reappear trickery than raw power.'),
  'dark-elf-gow': _PcProfile(
    ['Sihir Gelap', 'Cahaya', 'Melayang', 'Senjata Energi', 'Pertempuran'],
    ['Dark Magic', 'Light', 'Levitation', 'Energy Weapons', 'Combat'],
    3.6,
    'Prajurit Dark Elf di God of War bertarung memperebutkan Cahaya suci Alfheim, memadukan sihir gelap dengan senjata energi cahaya sambil melayang di medan perang.',
    "Dark Elf warriors in God of War fight over Alfheim's sacred Light, blending dark magic with light-energy weapons while levitating across the battlefield."),
  'ogre-gow': _PcProfile(
    ['Kekuatan', 'Pukulan Dahsyat', 'Tendangan', 'Ukuran Raksasa', 'Ketahanan'],
    ['Strength', 'Devastating Punches', 'Kicks', 'Giant Size', 'Endurance'],
    5.0,
    'Ogre lebih jarang muncul daripada Troll namun jauh lebih mematikan di God of War, menghancurkan tanah dengan pukulan dan tendangan raksasanya sebagai mini-boss yang ditakuti.',
    'The Ogre appears more rarely than the Troll but is far deadlier in God of War, shattering the ground with its giant punches and kicks as a feared mini-boss.'),
  'dreki-gowr': _PcProfile(
    ['Api', 'Gigitan', 'Sayap', 'Kecepatan', 'Sisik Pelindung'],
    ['Fire', 'Bite', 'Wings', 'Speed', 'Protective Scales'],
    3.5,
    'Dreki menyemburkan api dan menggigit cepat sebagai musuh reguler di Vanaheim dan Svartalfheim, meski God of War sengaja membuatnya versi kecil bersayap, berbeda dari naga Nordik asli Fafnir yang justru digambarkan sebagai ular raksasa tanpa sayap.',
    'The Dreki breathes fire and bites swiftly as a regular enemy across Vanaheim and Svartalfheim, though God of War deliberately made it a small winged version — unlike the real Norse dragon Fafnir, who was actually depicted as a giant wingless serpent.'),

  // ── Egyptian ──
  'khonshu-moonknight': _PcProfile(
    ['Bulan', 'Balas Dendam', 'Wujud Raksasa', 'Kematian', 'Kekuatan'],
    ['Moon', 'Vengeance', 'Giant Form', 'Death', 'Strength'],
    8.3,
    'Sebagai "Kepalan Balas Dendam", Khonshu bertarung dalam wujud raksasa setinggi bangunan melawan Ammit dalam duel ala kaiju di dekat Piramida Giza.',
    'As the "Fist of Vengeance," Khonshu battles in a building-sized giant form against Ammit in a kaiju-style duel near the Pyramids of Giza.'),
  'anubis-acorigins': _PcProfile(
    ['Dunia Bawah', 'Racun', 'Wujud Raksasa', 'Kekuatan', 'Pertahanan'],
    ['Underworld', 'Poison', 'Giant Form', 'Strength', 'Defense'],
    6.0,
    'Sebagai bos dewa raksasa dalam "Trial of the Gods", Anubis begitu kolosal dan stasioner hingga terlindungi kabut beracun, memaksa Bayek menyerangnya dari kejauhan.',
    'As a colossal god boss in the "Trial of the Gods," Anubis is so massive and stationary that he is shielded by a toxic cloud, forcing Bayek to fight him from range.'),
  'set-godsofegypt': _PcProfile(
    ['Kegelapan', 'Tipu Daya', 'Wujud Raksasa', 'Kekuatan Curian', 'Tirani'],
    ['Darkness', 'Treachery', 'Giant Form', 'Stolen Power', 'Tyranny'],
    7.5,
    'Set membunuh saudaranya sendiri, Osiris, demi merebut takhta Mesir, lalu bertarung dalam wujud humanoid raksasa berkepala serigala hitam yang diperkuat kekuatan curian dari dewa-dewa lain.',
    "Set murders his own brother, Osiris, to seize the throne of Egypt, then fights in a giant black jackal-headed humanoid form empowered further by divine attributes stolen from other gods."),
  'horus-godsofegypt': _PcProfile(
    ['Langit', 'Mata Horus', 'Wujud Raksasa', 'Keadilan', 'Kekuatan'],
    ['Sky', 'Eye of Horus', 'Giant Form', 'Justice', 'Strength'],
    7.8,
    'Setelah kedua matanya dicabut Set dan ia diasingkan, Horus bersekutu dengan Bek untuk merebut kembali matanya dan takhta Mesir, bertarung dalam wujud dewa elang raksasa emas-perak.',
    "After Set tears out his eyes and exiles him, Horus allies with Bek to reclaim his eyes and the throne of Egypt, fighting in a giant gold-and-silver falcon-headed divine form."),
  'apophis-stargate': _PcProfile(
    ['Tipu Daya', 'Kekuatan Simbiot', 'Pasukan Jaffa', 'Senjata Staff', 'Usia Panjang'],
    ['Deception', 'Symbiote Power', 'Jaffa Army', 'Staff Weapon', 'Longevity'],
    7.0,
    "Sebagai salah satu System Lord Goa'uld paling berkuasa, Apophis mengandalkan kekuatan super dan usia panjang dari simbiotnya, didukung pasukan Jaffa bersenjata staff weapon.",
    "As one of the most powerful Goa'uld System Lords, Apophis wields superhuman strength and extended lifespan granted by his symbiote, backed by an army of Jaffa wielding staff weapons."),

  // ── Japanese ──
  'susanoo-naruto': _PcProfile(
    ['Avatar Roh', 'Pedang Totsuka', 'Perisai', 'Sharingan', 'Kekuatan Dewa'],
    ['Spirit Avatar', 'Totsuka Blade', 'Shield', 'Sharingan', 'God-tier Power'],
    8.5,
    'Susanoo adalah avatar roh raksasa yang dimunculkan lewat Mangekyo Sharingan, dipakai Itachi, Sasuke, dan Madara sebagai perisai sekaligus senjata, termasuk Pedang Totsuka legendaris yang mampu menyegel lawan.',
    'Susanoo is a giant spectral avatar summoned through the Mangekyo Sharingan, wielded by Itachi, Sasuke, and Madara as both shield and weapon, including the legendary Totsuka Blade that can seal opponents.'),
  'tsuchigumo-nioh': _PcProfile(
    ['Jaring Beracun', 'Racun Lumpur', 'Wujud Raksasa', 'Persembunyian', 'Cakar'],
    ['Venomous Web', 'Mud Poison', 'Giant Form', 'Concealment', 'Claw'],
    5.0,
    'Tsuchigumo di Nioh adalah iblis laba-laba raksasa yang menjerat lawan dengan jaring-jaring lengket beracun dan menyerang dengan gigitan bisa lumpur.',
    'Tsuchigumo in Nioh is a giant spider demon that ensnares foes with sticky venomous webs and strikes with mud-poison bites.'),

  // ── Chinese ──
  'erlang-shen-blackmyth': _PcProfile(
    ['Mata Ketiga', 'Tombak Bermata Tiga', 'Perang', 'Anjing Langit', 'Kesaktian'],
    ['Third Eye', 'Three-Pointed Spear', 'War', 'Celestial Dog', 'Mystic Power'],
    8.8,
    'Sesuai novel Journey to the West, Erlang Shen adalah satu-satunya dewa yang mampu mengimbangi Sun Wukong dalam duel langsung, bertarung dengan tombak bermata tiga dan mata ketiga yang menembus segala penyamaran.',
    'True to the novel Journey to the West, Erlang Shen is the only god able to match Sun Wukong in direct combat, fighting with a three-pointed spear and a third eye that sees through any disguise.'),

  // ── Hindu ──
  'kali-smite': _PcProfile(
    ['Kematian', 'Bilah Pedang', 'Eksekusi', 'Tak Terkalahkan', 'Kemarahan'],
    ['Death', 'Throwing Blades', 'Execution', 'Invulnerability', 'Wrath'],
    7.9,
    'Kali di SMITE bisa menjadi kebal total saat mengaktifkan ultimate Destruction, mengamuk membantai musuh dengan hujan bilah pedang tanpa bisa dihentikan.',
    'Kali in SMITE becomes fully invulnerable when activating her Destruction ultimate, rampaging through enemies with a flurry of thrown blades that nothing can stop.'),
  'makara-smite': _PcProfile(
    ['Air', 'Rahang Kuat', 'Lapis Baja', 'Kekuatan', 'Ketahanan'],
    ['Water', 'Powerful Jaws', 'Armored Body', 'Strength', 'Endurance'],
    6.5,
    'Makara di SMITE tampil sebagai petarung akuatik yang bisa dimainkan, mewarisi statusnya sebagai kendaraan suci Dewi Ganga dan Dewa Varuna dengan rahang kuat serta tubuh bersisik lapis baja.',
    'Makara in SMITE is a playable aquatic fighter, carrying its status as the sacred vehicle of the goddess Ganga and the god Varuna into battle with powerful jaws and an armored, scaled body.'),
  'rakshasa-ff': _PcProfile(
    ['Sihir Elemen', 'Ilusi', 'Perubahan Wujud', 'Kekacauan', 'Cakar'],
    ['Elemental Magic', 'Illusion', 'Shapeshifting', 'Chaos', 'Claw'],
    5.5,
    'Rakshasa muncul berulang kali sebagai musuh dungeon kuat di berbagai seri Final Fantasy, mengenakan wujud berkepala harimau atau bertanduk sambil menguasai sihir elemen dan ilusi.',
    'Rakshasa recur as formidable dungeon enemies across many Final Fantasy games, wielding tiger-headed or horned forms alongside elemental magic and illusions.'),
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
