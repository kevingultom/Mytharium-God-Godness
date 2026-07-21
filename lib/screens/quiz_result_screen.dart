import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import '../data/gods_data.dart';
import '../models/god_model.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';

class QuizResultScreen extends StatelessWidget {
  final String zodiac;
  final String personality;
  final String element;
  final List<String> favorites;
  final int birthYear;

  const QuizResultScreen({
    super.key,
    required this.zodiac,
    required this.personality,
    required this.element,
    required this.favorites,
    required this.birthYear,
  });

  // ── Label lookups (id → display text), used to explain a match in plain words ──
  static const _personalityLabels = {
    'brave':      {'id': 'Pemberani', 'en': 'Brave'},
    'wise':       {'id': 'Bijaksana', 'en': 'Wise'},
    'creative':   {'id': 'Kreatif', 'en': 'Creative'},
    'calm':       {'id': 'Tenang', 'en': 'Calm'},
    'passionate': {'id': 'Penuh Semangat', 'en': 'Passionate'},
    'mysterious': {'id': 'Misterius', 'en': 'Mysterious'},
  };

  static const _elementLabels = {
    'fire':      {'id': 'Api', 'en': 'Fire'},
    'water':     {'id': 'Air', 'en': 'Water'},
    'earth':     {'id': 'Tanah', 'en': 'Earth'},
    'air':       {'id': 'Udara', 'en': 'Air'},
    'lightning': {'id': 'Petir', 'en': 'Lightning'},
    'death':     {'id': 'Kematian', 'en': 'Death'},
    'sun':       {'id': 'Matahari', 'en': 'Sun'},
    'moon':      {'id': 'Bulan', 'en': 'Moon'},
  };

  static const _favoriteLabels = {
    'music':      {'id': 'Musik', 'en': 'Music'},
    'war':        {'id': 'Perang', 'en': 'War'},
    'knowledge':  {'id': 'Pengetahuan', 'en': 'Knowledge'},
    'nature':     {'id': 'Alam', 'en': 'Nature'},
    'beauty':     {'id': 'Kecantikan', 'en': 'Beauty'},
    'adventure':  {'id': 'Petualangan', 'en': 'Adventure'},
    'magic':      {'id': 'Sihir', 'en': 'Magic'},
    'wealth':     {'id': 'Kekayaan', 'en': 'Wealth'},
    'family':     {'id': 'Keluarga', 'en': 'Family'},
    'justice':    {'id': 'Keadilan', 'en': 'Justice'},
    'healing':    {'id': 'Penyembuhan', 'en': 'Healing'},
    'protection': {'id': 'Perlindungan', 'en': 'Protection'},
  };

  static const _zodiacLabels = {
    'aries': 'Aries', 'taurus': 'Taurus', 'gemini': 'Gemini', 'cancer': 'Cancer',
    'leo': 'Leo', 'virgo': 'Virgo', 'libra': 'Libra', 'scorpio': 'Scorpio',
    'sagittarius': 'Sagittarius', 'capricorn': 'Capricorn', 'aquarius': 'Aquarius', 'pisces': 'Pisces',
  };

  static const _chineseZodiacLabels = {
    'rat':     {'id': 'Tikus', 'en': 'Rat'},
    'ox':      {'id': 'Kerbau', 'en': 'Ox'},
    'tiger':   {'id': 'Harimau', 'en': 'Tiger'},
    'rabbit':  {'id': 'Kelinci', 'en': 'Rabbit'},
    'dragon':  {'id': 'Naga', 'en': 'Dragon'},
    'snake':   {'id': 'Ular', 'en': 'Snake'},
    'horse':   {'id': 'Kuda', 'en': 'Horse'},
    'goat':    {'id': 'Kambing', 'en': 'Goat'},
    'monkey':  {'id': 'Monyet', 'en': 'Monkey'},
    'rooster': {'id': 'Ayam', 'en': 'Rooster'},
    'dog':     {'id': 'Anjing', 'en': 'Dog'},
    'pig':     {'id': 'Babi', 'en': 'Pig'},
  };

  // ── Zodiac → preferred elements ──
  static const _zodiacElements = {
    'aries':       ['fire', 'lightning'],
    'taurus':      ['earth'],
    'gemini':      ['air'],
    'cancer':      ['water', 'moon'],
    'leo':         ['fire', 'sun'],
    'virgo':       ['earth'],
    'libra':       ['air'],
    'scorpio':     ['death', 'water'],
    'sagittarius': ['fire'],
    'capricorn':   ['earth'],
    'aquarius':    ['air', 'water'],
    'pisces':      ['water', 'moon'],
  };

