import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import '../data/gods_data.dart';
import '../models/god_model.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';

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
      'zeus', 'ares', 'thor', 'indra', 'horus', 'ra', 'seth', 'durga', 'artemis',
      'atlas', 'helios', 'cerberus', 'triton', 'heracles', 'perseus', 'theseus', 'cyclops', 'achilles',
      'sobek',
      'tyr', 'ullr', 'hrungnir', 'sleipnir', 'valkyrie', 'skadi',
      'varaha', 'narasimha', 'rama', 'kalki', 'kartikeya', 'vayu', 'surya', 'hanuman', 'garuda',
      'matsya', 'parashurama',
    },
    'wise': {
      'zeus', 'athena', 'odin', 'thoth', 'vishnu', 'brahma', 'heimdall', 'krishna', 'apollo',
      'hyperion', 'coeus', 'themis', 'mnemosyne', 'nereus', 'odysseus', 'theia', 'phoebe',
      'isis', 'amun', 'atum', "ma'at", 'seshat', 'pharaoh',
      'tyr', 'mimir', 'vili & vé', 'norns',
      'vamana', 'varuna', 'ganesha', 'saraswati', 'matsya', 'rama', 'buddha', 'surya', 'yama', 'ravana', 'nandi',
    },
    'creative': {
      'athena', 'aphrodite', 'bastet', 'apollo', 'loki',
      'hephaestus', 'prometheus', 'sirens', 'mnemosyne', 'cyclops',
      'hathor', 'ptah', 'bes', 'khnum',
      'bragi', 'odin', 'hermes',
      'krishna', 'brahma', 'saraswati', 'dionysus',
    },
    'calm': {
      'poseidon', 'osiris', 'ganesha', 'brahma', 'hera', 'bastet', 'vishnu', 'shiva', 'lakshmi', 'demeter',
      'oceanus', 'rhea', 'tethys', 'epimetheus', 'hestia', 'gaia', 'selene', 'amphitrite', 'hypnos', 'thanatos',
      'shu', 'tefnut', 'geb', 'khonsu', 'hapi', 'taweret',
      'idun', 'sif', 'freyr', 'njord', 'baldur', 'frigg',
      'parvati', 'kurma', 'buddha', 'chandra', 'kubera', 'nandi',
    },
    'passionate': {
      'ares', 'shiva', 'seth', 'durga', 'kali', 'aphrodite', 'poseidon', 'freya',
      'dionysus', 'menoetius', 'eros', 'minotaur', 'chimera', 'hathor',
      'sekhmet', 'min',
      'surtr', 'fenrir',
      'parashurama', 'agni', 'asura', 'narasimha', 'radha',
    },
    'mysterious': {
      'hades', 'anubis', 'kali', 'frigg', 'loki', 'amun',
      'cronus', 'crius', 'chaos', 'uranus', 'tartarus', 'nyx', 'erebus',
      'persephone', 'thanatos', 'charon', 'medusa', 'hydra', 'sphinx', 'sirens', 'iapetus',
      'nut', 'nephthys', 'ammit', 'apep',
      'vidar', 'ymir', 'angrboda', 'aegir & rán', 'jörmungandr', 'hel', 'nidhogg', 'draugr', 'thrym',
      'yama', 'naga', 'asura',
    },
  };

  // ── Element → matching gods ──
  static const _elementMap = {
    'fire': {
      'zeus', 'ra', 'thor', 'apollo', 'ares',
      'hephaestus', 'prometheus', 'hestia', 'eros', 'heracles', 'achilles', 'chimera', 'cyclops',
      'sekhmet', 'bes',
      'surtr',
      'narasimha', 'parashurama', 'kartikeya', 'agni', 'ravana', 'asura',
    },
    'water': {
      'poseidon', 'ganesha',
      'oceanus', 'tethys', 'amphitrite', 'triton', 'nereus', 'odysseus', 'hydra', 'sirens',
      'isis', 'tefnut', 'sobek', 'hapi', 'taweret', 'khnum',
      'mimir', 'njord', 'aegir & rán', 'jörmungandr',
      'radha', 'matsya', 'kurma', 'varuna', 'naga',
    },
    'earth': {
      'demeter',
      'dionysus', 'cronus', 'iapetus', 'rhea', 'themis', 'mnemosyne', 'atlas', 'epimetheus',
      'gaia', 'persephone', 'theseus', 'medusa', 'minotaur',
      'ptah', 'geb', 'min', 'sphinx',
      'idun', 'vidar', 'sif', 'ullr', 'vili & vé', 'ymir', 'thrym', 'hrungnir',
      'parvati', 'varaha', 'vamana', 'kubera', 'nandi',
    },
    'air': {
      'hermes', 'heimdall', 'freya',
      'hera', 'crius', 'coeus', 'uranus', 'sphinx',
      'amun', 'shu', "ma'at", 'seshat',
      'bragi',
      'buddha', 'vayu', 'hanuman', 'garuda',
    },
    'lightning': {
      'zeus', 'seth', 'thor',
      'menoetius', 'perseus',
      'sleipnir', 'valkyrie',
      'kalki',
    },
    'death': {
      'hades', 'anubis', 'kali',
      'chaos', 'tartarus', 'erebus', 'thanatos', 'charon', 'cerberus',
      'nephthys', 'ammit', 'apep',
      'angrboda', 'fenrir', 'hel', 'nidhogg', 'draugr',
      'yama',
    },
    'sun': {
      'apollo', 'ra', 'krishna',
      'hyperion', 'theia', 'helios',
      'hathor', 'atum', 'pharaoh',
      'freyr', 'baldur',
      'rama', 'surya',
    },
    'moon': {
      'artemis', 'bastet', 'durga',
      'phoebe', 'nyx', 'selene', 'hypnos',
      'nut', 'khonsu',
      'norns',
      'chandra',
    },
  };

  // ── Favorites → matching gods ──
  static const _favoriteMap = {
    'music': {
      'apollo', 'bastet', 'freya', 'saraswati',
      'dionysus', 'sirens',
      'bes',
      'bragi',
    },
    'war': {
      'ares', 'horus', 'seth', 'durga', 'krishna',
      'menoetius', 'cerberus', 'achilles', 'minotaur', 'chimera', 'hydra',
      'sekhmet', 'sobek', 'pharaoh',
      'vidar', 'surtr', 'thrym', 'hrungnir', 'fenrir', 'jörmungandr', 'draugr', 'valkyrie',
      'varaha', 'narasimha', 'parashurama', 'kalki', 'kartikeya', 'ravana', 'asura',
    },
    'knowledge': {
      'athena', 'thoth', 'odin', 'brahma', 'vishnu',
      'cronus', 'iapetus', 'hyperion', 'coeus', 'phoebe', 'themis', 'mnemosyne', 'prometheus', 'nereus', 'sphinx',
      'amun', 'khonsu', "ma'at", 'seshat',
      'mimir', 'vili & vé', 'norns',
      'kurma', 'vamana', 'buddha', 'varuna', 'yama',
    },
    'nature': {
      'demeter', 'ganesha', 'skadi',
      'oceanus', 'rhea', 'tethys', 'epimetheus', 'hestia', 'gaia', 'persephone',
      'shu', 'tefnut', 'geb', 'hapi', 'taweret', 'min',
      'idun', 'freyr', 'njord',
      'nandi',
    },
    'beauty': {
      'aphrodite', 'bastet', 'freya', 'lakshmi',
      'hera', 'theia', 'eros', 'selene', 'amphitrite',
      'hathor',
      'sif', 'baldur',
      'parvati', 'radha', 'chandra',
    },
    'adventure': {
      'hermes', 'ra', 'thor', 'loki',
      'crius', 'atlas', 'uranus', 'helios', 'triton', 'heracles', 'perseus', 'theseus', 'odysseus',
      'ullr', 'aegir & rán', 'sleipnir',
      'matsya', 'rama', 'vayu', 'surya', 'hanuman', 'garuda',
    },
    'magic': {
      'loki', 'thoth', 'shiva', 'kali',
      'hephaestus', 'chaos', 'tartarus', 'nyx', 'erebus', 'thanatos', 'hypnos', 'charon', 'medusa', 'cyclops',
      'isis', 'ptah', 'atum', 'nut', 'nephthys', 'ammit', 'khnum', 'apep',
      'ymir', 'angrboda', 'hel', 'nidhogg',
      'agni', 'kubera', 'naga',
    },
    'wealth': {
      'hades', 'hermes',
      'min',
      'njord', 'thrym', 'freyr',
      'kubera', 'lakshmi',
    },
    'family': {
      'hera', 'hestia', 'rhea',
      'bastet', 'isis', 'taweret', 'bes',
      'frigg', 'sif', 'vili & vé',
      'parvati', 'durga',
    },
    'justice': {
      'zeus', 'athena', 'themis',
      "ma'at",
      'tyr', 'varuna',
      'vishnu', 'yama', 'rama', 'kalki', 'narasimha', 'parashurama',
    },
    'healing': {
      'apollo',
      'isis', 'khonsu', 'sekhmet',
      'idun',
      'surya',
    },
    'protection': {
      'artemis', 'thor', 'heimdall', 'frigg', 'rhea',
      'isis', 'horus', 'bastet', 'taweret', 'bes', 'nut', 'sobek', 'min', 'ammit',
      'durga', 'vishnu', 'kubera', 'matsya', 'narasimha', 'garuda',
      'cerberus', 'sphinx',
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

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final results = _computeScores();
    final top = results.isNotEmpty ? results.first.key : null;
    final scoreMax = results.isNotEmpty ? results.first.value : 1.0;

    final titleText = lang == 'en' ? 'Your God Is...' : 'Dewamu Adalah...';
    final matchPct = top != null ? ((results.first.value / scoreMax) * 100).round() : 0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF333333)),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 18),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    titleText,
                    style: AppFonts.cinzel(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFFB07800),
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: results.isEmpty
                  ? const Center(
                      child: Text('No matching gods found.',
                          style: TextStyle(color: Colors.white54)),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        // Top result hero
                        if (top != null) _buildHeroCard(top, lang),
                        const SizedBox(height: 16),
                        // Why this god matches
                        if (top != null) _buildReasonsCard(top, lang),
                        const SizedBox(height: 20),
                        // Alternatives
                        if (results.length > 1) ...[
                          Text(
                            lang == 'en' ? 'Also matches' : 'Cocok juga dengan',
                            style: const TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ...results.skip(1).map(
                                (e) => _buildCompactCard(e.key, e.value, scoreMax, lang),
                              ),
                        ],
                        const SizedBox(height: 16),
                        // Your traits summary
                        _buildTraitsSummary(lang),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard(God god, String lang) {
    final color = GodCard.mythologyColor(god.mythology);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image
          SizedBox(
            height: 180,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(14)),
              child: god.imageUrl.isNotEmpty
                  ? (god.imageUrl.startsWith('assets/')
                      ? Image.asset(god.imageUrl, fit: BoxFit.cover)
                      : Image.network(god.imageUrl, fit: BoxFit.cover))
                  : Container(color: const Color(0xFF222222)),
            ),
          ),
          // Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF111111),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(14)),
            ),
            child: Column(
              children: [
                Text(
                  god.name,
                  style: GodCard.mythologyFont(
                    god.mythology,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  god.localizedTitle(lang),
                  style: TextStyle(
                    color: color,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  god.mythology,
                  style: const TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 11,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 12),
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
                              color: color.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: color.withOpacity(0.3)),
                            ),
                            child: Text(
                              p,
                              style: TextStyle(
                                color: color,
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
    );
  }

  Widget _buildReasonsCard(God god, String lang) {
    final color = GodCard.mythologyColor(god.mythology);
    final reasons = _buildReasons(god, lang);
    if (reasons.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang == 'en'
                ? 'Why ${god.name} Fits You'
                : 'Kenapa ${god.name} Cocok Untukmu',
            style: const TextStyle(
              color: Color(0xFFB07800),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          ...reasons.map((r) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6, right: 10),
                      width: 6,
                      height: 6,
                      decoration:
                          BoxDecoration(color: color, shape: BoxShape.circle),
                    ),
                    Expanded(
                      child: Text(
                        r,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                          height: 1.5,
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
    final color = GodCard.mythologyColor(god.mythology);
    final pct = (score / maxScore * 100).round();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Row(
        children: [
          // Mini image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 48,
              height: 48,
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
                  style: const TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          // Match percentage
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$pct%',
              style: TextStyle(
                color: color,
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
    final traits = {
      'zodiac': zodiac.toUpperCase(),
      'chinese': _chineseZodiac(birthYear).toUpperCase(),
      'personality': personality,
      'element': element,
      'favorite': favorites.join(', '),
    };

    final labels = {
      'zodiac': lang == 'en' ? 'Zodiac' : 'Zodiak',
      'chinese': lang == 'en' ? 'Chinese Zodiac' : 'Shio',
      'personality': lang == 'en' ? 'Personality' : 'Kepribadian',
      'element': lang == 'en' ? 'Element' : 'Elemen',
      'favorite': lang == 'en' ? 'Favorite' : 'Kesukaan',
    };

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang == 'en' ? 'Your Traits' : 'Cirimu',
            style: const TextStyle(
              color: Color(0xFFB07800),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          ...traits.entries.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        labels[e.key]!,
                        style: const TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Text(
                      e.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
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
