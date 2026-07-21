import 'package:flutter/material.dart';

/// Power-tier classification for gods and beings across all six mythologies,
/// shown as a badge on the god detail screen and browsable via the Codex
/// "Tier" feature. Also feeds [BattleEngine]'s numeric strength score
/// directly (see `_tierOf`/`_godTierBase` there), so a god's visible tier
/// badge is a genuine predictor of their God Battle performance, not just
/// decorative — with individually hand-tuned gods keeping their finer-grained
/// override on top of the badge.
enum GodTier {
  anomaly(
    label: 'Anomaly',
    color: Color(0xFFD9663A),
    description:
        "Not a rank within mythology at all — a fictional reinterpretation "
        "from a game, film, or novel that borrows a god's name and imagery "
        "but rewrites their power, parentage, or fate outright. Judging "
        "them on the same scale as authentic myth would be comparing two "
        "different stories, so they sit outside it entirely.",
    descriptionId:
        'Bukan peringkat dalam mitologi sama sekali — reinterpretasi '
        'fiksi dari game, film, atau novel yang meminjam nama dan citra '
        'seorang dewa namun menulis ulang kekuatan, asal-usul, atau '
        'takdirnya sepenuhnya. Menilainya dengan skala yang sama seperti '
        'mitologi asli sama saja membandingkan dua kisah yang berbeda, '
        'jadi mereka berdiri di luar sistem ini sepenuhnya.',
  ),
  worldEnder(
    label: 'World-Ender',
    color: Color(0xFFD4AF37),
    description:
        "The rarest and most terrifying rank in mythology — primordial "
        "forces and supreme gods whose power can create, reshape, or "
        "utterly end the world. Their conflicts don't just decide battles; "
        "they decide the fate of existence itself.",
    descriptionId:
        'Peringkat paling langka dan menakutkan dalam mitologi — kekuatan '
        'purba dan dewa tertinggi yang mampu menciptakan, membentuk ulang, '
        'atau mengakhiri dunia sepenuhnya. Pertarungan mereka bukan sekadar '
        'menentukan kemenangan, melainkan menentukan nasib keberadaan itu '
        'sendiri.',
  ),
  legendary(
    label: 'Legendary',
    color: Color(0xFF7E57C2),
    description:
        'Gods and beings of extraordinary might, revered across the '
        'pantheon for feats that border on the impossible. They rule '
        'domains, command armies of lesser spirits, and are strong enough '
        'to stand toe-to-toe with the greatest threats mythology has to '
        'offer.',
    descriptionId:
        'Dewa dan makhluk berkekuatan luar biasa, dihormati di seluruh '
        'jajaran dewa karena pencapaian yang nyaris mustahil. Mereka '
        'menguasai wilayah kekuasaan, memimpin pasukan roh yang lebih '
        'rendah, dan cukup kuat untuk menghadapi ancaman terbesar dalam '
        'mitologi.',
  ),
  elite(
    label: 'Elite',
    color: Color(0xFFC62828),
    description:
        'Formidable warriors, monsters, and champions defined by raw '
        'combat prowess. Whether hero or beast, every name in this tier '
        'earned its reputation through battles that are still told and '
        'retold today.',
    descriptionId:
        'Prajurit, monster, dan jawara tangguh yang dikenal karena '
        'kemampuan bertarung luar biasa. Baik pahlawan maupun makhluk '
        'buas, setiap nama di tier ini meraih reputasinya lewat '
        'pertarungan yang masih diceritakan hingga kini.',
  ),
  veteran(
    label: 'Veteran',
    color: Color(0xFF1565C0),
    description:
        'Seasoned figures with real, tested power — strong enough to '
        "matter in any conflict, but standing a step below mythology's "
        'true titans. Their strength comes from experience, cunning, or a '
        'particular gift rather than sheer overwhelming force.',
    descriptionId:
        'Tokoh berpengalaman dengan kekuatan nyata yang telah teruji — '
        'cukup kuat untuk berperan penting dalam konflik apa pun, namun '
        'masih berada satu tingkat di bawah para raksasa sejati mitologi. '
        'Kekuatan mereka berasal dari pengalaman, kecerdikan, atau '
        'anugerah khusus, bukan sekadar kekuatan mentah.',
  ),
  noble(
    label: 'Noble',
    color: Color(0xFF2E7D32),
    description:
        'Figures whose true power lies beyond the battlefield — in '
        'wisdom, leadership, magic, craft, or sacred duty. They may not '
        'lead the charge, but mythology would fall apart without the '
        'roles they hold.',
    descriptionId:
        'Tokoh yang kekuatan sejatinya tidak terletak di medan perang — '
        'melainkan pada kebijaksanaan, kepemimpinan, sihir, keterampilan, '
        'atau tugas suci. Mereka mungkin tidak memimpin pertempuran, namun '
        'mitologi akan runtuh tanpa peran yang mereka emban.',
  ),
  guardian(
    label: 'Guardian',
    color: Color(0xFF78909C),
    description:
        "Supporting spirits, watchers, and lesser beings who keep "
        "mythology's world turning. They rarely take center stage, but "
        'the balance of every pantheon quietly depends on them.',
    descriptionId:
        'Roh pendukung, penjaga, dan makhluk kecil yang menjaga roda '
        'dunia mitologi tetap berputar. Mereka jarang menjadi pusat '
        'perhatian, namun keseimbangan setiap jajaran dewa diam-diam '
        'bergantung pada mereka.',
  );

