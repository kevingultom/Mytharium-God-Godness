import '../models/combatant.dart';

/// Bilingual short text pair.
class _Bi {
  final String id;
  final String en;
  const _Bi(this.id, this.en);
}

/// A single structured reason behind the outcome, shown to the user as a
/// clearly-labelled factor card (title + one-line description).
class BattleFactor {
  final String kind; // 'myth' | 'status' | 'domain' | 'balance'
  final String titleId;
  final String titleEn;
  final String descId;
  final String descEn;

  const BattleFactor({
    required this.kind,
    required this.titleId,
    required this.titleEn,
    required this.descId,
    required this.descEn,
  });

  String title(String lang) => lang == 'id' ? titleId : titleEn;
  String desc(String lang) => lang == 'id' ? descId : descEn;
}

/// Result of a single god-vs-god battle.
class BattleResult {
  final Combatant winner;
  final Combatant loser;
  final double winnerProbability; // 0.0–1.0, chance the winner had of winning
  final String explanationId;
  final String explanationEn;
  final bool isCanonical; // true if this exact matchup is drawn from an attested myth
  final List<BattleFactor> factors; // structured "why", most decisive first

  const BattleResult({
    required this.winner,
    required this.loser,
    required this.winnerProbability,
    required this.explanationId,
    required this.explanationEn,
    required this.isCanonical,
    this.factors = const [],
  });

  String explanation(String lang) => lang == 'id' ? explanationId : explanationEn;
}

/// Deterministic, mythology-grounded battle engine.
///
/// A fight's outcome is driven by three layers, in priority order:
/// 1. Canonical matchups — specific named victories attested in the actual
///    myths (e.g. Heracles beating the Hydra). These always follow the myth.
/// 2. Status tier — a god's rank/authority within their pantheon
///    (e.g. a king of the gods outranks a minor hero).
/// 3. Power-domain counters — elemental/thematic advantages derived from
///    each god's actual `powers` (e.g. storm counters fire, wisdom counters
///    brute strength, light counters death).
///
/// The computed win probability is what actually decides the outcome (one
/// weighted coin flip), so the percentage shown to the user is never
/// decorative — it is the real probability used.
class BattleEngine {
  // ─── Category base tier (mythological status), keyed 'Mythology|Category'
  // because the same category label can mean very different power levels
  // across mythologies (e.g. Egyptian 'Creature' vs Nordic 'Creature').
  static const Map<String, double> _categoryTier = {
    // Greek
    'Greek|Primordial': 9.0,
    'Greek|Olympian': 8.0,
    'Greek|Titan': 7.5,
    'Greek|Underworld': 7.0,
    'Greek|Sea': 6.0,
    'Greek|Monster': 5.5,
    'Greek|Hero': 4.5,
    // Egyptian
    'Egyptian|Sun': 8.3,
    'Egyptian|Ennead': 8.0,
    'Egyptian|Death': 6.5,
    'Egyptian|Craft': 5.5,
    'Egyptian|Fertility': 5.0,
    'Egyptian|Creature': 5.0,
    // Nordic
    'Nordic|Aesir': 7.5,
    'Nordic|Vanir': 6.5,
    'Nordic|Jotun': 6.0,
    'Nordic|Creature': 6.5,
    'Nordic|Special': 5.5,
    // Hindu
    'Hindu|Trimurti': 9.5,
    'Hindu|Tridevi': 8.0,
    'Hindu|Avatar': 7.5,
    'Hindu|Devas': 6.5,
    'Hindu|Figures': 5.5,
  };
  static const double _defaultTier = 5.0;

  // ─── Individual overrides for gods whose narrative status clearly
  // outranks (or under-ranks) the rest of their category, keyed
  // 'Mythology|Name'.
  static const Map<String, double> _tierOverride = {
    // Greek
    'Greek|Zeus': 9.5,
    'Greek|Poseidon': 9.0,
    'Greek|Hades': 9.0,
    'Greek|Persephone': 7.5,
    'Greek|Athena': 8.8,
    'Greek|Cronus': 8.5,
    'Greek|Heracles': 7.0,
    'Greek|Hydra': 6.5,
    'Greek|Cerberus': 6.3,
    'Greek|Chimera': 6.0,
    'Greek|Medusa': 5.0,
    // Egyptian
    'Egyptian|Ra': 9.3,
    'Egyptian|Amun': 9.0,
    'Egyptian|Horus': 8.5,
    'Egyptian|Osiris': 8.3,
    'Egyptian|Isis': 8.0,
    'Egyptian|Seth': 7.8,
    'Egyptian|Apep': 8.0,
    'Egyptian|Sekhmet': 7.5,
    'Egyptian|Anubis': 6.8,
    // Nordic
    'Nordic|Odin': 9.3,
    'Nordic|Thor': 8.8,
    'Nordic|Fenrir': 8.5,
    'Nordic|Jörmungandr': 8.3,
    'Nordic|Surtr': 8.5,
    'Nordic|Ymir': 8.0,
    'Nordic|Hel': 7.5,
    'Nordic|Loki': 7.0,
    'Nordic|Vidar': 7.0,
    // Hindu
    'Hindu|Shiva': 9.8,
    'Hindu|Vishnu': 9.7,
    'Hindu|Brahma': 9.3,
    'Hindu|Kali': 8.8,
    'Hindu|Durga': 8.7,
    'Hindu|Narasimha': 8.5,
    'Hindu|Kalki': 7.8,
    'Hindu|Indra': 7.8,
    'Hindu|Ravana': 7.5,
    'Hindu|Rama': 7.5,
    'Hindu|Parashurama': 7.3,
    'Hindu|Yama': 7.2,
    'Hindu|Hanuman': 7.0,
    'Hindu|Garuda': 6.8,
    'Hindu|Ganesha': 6.0,
    'Hindu|Buddha': 4.5,
    'Hindu|Radha': 4.0,
  };