  // ── Personality → matching god traits ──
  // Covers every god/figure in the app except the 'Cosmology' category
  // (realms, places, and abstract cosmic concepts have no personality to match).
  // Tags are grounded in each god's own `powers` list (see the god data files) rather
  // than generic mythology trivia, so a god can carry more than one trait when their
  // stated powers clearly span more than one archetype (e.g. Shiva's meditation/yoga
  // powers read as calm, while his destruction powers read as passionate).
    static const _personalityMap = {
    'brave': {
      'achilles', 'ammit', 'anubis', 'apollo', 'ares',
      'arjuna', 'artemis', 'athena', 'atlas', 'baku',
      'bellerophon', 'benkei', 'bes', 'bhishma', 'bishamonten',
      'bixie', 'cerberus', 'chimera', 'cyclops', 'dragon king of the north (ao shun)',
      'draugr', 'durga', 'echidna', 'erlang shen', 'fenrir',
      'freya', 'futsunushi', 'garuda', 'guan yu', 'hachiman',
      'hanuman', 'heimdall', 'heracles', 'horse-face', 'horus',
      'hou yi', 'hrungnir', 'indra', 'jigong', 'kappa',
      'karna', 'kartikeya', 'kintaro', 'lei gong', 'li jing',
      'long (dragon)', 'lu dongbin', 'marishiten', 'menshen', 'minamoto no yoshitsune',
      'minotaur', 'mnevis', 'momotaro', 'mulan', 'naga',
      'nandi', 'narasimha', 'nu wa', 'odin', 'oni',
      'ox-head', 'pangu', 'parashurama', 'perseus', 'pixiu',
      'rama', 'scylla & charybdis', 'sekhmet', 'serqet', 'seth',
      'sha wujing', 'sleipnir', 'sobek', 'sphinx', 'sun wukong',
      'surtr', 'takemikazuchi', 'takeminakata', 'taotie', 'tartarus',
      'taweret', 'tengu', 'theseus', 'thor', 'thrym',
      'typhon', 'tyr', 'ullr', 'urashima taro', 'utgard-loki',
      'valkyrie', 'varaha', 'vidar', 'vili & vé', 'wadjet',
      'wepwawet', 'white tiger', 'yamato takeru', 'zhao gongming', 'zhong kui',
      'zhu bajie',
    },
    'wise': {
      'agni', 'amaterasu', 'amenotokotachi', 'angrboda', 'apollo',
      'athena', 'baldur', 'benzaiten', 'bhishma', 'bishamonten',
      'black tortoise', 'bragi', 'brahma', 'buddha', 'coeus',
      'cronus', 'dian mu', 'dragon king of the west (ao run)', 'eight immortals', 'emma-o',
      'epimetheus', 'erinyes (furies)', 'forseti', 'frigg', 'fukurokuju',
      'fuxi', 'ganesha', 'hel', 'huginn & muninn', 'huli jing',
      'isis', 'izanami', 'jade emperor', 'jigong', 'judge cui',
      'jurojin', 'kalki', 'kitsune', 'krishna', 'kurma',
      'lei gong', 'lu dongbin', 'ma\'at', 'matsya', 'meng po',
      'mimir', 'minamoto no yoshitsune', 'momotaro', 'naga', 'nandi',
      'narasimha', 'nereus', 'norns', 'nu wa', 'nyx',
      'odin', 'parashurama', 'parvati', 'phoebe', 'proteus',
      'qilin', 'rama', 'ravana', 'saraswati', 'seshat',
      'sha wujing', 'shiva', 'sphinx', 'surya', 'tai bai jin xing',
      'taiyi', 'takamimusubi', 'tang sanzang', 'ten kings of hell', 'thanatos',
      'themis', 'thetis', 'thoth', 'tyr', 'valkyrie',
      'vamana', 'varuna', 'yama', 'yamato takeru', 'yanluo wang',
      'zeus', 'zhong kui',
    },
    'creative': {
      'ame-no-uzume', 'amun', 'apollo', 'asura', 'athena',
      'atum', 'bastet', 'bennu', 'benzaiten', 'bes',
      'bragi', 'brahma', 'chaos', 'cyclops', 'eight immortals',
      'epimetheus', 'erlang shen', 'fuxi', 'gaia', 'ganesha',
      'hapi', 'hathor', 'hephaestus', 'hotei', 'huli jing',
      'iapetus', 'izanagi', 'izanami', 'jorōgumo', 'kali',
      'kappa', 'khepri', 'khnum', 'kitsune', 'krishna',
      'matsya', 'mnemosyne', 'nu wa', 'odin', 'odysseus',
      'orpheus', 'pangu', 'peng', 'prometheus', 'proteus',
      'ptah', 'ra', 'saraswati', 'shikome', 'shiva',
      'sokar', 'sun wukong', 'takamimusubi', 'tanuki', 'tengu',
      'uranus', 'vermilion bird', 'vili & vé', 'vishwakarma', 'wen chang',
      'wepwawet', 'white impermanence', 'ymir', 'zhu bajie',
    },
    'calm': {
      'amphitrite', 'angrboda', 'aphrodite', 'apollo', 'ashwini kumaras',
      'aten', 'baku', 'bastet', 'black tortoise', 'cai shen',
      'chandra', 'crius', 'cronus', 'daikokuten', 'demeter',
      'dionysus', 'dragon king of the east (ao guang)', 'dragon king of the north (ao shun)', 'dragon king of the south (ao qin)', 'dragon king of the west (ao run)',
      'ebisu', 'echidna', 'erebus', 'fenghuang', 'forseti',
      'freya', 'freyr', 'fukurokuju', 'gaia', 'geb',
      'hapi', 'he bo', 'helios', 'hera', 'hermes',
      'hestia', 'hotei', 'hyperion', 'hypnos', 'idun',
      'inari', 'isis', 'izanagi', 'jiangshi', 'jigong',
      'jorōgumo', 'jurojin', 'kamimusubi', 'kappa', 'khnum',
      'khonsu', 'kintaro', 'konohanasakuya', 'kubera', 'kuraokami',
      'lakshmi', 'long (dragon)', 'lu dongbin', 'min', 'mnevis',
      'morpheus', 'nefertem', 'njord', 'nut', 'oceanus',
      'osiris', 'qilin', 'queen mother of the west', 'raijin', 'rhea',
      'sekhmet', 'selene', 'serqet', 'shinatsuhiko', 'shu',
      'sif', 'sobek', 'suijin', 'takeminakata', 'taweret',
      'tefnut', 'tethys', 'thanatos', 'theia', 'triton',
      'tu di gong', 'umashiashikabihikoji', 'vayu', 'vishnu', 'watatsumi',
      'yu shi', 'yuki-onna', 'ōkuninushi',
    },
    'passionate': {
      'achilles', 'aegir & rán', 'agni', 'aphrodite', 'arjuna',
      'baldur', 'bellerophon', 'bixie', 'chandra', 'chang\'e',
      'chimera', 'dian mu', 'dragon king of the east (ao guang)', 'dragon king of the south (ao qin)', 'eros',
      'feng bo', 'freya', 'frigg', 'fujin', 'hachiman',
      'hanuman', 'hathor', 'hephaestus', 'heracles', 'huli jing',
      'hydra', 'indra', 'izanami', 'jorōgumo', 'jörmungandr',
      'kamadeva', 'kintaro', 'kitsune', 'konohanasakuya', 'krishna',
      'lakshmi', 'lei gong', 'menoetius', 'menshen', 'momotaro',
      'mulan', 'nefertem', 'nezha', 'nidhogg', 'nue',
      'oni', 'orpheus', 'parashurama', 'parvati', 'perseus',
      'poseidon', 'prometheus', 'radha', 'raijin', 'raiju',
      'ryujin', 'sekhmet', 'serqet', 'seth', 'sif',
      'sirens', 'surtr', 'susanoo', 'takemikazuchi', 'taotie',
      'theseus', 'thor', 'typhon', 'varaha', 'vermilion bird',
      'wadjet', 'yamata no orochi', 'yuki-onna',
    },
    'mysterious': {
      'amenominakanushi', 'amun', 'angrboda', 'anubis', 'apep',
      'apollo', 'asura', 'azure dragon', 'black impermanence', 'chaos',
      'charon', 'coeus', 'emma-o', 'erebus', 'erinyes (furies)',
      'freya', 'frigg', 'gashadokuro', 'hades', 'hecate',
      'hel', 'huli jing', 'hundun', 'iapetus', 'izanami',
      'kali', 'kappa', 'khepri', 'khonsu', 'kitsune',
      'loki', 'medusa', 'menoetius', 'mimir', 'morpheus',
      'naga', 'nekhbet', 'nephthys', 'nereus', 'nidhogg',
      'norns', 'nue', 'nyx', 'odin', 'orpheus',
      'osiris', 'peng', 'persephone', 'pharaoh', 'phoebe',
      'proteus', 'ratatoskr', 'selene', 'seth', 'shikome',
      'shinigami', 'shiva', 'sirens', 'skadi', 'sokar',
      'sphinx', 'susanoo', 'tanuki', 'tartarus', 'ten kings of hell',
      'thanatos', 'themis', 'thetis', 'tsukuyomi', 'typhon',
      'utgard-loki', 'vamana', 'vermilion bird', 'white impermanence', 'yama',
      'yanluo wang', 'ymir', 'yomotsu hirasaka',
    },
  };
// ── Element → matching gods ──
    static const _elementMap = {
    'fire': {
      'aegir & rán', 'agni', 'aten', 'chimera', 'dian mu',
      'dragon king of the east (ao guang)', 'dragon king of the south (ao qin)', 'feng bo', 'fujin', 'hephaestus',
      'indra', 'kitsune', 'lei gong', 'nezha', 'poseidon',
      'prometheus', 'raijin', 'raiju', 'ryujin', 'seth',
      'surtr', 'susanoo', 'takemikazuchi', 'thor', 'typhon',
      'vermilion bird', 'wadjet', 'yuki-onna', 'zeus',
    },
    'water': {
      'aegir & rán', 'agni', 'amphitrite', 'athena', 'benzaiten',
      'bishamonten', 'black tortoise', 'crius', 'demeter', 'dragon king of the east (ao guang)',
      'dragon king of the north (ao shun)', 'dragon king of the south (ao qin)', 'dragon king of the west (ao run)', 'emma-o', 'erinyes (furies)',
      'erlang shen', 'forseti', 'hapi', 'he bo', 'hestia',
      'inari', 'jade emperor', 'jiangshi', 'judge cui', 'jörmungandr',
      'kalki', 'kappa', 'kuraokami', 'kurma', 'lei gong',
      'long (dragon)', 'ma\'at', 'momotaro', 'narasimha', 'nereus',
      'nezha', 'njord', 'oceanus', 'pangu', 'parashurama',
      'poseidon', 'proteus', 'qilin', 'raijin', 'rama',
      'ryujin', 'scylla & charybdis', 'sha wujing', 'sif', 'sirens',
      'sobek', 'suijin', 'susanoo', 'takeminakata', 'tefnut',
      'tethys', 'themis', 'thetis', 'triton', 'tyr',
      'varuna', 'watatsumi', 'yama', 'yamato takeru', 'ymir',
      'yomotsu hirasaka', 'yu shi', 'zeus', 'zhong kui',
    },
    'earth': {
      'achilles', 'amenominakanushi', 'amenotokotachi', 'angrboda', 'apep',
      'aphrodite', 'ares', 'arjuna', 'asura', 'azure dragon',
      'bastet', 'bellerophon', 'benkei', 'bes', 'bhishma',
      'bixie', 'bragi', 'brahma', 'cerberus', 'chandra',
      'chaos', 'coeus', 'cronus', 'cyclops', 'daikokuten',
      'demeter', 'dionysus', 'dragon king of the west (ao run)', 'draugr', 'durga',
      'ebisu', 'echidna', 'eight immortals', 'epimetheus', 'eros',
      'fenghuang', 'fenrir', 'freya', 'freyr', 'frigg',
      'fukurokuju', 'futsunushi', 'fuxi', 'gaia', 'ganesha',
      'geb', 'guan yu', 'hachiman', 'hanuman', 'hapi',
      'hathor', 'he bo', 'hera', 'heracles', 'hermes',
      'hestia', 'horse-face', 'hotei', 'hou yi', 'hrungnir',
      'huli jing', 'hundun', 'hydra', 'idun', 'inari',
      'isis', 'izanagi', 'jigong', 'jorōgumo', 'jurojin',
      'kamadeva', 'kamimusubi', 'karna', 'kartikeya', 'khnum',
      'khonsu', 'kintaro', 'konohanasakuya', 'krishna', 'kubera',
      'kuraokami', 'lakshmi', 'li jing', 'loki', 'lu dongbin',
      'matsya', 'menshen', 'mimir', 'min', 'minamoto no yoshitsune',
      'minotaur', 'mnemosyne', 'mnevis', 'mulan', 'nandi',
      'nekhbet', 'nidhogg', 'norns', 'nue', 'odysseus',
      'oni', 'osiris', 'ox-head', 'pangu', 'parvati',
      'persephone', 'perseus', 'pharaoh', 'pixiu', 'poseidon',
      'ptah', 'queen mother of the west', 'radha', 'ratatoskr', 'ravana',
      'rhea', 'saraswati', 'sekhmet', 'serqet', 'seshat',
      'shinatsuhiko', 'shiva', 'sif', 'skadi', 'sleipnir',
      'sobek', 'sphinx', 'suijin', 'tai bai jin xing', 'taiyi',
      'takamimusubi', 'takeminakata', 'tang sanzang', 'tanuki', 'taotie',
      'tartarus', 'taweret', 'tefnut', 'theia', 'theseus',
      'thrym', 'tu di gong', 'ullr', 'umashiashikabihikoji', 'urashima taro',
      'utgard-loki', 'vamana', 'varaha', 'vidar', 'vili & vé',
      'vishnu', 'vishwakarma', 'wen chang', 'wepwawet', 'white tiger',
      'yamata no orochi', 'yu shi', 'zhao gongming', 'zhu bajie', 'ōkuninushi',
    },
    'air': {
      'amun', 'atlas', 'cai shen', 'feng bo', 'fujin',
      'garuda', 'horus', 'huginn & muninn', 'hyperion', 'indra',
      'medusa', 'nezha', 'njord', 'nu wa', 'nut',
      'pangu', 'peng', 'ra', 'shinatsuhiko', 'shu',
      'sun wukong', 'takeminakata', 'tengu', 'uranus', 'valkyrie',
      'vayu', 'yu shi', 'zeus',
    },
    'lightning': {
      'dian mu', 'indra', 'lei gong', 'raijin', 'raiju',
      'takemikazuchi', 'thor', 'zeus',
    },
    'death': {
      'ammit', 'anubis', 'black impermanence', 'charon', 'emma-o',
      'erebus', 'erinyes (furies)', 'freya', 'hades', 'hecate',
      'hel', 'iapetus', 'izanami', 'kali', 'ma\'at',
      'medusa', 'meng po', 'menoetius', 'naga', 'nephthys',
      'odin', 'orpheus', 'osiris', 'persephone', 'shikome',
      'shinigami', 'sirens', 'sokar', 'ten kings of hell', 'thanatos',
      'thoth', 'valkyrie', 'white impermanence', 'yama', 'yanluo wang',
      'yomotsu hirasaka',
    },
    'sun': {
      'agni', 'amaterasu', 'ame-no-uzume', 'amun', 'apollo',
      'ashwini kumaras', 'aten', 'atum', 'baldur', 'bennu',
      'buddha', 'dian mu', 'garuda', 'heimdall', 'helios',
      'huginn & muninn', 'hyperion', 'khepri', 'lei gong', 'marishiten',
      'mnevis', 'nefertem', 'nezha', 'peng', 'ra',
      'raijin', 'raiju', 'selene', 'shu', 'surya',
      'tengu', 'theia', 'valkyrie', 'zeus',
    },
    'moon': {
      'artemis', 'baku', 'chandra', 'chang\'e', 'gashadokuro',
      'hecate', 'hypnos', 'jiangshi', 'khonsu', 'morpheus',
      'nephthys', 'nyx', 'phoebe', 'selene', 'tsukuyomi',
    },
  };
// ── Favorites → matching gods ──
    static const _favoriteMap = {
    'music': {
      'ame-no-uzume', 'apollo', 'asura', 'bastet', 'benzaiten',
      'bes', 'bragi', 'eight immortals', 'fuxi', 'ganesha',
      'hapi', 'hathor', 'hotei', 'kappa', 'krishna',
      'mnemosyne', 'odin', 'odysseus', 'orpheus', 'ptah',
      'saraswati', 'shiva', 'takamimusubi', 'tengu', 'wepwawet',
      'white impermanence',
    },
    'war': {
      'achilles', 'ammit', 'apollo', 'ares', 'arjuna',
      'artemis', 'athena', 'baku', 'bellerophon', 'bes',
      'bhishma', 'bishamonten', 'bixie', 'durga', 'erlang shen',
      'freya', 'futsunushi', 'guan yu', 'hachiman', 'heimdall',
      'hephaestus', 'heracles', 'horus', 'hou yi', 'indra',
      'karna', 'kartikeya', 'lei gong', 'lu dongbin', 'marishiten',
      'menshen', 'minamoto no yoshitsune', 'mulan', 'odin', 'oni',
      'perseus', 'pixiu', 'rama', 'sekhmet', 'sha wujing',
      'sobek', 'surtr', 'takemikazuchi', 'takeminakata', 'taotie',
      'tartarus', 'taweret', 'tengu', 'theseus', 'tyr',
      'ullr', 'valkyrie', 'vishwakarma', 'wepwawet', 'white tiger',
      'yamato takeru', 'zhao gongming',
    },
    'knowledge': {
      'aegir & rán', 'amenotokotachi', 'amphitrite', 'amun', 'apep',
      'aten', 'athena', 'atlas', 'atum', 'azure dragon',
      'baldur', 'benkei', 'bennu', 'benzaiten', 'bhishma',
      'black tortoise', 'bragi', 'brahma', 'buddha', 'chaos',
      'charon', 'chimera', 'coeus', 'cyclops', 'dragon king of the north (ao shun)',
      'dragon king of the west (ao run)', 'eight immortals', 'erebus', 'fenrir', 'forseti',
      'frigg', 'fujin', 'fukurokuju', 'fuxi', 'ganesha',
      'gashadokuro', 'hanuman', 'helios', 'hrungnir', 'huginn & muninn',
      'huli jing', 'hundun', 'hydra', 'hyperion', 'hypnos',
      'iapetus', 'isis', 'izanami', 'jigong', 'judge cui',
      'jurojin', 'kitsune', 'krishna', 'lu dongbin', 'matsya',
      'menoetius', 'mimir', 'minotaur', 'naga', 'nandi',
      'nereus', 'nidhogg', 'nu wa', 'nue', 'nyx',
      'odin', 'pangu', 'persephone', 'pharaoh', 'phoebe',
      'prometheus', 'proteus', 'qilin', 'queen mother of the west', 'ra',
      'ratatoskr', 'ravana', 'saraswati', 'selene', 'seshat',
      'shinigami', 'shu', 'sirens', 'sokar', 'sphinx',
      'susanoo', 'tai bai jin xing', 'taiyi', 'takamimusubi', 'tang sanzang',
      'thanatos', 'thoth', 'triton', 'tsukuyomi', 'uranus',
      'vamana', 'varaha', 'vidar', 'wen chang', 'yamata no orochi',
      'ymir', 'yomotsu hirasaka',
    },
    'nature': {
      'angrboda', 'aphrodite', 'bastet', 'chandra', 'crius',
      'cronus', 'daikokuten', 'demeter', 'dionysus', 'dragon king of the east (ao guang)',
      'dragon king of the south (ao qin)', 'echidna', 'epimetheus', 'feng bo', 'freya',
      'freyr', 'gaia', 'geb', 'hapi', 'he bo',
      'idun', 'inari', 'izanagi', 'jiangshi', 'jörmungandr',
      'kamimusubi', 'khnum', 'khonsu', 'kintaro', 'konohanasakuya',
      'kuraokami', 'kurma', 'lakshmi', 'long (dragon)', 'min',
      'mnevis', 'oceanus', 'orpheus', 'osiris', 'poseidon',
      'raijin', 'rhea', 'ryujin', 'shinatsuhiko', 'sif',
      'skadi', 'sobek', 'suijin', 'takeminakata', 'taweret',
      'tefnut', 'tethys', 'tu di gong', 'umashiashikabihikoji', 'varuna',
      'watatsumi', 'yu shi', 'ōkuninushi',
    },
    'beauty': {
      'aphrodite', 'baldur', 'chandra', 'chang\'e', 'eros',
      'fenghuang', 'freya', 'frigg', 'hathor', 'huli jing',
      'kamadeva', 'konohanasakuya', 'krishna', 'lakshmi', 'nefertem',
      'orpheus', 'parvati', 'radha', 'sif', 'yuki-onna',
    },
    'adventure': {
      'achilles', 'garuda', 'hermes', 'horse-face', 'huginn & muninn',
      'khonsu', 'marishiten', 'nezha', 'orpheus', 'peng',
      'raiju', 'sleipnir', 'takemikazuchi', 'tengu', 'urashima taro',
      'valkyrie', 'vayu', 'yamato takeru',
    },
    'magic': {
      'angrboda', 'draugr', 'eight immortals', 'erlang shen', 'feng bo',
      'freya', 'fuxi', 'hecate', 'huli jing', 'isis',
      'jigong', 'jorōgumo', 'kali', 'kappa', 'khepri',
      'kitsune', 'krishna', 'li jing', 'loki', 'mnevis',
      'morpheus', 'nephthys', 'odin', 'oni', 'orpheus',
      'peng', 'proteus', 'serqet', 'shikome', 'shiva',
      'sun wukong', 'tang sanzang', 'tanuki', 'tengu', 'theia',
      'thoth', 'utgard-loki', 'vamana', 'vermilion bird', 'zhao gongming',
      'zhong kui', 'zhu bajie', 'ōkuninushi',
    },
    'wealth': {
      'bishamonten', 'cai shen', 'daikokuten', 'dragon king of the east (ao guang)', 'dragon king of the west (ao run)',
      'ebisu', 'eight immortals', 'fenghuang', 'freyr', 'guan yu',
      'hades', 'hapi', 'hotei', 'inari', 'jurojin',
      'kubera', 'lakshmi', 'long (dragon)', 'min', 'naga',
      'njord', 'pixiu', 'tanuki', 'taweret', 'thrym',
      'vishnu', 'wen chang', 'white impermanence', 'zhao gongming',
    },
    'family': {
      'angrboda', 'bastet', 'bes', 'daikokuten', 'durga',
      'echidna', 'frigg', 'gaia', 'hathor', 'hera',
      'hestia', 'isis', 'konohanasakuya', 'li jing', 'menshen',
      'parvati', 'rhea', 'sif', 'taweret', 'thetis',
      'typhon',
    },
    'justice': {
      'amaterasu', 'amenominakanushi', 'athena', 'bishamonten', 'black impermanence',
      'crius', 'dian mu', 'emma-o', 'erinyes (furies)', 'forseti',
      'hel', 'horse-face', 'jade emperor', 'judge cui', 'kalki',
      'lei gong', 'ma\'at', 'momotaro', 'narasimha', 'nereus',
      'norns', 'ox-head', 'parashurama', 'qilin', 'raiju',
      'rama', 'sekhmet', 'seth', 'tefnut', 'ten kings of hell',
      'themis', 'thoth', 'tyr', 'varuna', 'vili & vé',
      'vishnu', 'white impermanence', 'yama', 'yanluo wang', 'zeus',
      'zhong kui',
    },
    'healing': {
      'apollo', 'ashwini kumaras', 'buddha', 'idun', 'isis',
      'jigong', 'jurojin', 'kamimusubi', 'kappa', 'khonsu',
      'lu dongbin', 'meng po', 'nefertem', 'sekhmet', 'serqet',
      'surya', 'tang sanzang', 'ōkuninushi',
    },
    'protection': {
      'agni', 'anubis', 'artemis', 'baku', 'bastet',
      'bes', 'bishamonten', 'bixie', 'cerberus', 'dragon king of the south (ao qin)',
      'durga', 'frigg', 'futsunushi', 'garuda', 'hachiman',
      'heimdall', 'horse-face', 'horus', 'isis', 'izanagi',
      'kubera', 'li jing', 'matsya', 'medusa', 'menshen',
      'min', 'naga', 'narasimha', 'nekhbet', 'nephthys',
      'nu wa', 'nut', 'ox-head', 'pixiu', 'rhea',
      'scylla & charybdis', 'serqet', 'sobek', 'sphinx', 'taweret',
      'thetis', 'thor', 'tu di gong', 'vishnu', 'wadjet',
      'wepwawet', 'zhong kui',
    },
  };
// ── God profiles: tags for each god ──
  static Map<String, Set<String>> _buildGodProfile(God g) {
    final name = g.name.toLowerCase();
    return {
      'personality': _personalityMap.entries
          .where((e) => e.value.contains(name))
          .map((e) => e.key)
          .toSet(),
      'element': _elementMap.entries
          .where((e) => e.value.contains(name))
          .map((e) => e.key)
          .toSet(),
      'favorite': _favoriteMap.entries
          .where((e) => e.value.contains(name))
          .map((e) => e.key)
          .toSet(),
    };
  }