  final String label;
  final Color color;
  final String description;
  final String descriptionId;

  const GodTier({
    required this.label,
    required this.color,
    required this.description,
    required this.descriptionId,
  });

  String localizedDescription(String lang) =>
      lang == 'id' ? descriptionId : description;
}

/// Tier assignments, keyed first by mythology then by exact god/being name
/// (must match [God.name] in the corresponding lib/data/*_gods.dart file).
/// Entries not present here (mostly cosmology/place entries like Yggdrasil
/// or Ragnarök) simply have no tier badge.
const Map<String, Map<String, GodTier>> _tiersByMythology = {
  'Nordic': {
    'Odin': GodTier.worldEnder,
    'Thor': GodTier.worldEnder,
    'Surtr': GodTier.worldEnder,
    'Fenrir': GodTier.worldEnder,
    'Jörmungandr': GodTier.worldEnder,
    'Ymir': GodTier.worldEnder,
    'Vidar': GodTier.worldEnder,
    'Freya': GodTier.legendary,
    'Freyr': GodTier.legendary,
    'Heimdall': GodTier.legendary,
    'Loki': GodTier.legendary,
    'Hel': GodTier.legendary,
    'Baldur': GodTier.legendary,
    'Norns': GodTier.legendary,
    'Vili & Vé': GodTier.legendary,
    'Tyr': GodTier.legendary,
    'Frigg': GodTier.legendary,
    'Skadi': GodTier.elite,
    'Hrungnir': GodTier.elite,
    'Utgard-Loki': GodTier.elite,
    'Nidhogg': GodTier.elite,
    'Draugr': GodTier.elite,
    'Ullr': GodTier.veteran,
    'Angrboda': GodTier.veteran,
    'Aegir & Rán': GodTier.veteran,
    'Valkyrie': GodTier.veteran,
    'Thrym': GodTier.veteran,
    'Njord': GodTier.noble,
    'Mimir': GodTier.noble,
    'Bragi': GodTier.noble,
    'Idun': GodTier.noble,
    'Forseti': GodTier.noble,
    'Sif': GodTier.noble,
    'Sleipnir': GodTier.noble,
    'Ratatoskr': GodTier.guardian,
    'Huginn & Muninn': GodTier.guardian,
  },
  'Greek': {
    'Chaos': GodTier.worldEnder,
    'Gaia': GodTier.worldEnder,
    'Uranus': GodTier.worldEnder,
    'Tartarus': GodTier.worldEnder,
    'Zeus': GodTier.worldEnder,
    'Poseidon': GodTier.worldEnder,
    'Hades': GodTier.worldEnder,
    'Cronus': GodTier.worldEnder,
    'Typhon': GodTier.worldEnder,
    'Nyx': GodTier.worldEnder,
    'Athena': GodTier.legendary,
    'Apollo': GodTier.legendary,
    'Artemis': GodTier.legendary,
    'Ares': GodTier.legendary,
    'Hera': GodTier.legendary,
    'Demeter': GodTier.legendary,
    'Dionysus': GodTier.legendary,
    'Hephaestus': GodTier.legendary,
    'Hermes': GodTier.legendary,
    'Aphrodite': GodTier.legendary,
    'Atlas': GodTier.legendary,
    'Prometheus': GodTier.legendary,
    'Oceanus': GodTier.legendary,
    'Hyperion': GodTier.legendary,
    'Rhea': GodTier.legendary,
    'Persephone': GodTier.legendary,
    'Hecate': GodTier.legendary,
    'Themis': GodTier.legendary,
    'Theia': GodTier.legendary,
    'Phoebe': GodTier.legendary,
    'Erinyes (Furies)': GodTier.legendary,
    'Echidna': GodTier.legendary,
    'Amphitrite': GodTier.legendary,
    'Heracles': GodTier.elite,
    'Perseus': GodTier.elite,
    'Theseus': GodTier.elite,
    'Achilles': GodTier.elite,
    'Odysseus': GodTier.elite,
    'Bellerophon': GodTier.elite,
    'Thanatos': GodTier.elite,
    'Iapetus': GodTier.elite,
    'Triton': GodTier.elite,
    'Nereus': GodTier.elite,
    'Proteus': GodTier.elite,
    'Hydra': GodTier.elite,
    'Chimera': GodTier.elite,
    'Minotaur': GodTier.elite,
    'Medusa': GodTier.elite,
    'Cyclops': GodTier.elite,
    'Cerberus': GodTier.elite,
    'Hestia': GodTier.veteran,
    'Mnemosyne': GodTier.veteran,
    'Tethys': GodTier.veteran,
    'Thetis': GodTier.veteran,
    'Morpheus': GodTier.veteran,
    'Charon': GodTier.veteran,
    'Scylla & Charybdis': GodTier.veteran,
    'Kratos': GodTier.guardian,
    'Erebus': GodTier.noble,
    'Eros': GodTier.noble,
    'Hypnos': GodTier.noble,
    'Orpheus': GodTier.noble,
    'Sphinx': GodTier.noble,
    'Sirens': GodTier.noble,
    'Menoetius': GodTier.guardian,
    'Epimetheus': GodTier.guardian,
    'Coeus': GodTier.veteran,
    'Crius': GodTier.veteran,
  },
  'Egyptian': {
    'Ra': GodTier.worldEnder,
    'Atum': GodTier.worldEnder,
    'Amun': GodTier.worldEnder,
    'Horus': GodTier.worldEnder,
    'Seth': GodTier.worldEnder,
    'Apep': GodTier.worldEnder,
    'Ptah': GodTier.worldEnder,
    'Osiris': GodTier.worldEnder,
    'Isis': GodTier.legendary,
    'Anubis': GodTier.legendary,
    'Sekhmet': GodTier.legendary,
    'Thoth': GodTier.legendary,
    'Aten': GodTier.legendary,
    'Khepri': GodTier.legendary,
    'Geb': GodTier.legendary,
    'Nut': GodTier.legendary,
    "Ma'at": GodTier.legendary,
    'Nephthys': GodTier.legendary,
    'Bastet': GodTier.elite,
    'Hathor': GodTier.elite,
    'Wepwawet': GodTier.elite,
    'Khonsu': GodTier.elite,
    'Wadjet': GodTier.elite,
    'Tefnut': GodTier.legendary,
    'Sobek': GodTier.elite,
    'Shu': GodTier.legendary,
    'Hapi': GodTier.veteran,
    'Min': GodTier.veteran,
    'Nefertem': GodTier.veteran,
    'Taweret': GodTier.veteran,
    'Bes': GodTier.veteran,
    'Seshat': GodTier.veteran,
    'Mnevis': GodTier.veteran,
    'Pharaoh': GodTier.noble,
    'Khnum': GodTier.noble,
    'Sokar': GodTier.noble,
    'Bennu': GodTier.noble,
    'Ammit': GodTier.guardian,
    'Serqet': GodTier.guardian,
    'Nekhbet': GodTier.elite,
  },
  'Hindu': {
    'Shiva': GodTier.worldEnder,
    'Vishnu': GodTier.worldEnder,
    'Brahma': GodTier.worldEnder,
    'Kali': GodTier.worldEnder,
    'Durga': GodTier.worldEnder,
    'Krishna': GodTier.worldEnder,
    'Kalki': GodTier.worldEnder,
    'Narasimha': GodTier.legendary,
    'Parvati': GodTier.legendary,
    'Lakshmi': GodTier.legendary,
    'Saraswati': GodTier.legendary,
    'Rama': GodTier.legendary,
    'Indra': GodTier.legendary,
    'Agni': GodTier.legendary,
    'Varuna': GodTier.legendary,
    'Surya': GodTier.legendary,
    'Kartikeya': GodTier.legendary,
    'Hanuman': GodTier.legendary,
    'Garuda': GodTier.legendary,
    'Ravana': GodTier.legendary,
    'Vayu': GodTier.legendary,
    'Parashurama': GodTier.legendary,
    'Vamana': GodTier.legendary,
    'Arjuna': GodTier.elite,
    'Karna': GodTier.elite,
    'Bhishma': GodTier.elite,
    'Yama': GodTier.legendary,
    'Kubera': GodTier.elite,
    'Kamadeva': GodTier.veteran,
    'Vishwakarma': GodTier.elite,
    'Nandi': GodTier.elite,
    'Asura': GodTier.elite,
    'Varaha': GodTier.legendary,
    'Matsya': GodTier.veteran,
    'Kurma': GodTier.veteran,
    'Chandra': GodTier.veteran,
    'Radha': GodTier.noble,
    'Ashwini Kumaras': GodTier.veteran,
    'Naga': GodTier.veteran,
    'Buddha': GodTier.noble,
  },
  'Chinese': {
    'Pangu': GodTier.worldEnder,
    'Nu Wa': GodTier.worldEnder,
    'Jade Emperor': GodTier.worldEnder,
    'Sun Wukong': GodTier.worldEnder,
    'Erlang Shen': GodTier.worldEnder,
    'Queen Mother of the West': GodTier.legendary,
    'Fuxi': GodTier.legendary,
    'Taiyi': GodTier.legendary,
    'Nezha': GodTier.legendary,
    'Guan Yu': GodTier.legendary,
    'Dragon King of the East (Ao Guang)': GodTier.legendary,
    'Dragon King of the South (Ao Qin)': GodTier.legendary,
    'Dragon King of the West (Ao Run)': GodTier.legendary,
    'Dragon King of the North (Ao Shun)': GodTier.legendary,
    'Hou Yi': GodTier.legendary,
    "Chang'e": GodTier.noble,
    'Yanluo Wang': GodTier.legendary,
    'Hundun': GodTier.legendary,
    'He Bo': GodTier.legendary,
    'Black Tortoise': GodTier.elite,
    'Li Jing': GodTier.elite,
    'Zhao Gongming': GodTier.elite,
    'Zhong Kui': GodTier.elite,
    'Lu Dongbin': GodTier.elite,
    'Lei Gong': GodTier.elite,
    'Dian Mu': GodTier.elite,
    'Feng Bo': GodTier.elite,
    'Yu Shi': GodTier.elite,
    'Long (Dragon)': GodTier.elite,
    'Fenghuang': GodTier.noble,
    'Qilin': GodTier.noble,
    'Peng': GodTier.elite,
    'Pixiu': GodTier.elite,
    'Bixie': GodTier.elite,
    'White Tiger': GodTier.elite,
    'Azure Dragon': GodTier.elite,
    'Vermilion Bird': GodTier.elite,
    'Tang Sanzang': GodTier.veteran,
    'Zhu Bajie': GodTier.veteran,
    'Sha Wujing': GodTier.veteran,
    'Tu Di Gong': GodTier.veteran,
    'Wen Chang': GodTier.noble,
    'Tai Bai Jin Xing': GodTier.noble,
    'Judge Cui': GodTier.veteran,
    'Meng Po': GodTier.veteran,
    'Huli Jing': GodTier.veteran,
    'Taotie': GodTier.veteran,
    'Jiangshi': GodTier.veteran,
    'Mulan': GodTier.veteran,
    'Menshen': GodTier.noble,
    'Black Impermanence': GodTier.noble,
    'White Impermanence': GodTier.noble,
    'Ox-Head': GodTier.noble,
    'Horse-Face': GodTier.noble,
    'Eight Immortals': GodTier.noble,
    'Cai Shen': GodTier.noble,
    'Jigong': GodTier.noble,
  },
  'Japanese': {
    'Izanagi': GodTier.worldEnder,
    'Izanami': GodTier.worldEnder,
    'Amaterasu': GodTier.worldEnder,
    'Susanoo': GodTier.worldEnder,
    'Tsukuyomi': GodTier.legendary,
    'Takemikazuchi': GodTier.legendary,
    'Futsunushi': GodTier.legendary,
    'Ōkuninushi': GodTier.legendary,
    'Hachiman': GodTier.legendary,
    'Bishamonten': GodTier.legendary,
    'Marishiten': GodTier.legendary,
    'Ryujin': GodTier.legendary,
    'Watatsumi': GodTier.legendary,
    'Raijin': GodTier.legendary,
    'Fujin': GodTier.legendary,
    'Yamata no Orochi': GodTier.legendary,
    'Takamimusubi': GodTier.legendary,
    'Emma-O': GodTier.legendary,
    'Ame-no-Uzume': GodTier.noble,
    'Takeminakata': GodTier.elite,
    'Yamato Takeru': GodTier.elite,
    'Benkei': GodTier.elite,
    'Minamoto no Yoshitsune': GodTier.elite,
    'Oni': GodTier.elite,
    'Tengu': GodTier.elite,
    'Nue': GodTier.elite,
    'Gashadokuro': GodTier.elite,
    'Ebisu': GodTier.veteran,
    'Daikokuten': GodTier.veteran,
    'Benzaiten': GodTier.veteran,
    'Fukurokuju': GodTier.veteran,
    'Jurojin': GodTier.veteran,
    'Hotei': GodTier.veteran,
    'Momotaro': GodTier.veteran,
    'Kintaro': GodTier.veteran,
    'Kappa': GodTier.veteran,
    'Baku': GodTier.veteran,
    'Raiju': GodTier.veteran,
    'Jorōgumo': GodTier.veteran,
    'Yuki-onna': GodTier.veteran,
    'Tanuki': GodTier.veteran,
    'Konohanasakuya': GodTier.veteran,
    'Suijin': GodTier.noble,
    'Shinatsuhiko': GodTier.noble,
    'Kuraokami': GodTier.noble,
    'Urashima Taro': GodTier.noble,
    'Amenominakanushi': GodTier.noble,
    'Kamimusubi': GodTier.noble,
    'Umashiashikabihikoji': GodTier.noble,
    'Amenotokotachi': GodTier.noble,
    'Inari': GodTier.noble,
    'Shinigami': GodTier.noble,
    'Kitsune': GodTier.veteran,
  },
};

GodTier? tierOf(String mythology, String name) =>
    _tiersByMythology[mythology]?[name];

/// Every character in the Mythic Pop Culture catalog (lib/data/pop_culture_data.dart)
/// is a fictional game/film/novel reinterpretation rather than an entry from
/// real mythology, so they all share this single tier rather than being
/// ranked against [_tiersByMythology]'s authentic-myth entries.
const GodTier popCultureTier = GodTier.anomaly;

/// All god names of [mythology] that belong to [tier], in data order.
List<String> namesInTier(String mythology, GodTier tier) {
  final map = _tiersByMythology[mythology];
  if (map == null) return const [];
  return [for (final e in map.entries) if (e.value == tier) e.key];
}