  static double _tierOf(Combatant g) {
    // Pop-culture combatants carry their own tier.
    if (g.tierOverride != null) return g.tierOverride!;
    final key = '${g.mythology}|${g.name}';
    if (_tierOverride.containsKey(key)) return _tierOverride[key]!;
    return _categoryTier['${g.mythology}|${g.category}'] ?? _defaultTier;
  }

  // ─── Power domains: keywords are matched against a god's Indonesian
  // *and* English power labels so classification is language-independent.
  static const Map<String, List<String>> _domainKeywords = {
    'Storm': ['petir', 'guntur', 'badai', 'langit', 'lightning', 'thunder', 'storm', 'sky'],
    'Fire': ['api', 'fire'],
    'Water': ['laut', 'air', 'sungai', 'ocean', 'sea', 'water', 'river', 'perairan', 'waters'],
    'Earth': ['bumi', 'tanah', 'earth', 'gunung', 'mountain'],
    'Death': ['kematian', 'dunia bawah', 'death', 'underworld', 'neraka', 'duat', 'akhirat'],
    'Life': ['kesuburan', 'penyembuhan', 'kehidupan', 'healing', 'fertility', 'life', 'kebangkitan', 'resurrection', 'panen', 'harvest'],
    'War': ['perang', 'kekuatan', 'war', 'strength', 'pertarungan', 'combat', 'kesaktian', 'prowess'],
    'Wisdom': ['kebijaksanaan', 'strategi', 'wisdom', 'strategy', 'pengetahuan', 'knowledge', 'kecerdikan', 'cunning'],
    'Trickery': ['tipu', 'kekacauan', 'trickery', 'chaos', 'ilusi', 'illusion', 'perubahan wujud', 'shape-shifting'],
    'Order': ['keadilan', 'hukum', 'justice', 'law', 'ketertiban', 'order', 'kebenaran', 'truth'],
    'Magic': ['sihir', 'magic', 'ramalan', 'prophecy', 'mystical'],
    'Light': ['matahari', 'cahaya', 'sun', 'light', 'radiance'],
    'Darkness': ['kegelapan', 'malam', 'darkness', 'night', 'bayangan', 'shadow'],
    'Time': ['waktu', 'takdir', 'time', 'fate', 'destiny', 'nasib'],
    'Creation': ['penciptaan', 'creation', 'asal mula', 'origin'],
  };

  // One domain -> the domains it holds a narrative/elemental edge over.
  // Deliberately one-directional (no A beats B *and* B beats A) so bonuses
  // never cancel out in a confusing way.
  static const Map<String, List<String>> _domainCounters = {
    'Storm': ['Water', 'Fire'],
    'Water': ['Fire'],
    'Fire': ['Earth', 'Life'],
    'Death': ['War', 'Life'],
    'Light': ['Death', 'Darkness'],
    'Darkness': ['Wisdom'],
    'Wisdom': ['War'],
    'Trickery': ['Wisdom'],
    'Order': ['Trickery'],
    'Magic': ['Order'],
    'Time': ['Creation', 'Magic'],
    'War': ['Earth'],
    'Creation': ['Death'],
  };