  // ── Year → Chinese Zodiac ──
  static const _chineseAnimals = [
    'monkey', 'rooster', 'dog', 'pig', 'rat', 'ox',
    'tiger', 'rabbit', 'dragon', 'snake', 'horse', 'goat',
  ];

  static String _chineseZodiac(int year) {
    return _chineseAnimals[year % 12];
  }

  // ── Chinese Zodiac → matching gods ──
  static const _chineseZodiacMap = {
    'rat':     {'ganesha', 'hermes', 'loki'},
    'ox':      {'zeus', 'odin', 'vishnu'},
    'tiger':   {'ares', 'thor', 'durga', 'seth'},
    'rabbit':  {'artemis', 'bastet', 'frigg'},
    'dragon':  {'zeus', 'ra', 'shiva', 'apollo'},
    'snake':   {'hades', 'anubis', 'kali', 'thoth'},
    'horse':   {'poseidon', 'ra', 'krishna', 'brahma'},
    'goat':    {'skadi', 'freya'},
    'monkey':  {'hermes', 'loki', 'thoth'},
    'rooster': {'apollo', 'ra', 'horus'},
    'dog':     {'tyr', 'heimdall', 'osiris'},
    'pig':     {'baldur', 'freyr', 'ganesha', 'lakshmi'},
  };