  static const Map<String, _Bi> _domainLabel = {
    'Storm': _Bi('badai & petir', 'storm & lightning'),
    'Fire': _Bi('api', 'fire'),
    'Water': _Bi('lautan', 'the sea'),
    'Earth': _Bi('bumi', 'the earth'),
    'Death': _Bi('kematian', 'death'),
    'Life': _Bi('kehidupan & kesuburan', 'life & fertility'),
    'War': _Bi('perang & kekuatan fisik', 'war & raw strength'),
    'Wisdom': _Bi('kebijaksanaan & strategi', 'wisdom & strategy'),
    'Trickery': _Bi('tipu muslihat', 'trickery'),
    'Order': _Bi('hukum & keadilan', 'law & justice'),
    'Magic': _Bi('sihir', 'magic'),
    'Light': _Bi('cahaya', 'light'),
    'Darkness': _Bi('kegelapan', 'darkness'),
    'Time': _Bi('waktu & takdir', 'time & fate'),
    'Creation': _Bi('penciptaan', 'creation'),
  };

  static List<String> _domainsOf(Combatant g) {
    final text = [...g.powers, ...g.powersEn].join(' ').toLowerCase();
    final hits = <String>[];
    _domainKeywords.forEach((domain, keywords) {
      if (keywords.any((k) => text.contains(k))) hits.add(domain);
    });
    return hits;
  }

  /// Returns the domain that gives [a] an edge over [b], or null if none.
  static String? _counterDomain(List<String> aDomains, List<String> bDomains) {
    for (final d in aDomains) {
      final beats = _domainCounters[d];
      if (beats != null && beats.any(bDomains.contains)) return d;
    }
    return null;
  }

  // ─── Human-readable role phrase per (mythology|category), for the
  // generated explanation ("sebagai X, ...").
  static const Map<String, _Bi> _roleLabel = {
    'Greek|Primordial': _Bi('kekuatan primordial pembentuk alam semesta', 'a primordial force that shaped the universe'),
    'Greek|Olympian': _Bi('salah satu dari Dua Belas Olympian', 'one of the Twelve Olympians'),
    'Greek|Titan': _Bi('seorang Titan generasi purba', 'an ancient Titan'),
    'Greek|Underworld': _Bi('penguasa Dunia Bawah', 'a ruler of the Underworld'),
    'Greek|Sea': _Bi('dewa/dewi lautan', 'a deity of the sea'),
    'Greek|Monster': _Bi('monster legendaris', 'a legendary monster'),
    'Greek|Hero': _Bi('pahlawan/manusia setengah dewa', 'a hero and demigod'),
    'Egyptian|Sun': _Bi('dewa matahari & langit', 'a god of the sun and sky'),
    'Egyptian|Ennead': _Bi('anggota Ennead, sembilan dewa utama Heliopolis', 'a member of the Ennead, the nine great gods of Heliopolis'),
    'Egyptian|Death': _Bi('penjaga Duat dan penghakiman jiwa', 'a guardian of the Duat and judge of souls'),
    'Egyptian|Craft': _Bi('dewa pencipta & pelindung perajin', 'a creator god and patron of craftsmen'),
    'Egyptian|Fertility': _Bi('dewa kesuburan & pelindung rumah tangga', 'a god of fertility and household protection'),
    'Egyptian|Creature': _Bi('makhluk atau tokoh legendaris Mesir', 'a legendary Egyptian being or figure'),
    'Nordic|Aesir': _Bi('anggota klan Æsir', 'a member of the Æsir clan'),
    'Nordic|Vanir': _Bi('anggota klan Vanir', 'a member of the Vanir clan'),
    'Nordic|Jotun': _Bi('seorang Jötun (raksasa)', 'a Jötun (giant)'),
    'Nordic|Creature': _Bi('makhluk mitologi Nordik', 'a Norse mythological being'),
    'Nordic|Special': _Bi('tokoh khusus Nordik', 'a special Norse figure'),
    'Hindu|Trimurti': _Bi('bagian dari Trimurti, tiga dewa tertinggi', 'part of the Trimurti, the three supreme gods'),
    'Hindu|Tridevi': _Bi('bagian dari Tridevi, tiga dewi agung', 'part of the Tridevi, the three great goddesses'),
    'Hindu|Avatar': _Bi('avatar Vishnu', 'an avatar of Vishnu'),
    'Hindu|Devas': _Bi('seorang Deva', 'a Deva'),
    'Hindu|Figures': _Bi('tokoh penting dalam mitologi Hindu', 'a significant figure in Hindu mythology'),
  };

  static _Bi _roleOf(Combatant g) =>
      _roleLabel['${g.mythology}|${g.category}'] ??
      const _Bi('sosok dalam mitologi', 'a mythological figure');

  // ─── Canonical matchups drawn directly from attested myths. When both
  // gods in a fight match one of these pairs, the outcome always follows
  // the myth (requirement: results must not contradict established lore).
  static final List<_CanonicalMatch> _canonical = [
    _CanonicalMatch('Greek', 'Heracles', 'Hydra', 0.93,
        _Bi('Heracles membakar setiap luka setelah memenggal kepala Hydra, mencegah kepala baru tumbuh — salah satu dari Dua Belas Tugasnya yang paling terkenal.',
            'Heracles cauterized each stump after beheading the Hydra, preventing new heads from regrowing — one of his most famous Twelve Labors.')),
    _CanonicalMatch('Greek', 'Heracles', 'Cerberus', 0.90,
        _Bi('Sebagai tugas terakhir dan tersulit, Heracles menaklukkan dan membawa Cerberus hidup-hidup dari Dunia Bawah hanya dengan kekuatan tangan kosong.',
            "As his final and hardest labor, Heracles subdued and carried Cerberus alive out of the Underworld using nothing but his bare hands.")),
    _CanonicalMatch('Greek', 'Perseus', 'Medusa', 0.92,
        _Bi('Berbekal perisai cermin Athena dan sandal bersayap Hermes, Perseus memenggal kepala Medusa tanpa pernah menatap matanya langsung.',
            "Armed with Athena's mirrored shield and Hermes's winged sandals, Perseus beheaded Medusa without ever meeting her petrifying gaze.")),
    _CanonicalMatch('Greek', 'Theseus', 'Minotaur', 0.90,
        _Bi('Berbekal benang dari Ariadne untuk menandai jalan, Theseus berhasil membunuh Minotaur di jantung Labirin Kreta.',
            "Guided by Ariadne's thread to mark his path, Theseus slew the Minotaur at the heart of the Cretan Labyrinth.")),
    _CanonicalMatch('Greek', 'Odysseus', 'Cyclops', 0.85,
        _Bi('Odysseus mengelabui dan membutakan Kiklops Polyphemus dengan tiang kayu terbakar, lalu meloloskan diri bersama anak buahnya.',
            'Odysseus tricked and blinded the Cyclops Polyphemus with a burning wooden stake, then escaped with his surviving crew.')),
    _CanonicalMatch('Greek', 'Odysseus', 'Sirens', 0.80,
        _Bi('Dengan menyumbat telinga awaknya dan mengikat dirinya ke tiang kapal, Odysseus mendengar nyanyian Sirene tanpa binasa — satu-satunya yang selamat dari godaan itu.',
            "By plugging his crew's ears and binding himself to the mast, Odysseus survived the Sirens' song — the only man ever to hear it and live.")),
    _CanonicalMatch('Greek', 'Zeus', 'Cronus', 0.92,
        _Bi('Zeus memimpin Titanomakhia selama 10 tahun dan akhirnya menggulingkan ayahnya, Kronos, memenjarakannya di Tartarus selamanya.',
            'Zeus led the ten-year Titanomachy and ultimately overthrew his father Cronus, imprisoning him in Tartarus forever.')),
    _CanonicalMatch('Greek', 'Zeus', 'Atlas', 0.88,
        _Bi('Setelah kekalahan para Titan, Zeus menghukum Atlas untuk memikul langit di pundaknya selamanya — bukti kekuasaan Zeus yang tak terbantahkan.',
            "After the Titans' defeat, Zeus condemned Atlas to bear the sky upon his shoulders forever — undeniable proof of Zeus's supreme authority.")),
    _CanonicalMatch('Greek', 'Athena', 'Ares', 0.82,
        _Bi('Dalam Iliad, Athena berulang kali mengalahkan Ares secara langsung di medan perang, membuktikan strategi mengungguli kebrutalan semata.',
            'In the Iliad, Athena repeatedly bests Ares directly on the battlefield, proving that strategy triumphs over brute savagery alone.')),
    _CanonicalMatch('Egyptian', 'Horus', 'Seth', 0.85,
        _Bi("Setelah perselisihan panjang di hadapan para dewa (Contendings of Horus and Seth), Horus akhirnya dinyatakan sebagai pewaris sah takhta Mesir.",
            'After a long divine tribunal (the Contendings of Horus and Seth), Horus was ultimately declared the rightful heir to the throne of Egypt.')),
    _CanonicalMatch('Egyptian', 'Seth', 'Osiris', 0.85,
        _Bi('Set membunuh dan mencabik tubuh saudaranya sendiri, Osiris, demi merebut takhta — kemenangan kelam yang menjadi inti mitos kematian dan kebangkitan Mesir.',
            "Seth murdered and dismembered his own brother Osiris to seize the throne — a dark victory at the heart of Egypt's death-and-rebirth myth.")),
    _CanonicalMatch('Egyptian', 'Ra', 'Apep', 0.88,
        _Bi('Setiap malam, Ra dan pengiringnya bertarung melawan Apep di kegelapan Duat — dan setiap fajar membuktikan Ra selalu menang, memungkinkan matahari terbit kembali.',
            "Every night, Ra and his retinue battle Apep through the darkness of the Duat — and every dawn proves Ra's victory, letting the sun rise anew.")),
    _CanonicalMatch('Egyptian', 'Isis', 'Seth', 0.78,
        _Bi('Kecerdikan dan sihir Isis berulang kali mengungguli Set — ia berhasil menghidupkan kembali Osiris dan melindungi Horus hingga dewasa meski dikejar-kejar Set.',
            "Isis's cunning and magic repeatedly outmatched Seth — she revived Osiris and protected Horus into adulthood despite being hunted by Seth.")),
    _CanonicalMatch('Nordic', 'Thor', 'Jörmungandr', 0.85,
        _Bi('Di Ragnarök, Thor akhirnya membunuh Jörmungandr sang Ular Dunia dengan pukulan Mjolnir yang mematikan, meski ia sendiri gugur sembilan langkah kemudian akibat bisa sang ular.',
            'At Ragnarök, Thor finally slays Jörmungandr the World Serpent with a fatal blow from Mjolnir, though he himself dies nine steps later from its venom.')),
    _CanonicalMatch('Nordic', 'Thor', 'Hrungnir', 0.85,
        _Bi('Dalam duel raksasa, Mjolnir milik Thor menghancurkan kepala batu Hrungnir, meski pecahannya tertanam selamanya di kepala Thor.',
            "In their giant duel, Thor's Mjolnir shattered Hrungnir's stone head, though a fragment remained lodged in Thor's skull forever.")),
    _CanonicalMatch('Nordic', 'Fenrir', 'Odin', 0.85,
        _Bi('Sesuai ramalan, di Ragnarök serigala raksasa Fenrir akhirnya lepas dari rantainya dan menelan Odin sang Bapak Semua.',
            'As prophesied, at Ragnarök the giant wolf Fenrir finally breaks free of his chains and devours Odin the All-Father.')),
    _CanonicalMatch('Nordic', 'Vidar', 'Fenrir', 0.83,
        _Bi('Untuk membalas kematian ayahnya, Vidar merobek rahang Fenrir dengan sepatu khususnya yang dibuat dari sisa kulit sepanjang zaman.',
            "To avenge his father's death, Vidar tears apart Fenrir's jaws with his special boot, crafted from leather scraps gathered since the dawn of time.")),
    _CanonicalMatch('Nordic', 'Surtr', 'Freyr', 0.80,
        _Bi('Setelah menyerahkan pedang saktinya demi cinta, Freyr bertarung tanpa senjata terkuatnya melawan Surtr di Ragnarök dan akhirnya kalah.',
            "Having given up his magic sword for love, Freyr fights without his strongest weapon against Surtr at Ragnarök and ultimately falls.")),
    _CanonicalMatch('Nordic', 'Loki', 'Baldur', 0.80,
        _Bi('Loki mengelabui dewa buta Hodr untuk melemparkan anak panah bermata mistletoe — satu-satunya benda yang bisa melukai Baldur — dan berhasil membunuhnya.',
            'Loki tricked the blind god Hodr into throwing a mistletoe-tipped dart — the only thing capable of harming Baldur — successfully killing him.')),
    _CanonicalMatch('Hindu', 'Rama', 'Ravana', 0.92,
        _Bi('Setelah pertempuran epik di Lanka, Rama membunuh Ravana dengan Brahmastra, menyelamatkan Sita dan mengakhiri tirani raja iblis berkepala sepuluh itu.',
            "After an epic battle at Lanka, Rama slew Ravana with the Brahmastra, rescuing Sita and ending the ten-headed demon king's tyranny.")),
    _CanonicalMatch('Hindu', 'Durga', 'Asura', 0.90,
        _Bi('Durga diciptakan khusus dari energi gabungan para dewa untuk mengalahkan Mahishasura, iblis kerbau yang tak bisa dibunuh pria manapun — dan ia berhasil.',
            'Durga was created specifically from the combined energy of the gods to defeat the buffalo-demon Mahishasura, who could not be slain by any man — and she succeeded.')),
    _CanonicalMatch('Hindu', 'Kali', 'Asura', 0.88,
        _Bi('Kali lahir dari dahi Durga untuk melahap iblis Raktabija, meminum darahnya sebelum sempat menyentuh tanah dan berlipat ganda.',
            "Kali was born from Durga's brow to devour the demon Raktabija, drinking his blood before it could touch the ground and multiply him.")),
    _CanonicalMatch('Hindu', 'Narasimha', 'Asura', 0.90,
        _Bi('Narasimha membunuh raja iblis Hiranyakashipu yang tak bisa dibunuh manusia atau hewan — dengan wujud manusia-singa di ambang pintu saat senja.',
            'Narasimha slew the demon king Hiranyakashipu, who could not be killed by man or beast, by taking a man-lion form at a threshold at twilight.')),
    _CanonicalMatch('Hindu', 'Vishnu', 'Asura', 0.87,
        _Bi('Melalui berbagai avatarnya, Vishnu berulang kali turun untuk mengalahkan para Asura yang mengancam keseimbangan kosmis.',
            "Through his many avatars, Vishnu repeatedly descends to defeat the Asuras who threaten cosmic balance.")),
    _CanonicalMatch('Hindu', 'Indra', 'Asura', 0.78,
        _Bi('Sebagai raja para Deva, Indra memimpin langsung pasukan dewa dalam perang abadi melawan para Asura.',
            'As king of the Devas, Indra personally leads the gods\' forces in their eternal war against the Asuras.')),
    _CanonicalMatch('Hindu', 'Garuda', 'Naga', 0.85,
        _Bi('Garuda adalah musuh bebuyutan sekaligus pemangsa alami para Naga sejak lahir, permusuhan abadi dalam mitologi Hindu.',
            'Garuda has been the eternal enemy and natural predator of the Nagas since birth — an ancient rivalry in Hindu mythology.')),
  ];