  List<MapEntry<God, double>> _computeScores() {
    final scores = <God, double>{};
    final chineseZodiac = _chineseZodiac(birthYear);

    for (final god in godsData) {
      final profile = _buildGodProfile(god);
      double score = 0;

      // Zodiac element match (2 points)
      final zodiacPref = _zodiacElements[zodiac] ?? <String>[];
      final godElements = profile['element'] ?? {};
      for (final ze in zodiacPref) {
        if (godElements.contains(ze)) score += 2;
      }

      // Personality match (3 points — strongest signal)
      if (profile['personality']?.contains(personality) ?? false) score += 3;

      // Element match (2 points)
      if (profile['element']?.contains(element) ?? false) score += 2;

      // Favorite match (1 point per selected favorite that matches)
      final godFavorites = profile['favorite'] ?? {};
      for (final f in favorites) {
        if (godFavorites.contains(f)) score += 1;
      }

      // Chinese zodiac match (+1 point — year-based)
      final zodiacGods = _chineseZodiacMap[chineseZodiac] ?? <String>{};
      if (zodiacGods.contains(god.name.toLowerCase())) score += 1;

      if (score > 0) scores[god] = score;
    }

    final sorted = scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.take(3).toList();
  }

  /// Plain-language reasons why [god] matched the user's answers, in the
  /// same order the score was built from (personality, element, zodiac
  /// element, favorites, Chinese zodiac).
  List<String> _buildReasons(God god, String lang) {
    final profile = _buildGodProfile(god);
    final reasons = <String>[];

    if (profile['personality']?.contains(personality) ?? false) {
      final label = _personalityLabels[personality]?[lang] ?? personality;
      reasons.add(lang == 'en'
          ? 'You both share a $label personality.'
          : 'Kamu dan ${god.name} sama-sama memiliki kepribadian yang $label.');
    }

    if (profile['element']?.contains(element) ?? false) {
      final label = _elementLabels[element]?[lang] ?? element;
      reasons.add(lang == 'en'
          ? 'Your favorite element, $label, is also part of ${god.name}\'s power.'
          : 'Elemen favoritmu, $label, juga menjadi bagian dari kekuatan ${god.name}.');
    }

    final zodiacPref = _zodiacElements[zodiac] ?? <String>[];
    final godElements = profile['element'] ?? {};
    final matchedZodiacElements =
        zodiacPref.where((e) => godElements.contains(e)).toList();
    if (matchedZodiacElements.isNotEmpty) {
      final labels = matchedZodiacElements
          .map((e) => _elementLabels[e]?[lang] ?? e)
          .join(lang == 'en' ? ' and ' : ' dan ');
      final zodiacLabel = _zodiacLabels[zodiac] ?? zodiac;
      reasons.add(lang == 'en'
          ? 'Your zodiac sign, $zodiacLabel, resonates with the $labels element ${god.name} commands.'
          : 'Zodiakmu, $zodiacLabel, selaras dengan elemen $labels yang dikuasai ${god.name}.');
    }

    final godFavorites = profile['favorite'] ?? {};
    final matchedFavorites =
        favorites.where((f) => godFavorites.contains(f)).toList();
    if (matchedFavorites.isNotEmpty) {
      final labels = matchedFavorites
          .map((f) => _favoriteLabels[f]?[lang] ?? f)
          .join(', ');
      reasons.add(lang == 'en'
          ? 'You both love $labels.'
          : 'Kamu dan ${god.name} sama-sama menyukai $labels.');
    }

    final chineseZodiac = _chineseZodiac(birthYear);
    final zodiacGods = _chineseZodiacMap[chineseZodiac] ?? <String>{};
    if (zodiacGods.contains(god.name.toLowerCase())) {
      final label = _chineseZodiacLabels[chineseZodiac]?[lang] ?? chineseZodiac;
      reasons.add(lang == 'en'
          ? 'Your Chinese zodiac, $label, is traditionally linked to ${god.name}.'
          : 'Shio kelahiranmu, $label, secara tradisional dikaitkan dengan ${god.name}.');
    }

    return reasons;
  }