  static _CanonicalMatch? _findCanonical(Combatant a, Combatant b) {
    for (final m in _canonical) {
      if (m.mythology != a.mythology) continue;
      if ((m.winnerName == a.name && m.loserName == b.name) ||
          (m.winnerName == b.name && m.loserName == a.name)) {
        return m;
      }
    }
    return null;
  }

  // ─── Dramatic framing text ──────────────────────────────────
  // A small deterministic pool of openers/closers. Picking is based on a
  // hash of the two names, so the same pairing always reads the same way
  // on rematch, but different pairings get visual variety.

  static const List<_Bi> _openers = [
    _Bi('Gemuruh pertempuran menggema saat {w} berhadapan langsung dengan {l}.',
        'A thunderous clash erupts as {w} stands face to face with {l}.'),
    _Bi('Langit seakan menahan napas ketika {w} dan {l} saling berhadapan dalam duel yang menentukan.',
        'The very heavens seem to hold their breath as {w} and {l} meet in a defining duel.'),
    _Bi('Kekuatan purba bangkit saat {w} melangkah maju untuk menghadapi {l}.',
        'Ancient power stirs as {w} steps forward to confront {l}.'),
    _Bi('Pertarungan yang telah lama dinanti akhirnya pecah antara {w} dan {l}.',
        'A long-awaited reckoning finally erupts between {w} and {l}.'),
    _Bi('Dua kekuatan agung bertemu di medan pertempuran: {w} melawan {l}.',
        'Two great powers collide upon the battlefield: {w} against {l}.'),
    _Bi('Bumi bergetar dan udara memanas saat {w} mengunci pandangan dengan {l}.',
        'The ground trembles and the air grows hot as {w} locks eyes with {l}.'),
  ];