  // ── Shared mythic palette ──
  static const _gold = Color(0xFFB07800);
  static const _goldBright = Color(0xFFC9A227);
  static const _cream = Color(0xFFEDE4D3);
  static const _cardBg = Color(0xE00E0B08); // translucent so parchment shows
  static const _textShadow = [Shadow(color: Colors.black, blurRadius: 8)];

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final results = _computeScores();
    final top = results.isNotEmpty ? results.first.key : null;
    final scoreMax = results.isNotEmpty ? results.first.value : 1.0;

    final titleText = lang == 'en' ? 'The Signs Reveal...' : 'Tanda Menunjukkan...';

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Parchment / map background for a mythic, ancient-scroll feel.
          Image.asset(
            'assets/images/peta.webp',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF1A1410)),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.82),
                  Colors.black.withValues(alpha: 0.7),
                  Colors.black.withValues(alpha: 0.9),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header — back link, then ceremonial title.
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back_rounded,
                                color: Colors.white, size: 22),
                            SizedBox(width: 4),
                            Text(
                              'Back',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        titleText,
                        style: AppFonts.cinzel(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: _goldBright,
                          letterSpacing: 1.5,
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 10)
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),

                Expanded(
                  child: results.isEmpty
                      ? Center(
                          child: Text(
                            lang == 'en'
                                ? 'No matching gods found.'
                                : 'Tidak ada dewa yang cocok.',
                            style: const TextStyle(color: Colors.white54),
                          ),
                        )
                      : ListView(
                          padding: const EdgeInsets.fromLTRB(20, 6, 20, 24),
                          children: [
                            // Top result hero
                            if (top != null) _buildHeroCard(top, lang),
                            const SizedBox(height: 16),
                            // Why this god matches
                            if (top != null) _buildReasonsCard(top, lang),
                            const SizedBox(height: 22),
                            // Alternatives
                            if (results.length > 1) ...[
                              _miniSectionLabel(lang == 'en'
                                  ? 'The signs also point to'
                                  : 'Tanda juga menunjuk pada'),
                              const SizedBox(height: 12),
                              ...results.skip(1).map(
                                    (e) => _buildCompactCard(
                                        e.key, e.value, scoreMax, lang),
                                  ),
                            ],
                            const SizedBox(height: 18),
                            // Your traits summary
                            _buildTraitsSummary(lang),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniSectionLabel(String text) {
    return Row(
      children: [
        Text(
          text.toUpperCase(),
          style: AppFonts.cinzel(
            color: _cream,
            fontSize: 11.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
            shadows: _textShadow,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(height: 1, color: _gold.withValues(alpha: 0.3)),
        ),
      ],
    );
  }

  Widget _ornament() {
    return Row(
      children: [
        Container(width: 30, height: 1, color: _gold.withValues(alpha: 0.7)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 9),
          child: Icon(Icons.auto_awesome, color: _goldBright, size: 12),
        ),
        Container(width: 30, height: 1, color: _gold.withValues(alpha: 0.7)),
      ],
    );
  }

  Widget _buildHeroCard(God god, String lang) {
    final color = GodCard.mythologyColor(god.mythology);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _gold.withValues(alpha: 0.7), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: _gold.withValues(alpha: 0.28),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Portrait with a "chosen deity" ribbon over it.
            SizedBox(
              height: 210,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  god.imageUrl.isNotEmpty
                      ? (god.imageUrl.startsWith('assets/')
                          ? Image.asset(god.imageUrl,
                              fit: BoxFit.cover, alignment: Alignment.topCenter)
                          : Image.network(god.imageUrl,
                              fit: BoxFit.cover, alignment: Alignment.topCenter))
                      : Container(color: const Color(0xFF222222)),
                  // Bottom scrim so the ribbon + top edge blend into the info panel.
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.55, 1.0],
                        colors: [
                          Colors.transparent,
                          _cardBg.withValues(alpha: 0.95),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [_goldBright, _gold],
                        ),
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.auto_awesome_rounded,
                              color: Colors.white, size: 13),
                          const SizedBox(width: 6),
                          Text(
                            lang == 'en' ? 'YOUR DEITY' : 'DEWA PILIHANMU',
                            style: AppFonts.cinzel(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Info panel
            Container(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 18),
              color: _cardBg,
              child: Column(
                children: [
                  Text(
                    god.name,
                    textAlign: TextAlign.center,
                    style: GodCard.mythologyFont(
                      god.mythology,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 2,
                      shadows: const [Shadow(color: Colors.black, blurRadius: 8)],
                    ),
                  ),
                  const SizedBox(height: 8),
                  _ornament(),
                  const SizedBox(height: 8),
                  Text(
                    god.localizedTitle(lang),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: _cream,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    god.mythology.toUpperCase(),
                    style: TextStyle(
                      color: color,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.5,
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Powers
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    alignment: WrapAlignment.center,
                    children: god
                        .localizedPowers(lang)
                        .take(4)
                        .map((p) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: _gold.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: _gold.withValues(alpha: 0.4)),
                              ),
                              child: Text(
                                p,
                                style: const TextStyle(
                                  color: _goldBright,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonsCard(God god, String lang) {
    final color = GodCard.mythologyColor(god.mythology);
    final reasons = _buildReasons(god, lang);
    if (reasons.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _gold.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.local_library_rounded,
                  color: _goldBright, size: 15),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  lang == 'en'
                      ? 'Why ${god.name} Fits You'
                      : 'Kenapa ${god.name} Cocok Untukmu',
                  style: AppFonts.cinzel(
                    color: Colors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...reasons.map((r) => Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2, right: 9),
                      child: Icon(Icons.auto_awesome,
                          color: color.withValues(alpha: 0.9), size: 12),
                    ),
                    Expanded(
                      child: Text(
                        r,
                        style: const TextStyle(
                          color: _cream,
                          fontSize: 12.5,
                          height: 1.55,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildCompactCard(God god, double score, double maxScore, String lang) {
    final pct = ((score / maxScore) * 100).round();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _gold.withValues(alpha: 0.22)),
      ),
      child: Row(
        children: [
          // Mini image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 50,
              height: 50,
              child: god.imageUrl.isNotEmpty
                  ? (god.imageUrl.startsWith('assets/')
                      ? Image.asset(god.imageUrl, fit: BoxFit.cover)
                      : Image.network(god.imageUrl, fit: BoxFit.cover))
                  : Container(color: const Color(0xFF222222)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  god.name,
                  style: GodCard.mythologyFont(
                    god.mythology,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  god.localizedTitle(lang),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFFB3A98F),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          // Match percentage
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: _gold.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _gold.withValues(alpha: 0.4)),
            ),
            child: Text(
              '$pct%',
              style: const TextStyle(
                color: _goldBright,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTraitsSummary(String lang) {
    // Localized display values (fall back to the raw id if unmapped).
    final personalityText =
        _personalityLabels[personality]?[lang] ?? personality;
    final elementText = _elementLabels[element]?[lang] ?? element;
    final favoriteText = favorites
        .map((f) => _favoriteLabels[f]?[lang] ?? f)
        .join(', ');

    final rows = <(IconData, String, String)>[
      (Icons.star_border_rounded, lang == 'en' ? 'Zodiac' : 'Zodiak',
          _zodiacLabels[zodiac] ?? zodiac),
      (
        Icons.pets_rounded,
        lang == 'en' ? 'Chinese Zodiac' : 'Shio',
        _chineseZodiacLabels[_chineseZodiac(birthYear)]?[lang] ??
            _chineseZodiac(birthYear)
      ),
      (Icons.psychology_rounded,
          lang == 'en' ? 'Personality' : 'Kepribadian', personalityText),
      (Icons.whatshot_rounded, lang == 'en' ? 'Element' : 'Elemen',
          elementText),
      (Icons.favorite_rounded, lang == 'en' ? 'Favorite' : 'Kesukaan',
          favoriteText),
    ];

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _gold.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.fingerprint_rounded,
                  color: _goldBright, size: 15),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  lang == 'en' ? 'The Signs You Gave' : 'Tanda yang Kamu Beri',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.cinzel(
                    color: Colors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...rows.map((r) => Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(r.$1, color: _gold.withValues(alpha: 0.8), size: 14),
                    const SizedBox(width: 9),
                    SizedBox(
                      width: 92,
                      child: Text(
                        r.$2,
                        style: const TextStyle(
                          color: Color(0xFFB3A98F),
                          fontSize: 11.5,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        r.$3,
                        style: const TextStyle(
                          color: _cream,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