  static _Bi _pickOpener(Combatant winner, Combatant loser) {
    final idx = (winner.name.hashCode ^ loser.name.hashCode).abs() % _openers.length;
    final t = _openers[idx];
    return _Bi(
      t.id.replaceAll('{w}', winner.name).replaceAll('{l}', loser.name),
      t.en.replaceAll('{w}', winner.name).replaceAll('{l}', loser.name),
    );
  }

  static _Bi _confidenceFlourish(double prob) {
    final pct = (prob * 100).round();
    if (pct >= 88) {
      return _Bi(
          'Hasilnya nyaris tanpa keraguan — sebuah kemenangan yang telah tertulis sejak awal, dengan peluang menang sebesar $pct%.',
          "The outcome is almost beyond doubt — a victory written since the dawn of the myth, with a $pct% chance of triumph.");
    } else if (pct >= 75) {
      return _Bi(
          'Sebuah kemenangan gemilang, diraih dengan keunggulan yang meyakinkan — peluang menang $pct%.',
          'A resounding victory, secured with commanding advantage — a $pct% chance of triumph.');
    } else if (pct >= 60) {
      return _Bi(
          'Kemenangan yang diperjuangkan dengan susah payah, bukan tanpa perlawanan sengit dari sang lawan — peluang menang $pct%.',
          "A hard-won victory, not without fierce resistance from the opponent — a $pct% chance of triumph.");
    } else {
      return _Bi(
          'Kemenangan yang nyaris berbalik arah — hanya keunggulan tipis yang memutus pertarungan sengit ini, peluang menang $pct%.',
          'A victory that nearly slipped away — only the narrowest of edges decided this fierce clash, a $pct% chance of triumph.');
    }
  }

  static BattleResult battle(Combatant a, Combatant b) {
    // 1) Canonical myth override — always follows the attested story.
    final canon = _findCanonical(a, b);
    if (canon != null) {
      final winner = canon.winnerName == a.name ? a : b;
      final loser = canon.winnerName == a.name ? b : a;
      final opener = _pickOpener(winner, loser);
      final flourish = _confidenceFlourish(canon.confidence);
      return BattleResult(
        winner: winner,
        loser: loser,
        winnerProbability: canon.confidence,
        explanationId:
            '${opener.id} ${canon.reason.id} ${flourish.id}',
        explanationEn:
            '${opener.en} ${canon.reason.en} ${flourish.en}',
        isCanonical: true,
        factors: _canonicalFactors(winner, loser, canon),
      );
    }

    // 2) Status tier.
    final tierA = _tierOf(a);
    final tierB = _tierOf(b);

    // 3) Power-domain counters.
    final domainsA = _domainsOf(a);
    final domainsB = _domainsOf(b);
    final counterAoverB = _counterDomain(domainsA, domainsB);
    final counterBoverA = _counterDomain(domainsB, domainsA);

    const domainBonus = 1.3;
    final adjA = tierA + (counterAoverB != null ? domainBonus : 0);
    final adjB = tierB + (counterBoverA != null ? domainBonus : 0);

    // Deterministic outcome: whoever has the higher combined status +
    // domain-counter score wins, full stop — no coin flip. The computed
    // percentage reflects how decisive that edge is, so it always matches
    // who actually won (and a rematch always gives the same result, as
    // befits a myth-grounded rather than luck-based system).
    final aWins = adjA >= adjB;
    final winnerProb = (0.5 + (adjA - adjB).abs() * 0.09).clamp(0.5, 0.94);
    final winner = aWins ? a : b;
    final loser = aWins ? b : a;
    final winnerTier = aWins ? tierA : tierB;
    final loserTier = aWins ? tierB : tierA;
    final winnerCounter = aWins ? counterAoverB : counterBoverA;

    final explanation = _generateExplanation(
      winner: winner,
      loser: loser,
      winnerTier: winnerTier,
      loserTier: loserTier,
      counterDomain: winnerCounter,
      winnerProb: winnerProb,
    );

    return BattleResult(
      winner: winner,
      loser: loser,
      winnerProbability: winnerProb,
      explanationId: explanation.id,
      explanationEn: explanation.en,
      isCanonical: false,
      factors: _computedFactors(
        winner: winner,
        loser: loser,
        winnerTier: winnerTier,
        loserTier: loserTier,
        counterDomain: winnerCounter,
      ),
    );
  }

  // ─── Structured "why" factors ───────────────────────────────
  static List<BattleFactor> _canonicalFactors(
      Combatant winner, Combatant loser, _CanonicalMatch canon) {
    return [
      BattleFactor(
        kind: 'myth',
        titleId: 'Tercatat dalam Mitologi',
        titleEn: 'Attested in Myth',
        descId:
            'Kisah asli mencatat ${winner.name} mengalahkan ${loser.name} — hasil ini mengikuti sumber mitologi, bukan sekadar hitungan kekuatan.',
        descEn:
            'The original tales record ${winner.name} defeating ${loser.name} — this outcome follows the myth itself, not mere power math.',
      ),
    ];
  }

  static List<BattleFactor> _computedFactors({
    required Combatant winner,
    required Combatant loser,
    required double winnerTier,
    required double loserTier,
    required String? counterDomain,
  }) {
    final factors = <BattleFactor>[];
    final gap = winnerTier - loserTier;
    final winnerRole = _roleOf(winner);
    final loserRole = _roleOf(loser);

    // A pop-culture combatant's signature game/story feat is the headline
    // reason behind their win.
    if (winner.combatLoreId != null && winner.combatLoreEn != null) {
      factors.add(BattleFactor(
        kind: 'myth',
        titleId: 'Legenda Pop Culture',
        titleEn: 'Pop Culture Legend',
        descId: winner.combatLoreId!,
        descEn: winner.combatLoreEn!,
      ));
    }

    if (counterDomain != null) {
      final label = _domainLabel[counterDomain]!;
      factors.add(BattleFactor(
        kind: 'domain',
        titleId: 'Keunggulan Elemental',
        titleEn: 'Elemental Advantage',
        descId:
            'Penguasaan ${label.id} oleh ${winner.name} menjadi penangkal alami bagi kekuatan ${loser.name} dalam pertarungan ini.',
        descEn:
            "${winner.name}'s command of ${label.en} is a natural counter to ${loser.name}'s powers in this clash.",
      ));
    }

    if (gap > 2.5) {
      factors.add(BattleFactor(
        kind: 'status',
        titleId: 'Status Jauh Lebih Tinggi',
        titleEn: 'Far Higher Standing',
        descId:
            'Sebagai ${winnerRole.id}, kedudukan ${winner.name} jauh mengungguli ${loser.name} (${loserRole.id}).',
        descEn:
            'As ${winnerRole.en}, ${winner.name} vastly outranks ${loser.name} (${loserRole.en}).',
      ));
    } else if (gap > 1.0) {
      factors.add(BattleFactor(
        kind: 'status',
        titleId: 'Keunggulan Status',
        titleEn: 'Status Edge',
        descId:
            '${winner.name} (${winnerRole.id}) memiliki kedudukan dan pengalaman bertarung lebih tinggi dari ${loser.name} (${loserRole.id}).',
        descEn:
            '${winner.name} (${winnerRole.en}) holds a higher standing and battle experience than ${loser.name} (${loserRole.en}).',
      ));
    } else {
      factors.add(BattleFactor(
        kind: 'balance',
        titleId: 'Pertarungan Nyaris Berimbang',
        titleEn: 'A Near-Even Match',
        descId:
            '${winner.name} dan ${loser.name} hampir setara — hanya selisih tipis dari status dan kekuatan yang menentukan pemenang.',
        descEn:
            '${winner.name} and ${loser.name} are nearly equal — only a razor-thin edge in status and power decided the winner.',
      ));
    }

    return factors;
  }

  static _Bi _generateExplanation({
    required Combatant winner,
    required Combatant loser,
    required double winnerTier,
    required double loserTier,
    required String? counterDomain,
    required double winnerProb,
  }) {
    final tierGap = winnerTier - loserTier;
    final opener = _pickOpener(winner, loser);
    final flourish = _confidenceFlourish(winnerProb);
    final winnerRole = _roleOf(winner);
    final loserRole = _roleOf(loser);
    final winnerPower = winner.powers.isNotEmpty ? winner.powers.first : winner.title;
    final winnerPowerEn = winner.powersEn.isNotEmpty ? winner.powersEn.first : winner.titleEn;
    final loserPower = loser.powers.isNotEmpty ? loser.powers.first : loser.title;
    final loserPowerEn = loser.powersEn.isNotEmpty ? loser.powersEn.first : loser.titleEn;

    final idBuf = StringBuffer('${opener.id} ');
    final enBuf = StringBuffer('${opener.en} ');

    if (counterDomain != null) {
      final label = _domainLabel[counterDomain]!;
      idBuf.write(
          'Di sinilah kunci pertarungan ini: kekuatan ${label.id} yang dikuasai ${winner.name} — terutama lewat kemampuan "$winnerPower" — secara alami menemukan celah pada kemampuan "$loserPower" milik ${loser.name}, sebuah keunggulan elemental yang telah terbukti berulang kali dalam kisah-kisah mitologi. ');
      enBuf.write(
          "Here lies the key to this clash: ${winner.name}'s command of ${label.en} — channeled through \"$winnerPowerEn\" — naturally exposes a weakness in ${loser.name}'s \"$loserPowerEn\", an elemental edge proven time and again across the myths. ");
    }

    if (tierGap > 2.5) {
      idBuf.write(
          'Sebagai ${winnerRole.id}, wibawa dan kekuasaan ${winner.name} jauh melampaui ${loser.name} yang hanya berkedudukan sebagai ${loserRole.id} — sebuah jurang kekuatan yang hampir mustahil dijembatani. ');
      enBuf.write(
          "As ${winnerRole.en}, ${winner.name}'s authority and power tower over ${loser.name}, who stands merely as ${loserRole.en} — a gulf in strength almost impossible to bridge. ");
    } else if (tierGap > 1.0) {
      idBuf.write(
          '${winner.name}, ${winnerRole.id}, membawa status dan jam terbang pertempuran yang lebih tinggi dibanding ${loser.name} yang berkedudukan sebagai ${loserRole.id} — pengalaman yang akhirnya menentukan arah pertarungan. ');
      enBuf.write(
          '${winner.name}, ${winnerRole.en}, carries a higher standing and battle experience than ${loser.name}, who stands as ${loserRole.en} — experience that ultimately tips the scales. ');
    } else {
      idBuf.write(
          'Keduanya sesungguhnya sepadan — ${winner.name} (${winnerRole.id}) dan ${loser.name} (${loserRole.id}) sama-sama layak menang, membuat pertarungan ini goyah hingga detik terakhir. ');
      enBuf.write(
          "The two are truly evenly matched — ${winner.name} (${winnerRole.en}) and ${loser.name} (${loserRole.en}) both deserved to win, keeping this fight in the balance until the very last moment. ");
    }

    idBuf.write(flourish.id);
    enBuf.write(flourish.en);

    return _Bi(idBuf.toString(), enBuf.toString());
  }
}

class _CanonicalMatch {
  final String mythology;
  final String winnerName;
  final String loserName;
  final double confidence;
  final _Bi reason;

  const _CanonicalMatch(
      this.mythology, this.winnerName, this.loserName, this.confidence, this.reason);
}
