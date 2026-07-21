import 'package:flutter/material.dart';
import '../utils/app_fonts.dart';
import '../l10n/language_provider.dart';
import 'main_shell.dart';
import 'quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? _birthDay;
  String? _birthMonth;
  String? _birthYear;
  String? _personality;
  String? _element;
  final Set<String> _selectedFavorites = {};

  @override
  void initState() {
    super.initState();
    // Belt-and-suspenders alongside the caller's own reset (see
    // home_screen.dart) — whichever fires resets the same flag, so it's
    // safe for both to run.
    MainShell.quizActive.value = true;
  }

  @override
  void dispose() {
    MainShell.quizActive.value = false;
    super.dispose();
  }

  // ── Palette (shared mythic look) ──
  static const _gold = Color(0xFFB07800);
  static const _goldBright = Color(0xFFC9A227);
  static const _cream = Color(0xFFEDE4D3);
  static const _textShadow = [Shadow(color: Colors.black, blurRadius: 8)];

  final _monthNames = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
  ];

  static const _personalities = [
    {'id': 'brave',     'label': 'Pemberani',      'labelEn': 'Brave'},
    {'id': 'wise',      'label': 'Bijaksana',      'labelEn': 'Wise'},
    {'id': 'creative',  'label': 'Kreatif',        'labelEn': 'Creative'},
    {'id': 'calm',      'label': 'Tenang',         'labelEn': 'Calm'},
    {'id': 'passionate','label': 'Penuh Semangat',  'labelEn': 'Passionate'},
    {'id': 'mysterious','label': 'Misterius',       'labelEn': 'Mysterious'},
  ];

  static const _elements = [
    {'id': 'fire',      'label': 'Api',            'labelEn': 'Fire'},
    {'id': 'water',     'label': 'Air',            'labelEn': 'Water'},
    {'id': 'earth',     'label': 'Tanah',          'labelEn': 'Earth'},
    {'id': 'air',       'label': 'Udara',          'labelEn': 'Air'},
    {'id': 'lightning', 'label': 'Petir',          'labelEn': 'Lightning'},
    {'id': 'death',     'label': 'Kematian',       'labelEn': 'Death'},
    {'id': 'sun',       'label': 'Matahari',       'labelEn': 'Sun'},
    {'id': 'moon',      'label': 'Bulan',          'labelEn': 'Moon'},
  ];

  static const _favorites = [
    {'id': 'music',      'label': 'Musik',          'labelEn': 'Music'},
    {'id': 'war',        'label': 'Perang',         'labelEn': 'War'},
    {'id': 'knowledge',  'label': 'Pengetahuan',    'labelEn': 'Knowledge'},
    {'id': 'nature',     'label': 'Alam',           'labelEn': 'Nature'},
    {'id': 'beauty',     'label': 'Kecantikan',     'labelEn': 'Beauty'},
    {'id': 'adventure',  'label': 'Petualangan',    'labelEn': 'Adventure'},
    {'id': 'magic',      'label': 'Sihir',          'labelEn': 'Magic'},
    {'id': 'wealth',     'label': 'Kekayaan',       'labelEn': 'Wealth'},
    {'id': 'family',     'label': 'Keluarga',       'labelEn': 'Family'},
    {'id': 'justice',    'label': 'Keadilan',       'labelEn': 'Justice'},
    {'id': 'healing',    'label': 'Penyembuhan',    'labelEn': 'Healing'},
    {'id': 'protection', 'label': 'Perlindungan',   'labelEn': 'Protection'},
  ];

  // Thematic Material icons per trait (no emoji — avoids web font fetches).
  static const _personalityIcons = {
    'brave': Icons.shield_rounded,
    'wise': Icons.auto_stories_rounded,
    'creative': Icons.brush_rounded,
    'calm': Icons.spa_rounded,
    'passionate': Icons.favorite_rounded,
    'mysterious': Icons.visibility_off_rounded,
  };

  static const _elementIcons = {
    'fire': Icons.local_fire_department_rounded,
    'water': Icons.water_drop_rounded,
    'earth': Icons.terrain_rounded,
    'air': Icons.air_rounded,
    'lightning': Icons.bolt_rounded,
    'death': Icons.dark_mode_rounded,
    'sun': Icons.wb_sunny_rounded,
    'moon': Icons.nightlight_round,
  };

  static const _favoriteIcons = {
    'music': Icons.music_note_rounded,
    'war': Icons.gavel_rounded,
    'knowledge': Icons.menu_book_rounded,
    'nature': Icons.park_rounded,
    'beauty': Icons.auto_awesome_rounded,
    'adventure': Icons.explore_rounded,
    'magic': Icons.auto_fix_high_rounded,
    'wealth': Icons.diamond_rounded,
    'family': Icons.family_restroom_rounded,
    'justice': Icons.balance_rounded,
    'healing': Icons.healing_rounded,
    'protection': Icons.security_rounded,
  };

  bool get _isComplete =>
      _birthDay != null &&
      _birthMonth != null &&
      _birthYear != null &&
      _personality != null &&
      _element != null &&
      _selectedFavorites.isNotEmpty;

  String _zodiacSign(int month, int day) {
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 'aries';
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 'taurus';
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 'gemini';
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 'cancer';
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 'leo';
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 'virgo';
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 'libra';
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) return 'scorpio';
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) return 'sagittarius';
    if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) return 'capricorn';
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) return 'aquarius';
    return 'pisces';
  }

  void _findMyGod() {
    if (!_isComplete) return;
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => QuizResultScreen(
          zodiac: _zodiacSign(int.parse(_birthMonth!), int.parse(_birthDay!)),
          personality: _personality!,
          element: _element!,
          favorites: _selectedFavorites.toList(),
          birthYear: int.parse(_birthYear!),
        ),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  // ── Ornamental section header: gold icon + Cinzel label + fading rule ──
  Widget _sectionHeader(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14, top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: _goldBright, size: 17),
              const SizedBox(width: 9),
              Flexible(
                child: Text(
                  text.toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.cinzel(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 1.6,
                    shadows: _textShadow,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _sectionLabel(String id, String lang) {
    const labels = {
      'birthday': {'id': 'Tanggal Lahir', 'en': 'Birth Date'},
      'personality': {'id': 'Kepribadianmu', 'en': 'Your Personality'},
      'element': {'id': 'Elemen yang Kamu Sukai', 'en': 'Favorite Element'},
      'favorite': {
        'id': 'Hal Kesukaanmu (pilih beberapa)',
        'en': 'Your Favorite Things (pick a few)',
      },
    };
    return labels[id]?[lang] ?? id;
  }

  Widget _buildChipSelector({
    required List<Map<String, String>> options,
    required Map<String, IconData> icons,
    required String? selected,
    required ValueChanged<String> onSelected,
  }) {
    final lang = LanguageProvider.of(context).value;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((opt) {
        final id = opt['id']!;
        final isSelected = id == selected;
        return _chip(
          label: lang == 'en' ? (opt['labelEn'] ?? opt['label']!) : opt['label']!,
          icon: icons[id],
          isSelected: isSelected,
          showCheck: false,
          onTap: () => onSelected(id),
        );
      }).toList(),
    );
  }

  Widget _buildMultiChipSelector({
    required List<Map<String, String>> options,
    required Map<String, IconData> icons,
    required Set<String> selected,
    required ValueChanged<String> onToggle,
  }) {
    final lang = LanguageProvider.of(context).value;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((opt) {
        final id = opt['id']!;
        final isSelected = selected.contains(id);
        return _chip(
          label: lang == 'en' ? (opt['labelEn'] ?? opt['label']!) : opt['label']!,
          icon: icons[id],
          isSelected: isSelected,
          showCheck: true,
          onTap: () => onToggle(id),
        );
      }).toList(),
    );
  }

  Widget _chip({
    required String label,
    required IconData? icon,
    required bool isSelected,
    required bool showCheck,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? _gold : Colors.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? _goldBright : _gold.withValues(alpha: 0.32),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: _gold.withValues(alpha: 0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCheck && isSelected) ...[
              const Icon(Icons.check_rounded, color: Colors.white, size: 14),
              const SizedBox(width: 5),
            ] else if (icon != null) ...[
              Icon(icon,
                  color: isSelected ? Colors.white : _goldBright, size: 14),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : _cream,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required String hint,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _gold.withValues(alpha: 0.32)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: const Color(0xFF161210),
          style: const TextStyle(color: Colors.white, fontSize: 12),
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: _goldBright, size: 18),
          hint: Text(hint,
              style: const TextStyle(color: Color(0xFF9C927F), fontSize: 11)),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: const TextStyle(fontSize: 12)),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final quizTitle = lang == 'en' ? "What's Your God?" : 'Dewa Apa Dirimu?';
    final quizSub = lang == 'en'
        ? 'Answer the ancient signs and find the deity that mirrors your soul'
        : 'Jawab tanda-tanda kuno dan temukan dewa yang mencerminkan jiwamu';
    final findBtn = lang == 'en' ? 'REVEAL MY GOD' : 'UNGKAP DEWAKU';

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
                // Header — back link, then oracle-style title.
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
                      const SizedBox(height: 16),
                      Text(
                        quizTitle,
                        style: AppFonts.cinzel(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 10)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      _ornament(),
                      const SizedBox(height: 10),
                      Text(
                        quizSub,
                        style: const TextStyle(
                          color: _cream,
                          fontSize: 12,
                          height: 1.45,
                          shadows: _textShadow,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                // Form
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                    children: [
                      // Birth Date
                      _sectionHeader(
                          Icons.calendar_month_rounded, _sectionLabel('birthday', lang)),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: _buildDropdown(
                              value: _birthDay?.toString(),
                              items: List.generate(31, (i) => '${i + 1}'),
                              onChanged: (v) => setState(() => _birthDay = v),
                              hint: lang == 'en' ? 'Day' : 'Tanggal',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: _gold.withValues(alpha: 0.32)),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _birthMonth,
                                  isExpanded: true,
                                  dropdownColor: const Color(0xFF161210),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: _goldBright,
                                      size: 18),
                                  hint: Text(
                                    lang == 'en' ? 'Month' : 'Bulan',
                                    style: const TextStyle(
                                        color: Color(0xFF9C927F), fontSize: 11),
                                  ),
                                  items: List.generate(12, (i) {
                                    final num = '${i + 1}';
                                    return DropdownMenuItem(
                                      value: num,
                                      child: Text(_monthNames[i],
                                          style: const TextStyle(fontSize: 12)),
                                    );
                                  }).toList(),
                                  onChanged: (v) =>
                                      setState(() => _birthMonth = v),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: _buildDropdown(
                              value: _birthYear,
                              items: List.generate(50, (i) => '${2010 - i}'),
                              onChanged: (v) => setState(() => _birthYear = v),
                              hint: lang == 'en' ? 'Year' : 'Tahun',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 26),

                      // Personality
                      _sectionHeader(
                          Icons.psychology_rounded, _sectionLabel('personality', lang)),
                      _buildChipSelector(
                        options: _personalities,
                        icons: _personalityIcons,
                        selected: _personality,
                        onSelected: (v) => setState(() => _personality = v),
                      ),
                      const SizedBox(height: 26),

                      // Element
                      _sectionHeader(
                          Icons.whatshot_rounded, _sectionLabel('element', lang)),
                      _buildChipSelector(
                        options: _elements,
                        icons: _elementIcons,
                        selected: _element,
                        onSelected: (v) => setState(() => _element = v),
                      ),
                      const SizedBox(height: 26),

                      // Favorites
                      _sectionHeader(
                          Icons.favorite_rounded, _sectionLabel('favorite', lang)),
                      _buildMultiChipSelector(
                        options: _favorites,
                        icons: _favoriteIcons,
                        selected: _selectedFavorites,
                        onToggle: (v) => setState(() {
                          if (_selectedFavorites.contains(v)) {
                            _selectedFavorites.remove(v);
                          } else {
                            _selectedFavorites.add(v);
                          }
                        }),
                      ),
                      const SizedBox(height: 28),
                      // Reveal button — part of the scrollable form itself
                      // (not a fixed bar), so it's out of view until the
                      // user scrolls all the way down past every field, and
                      // stays disabled until the form is complete.
                      GestureDetector(
                        onTap: _isComplete ? _findMyGod : null,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: double.infinity,
                          height: 42,
                          decoration: BoxDecoration(
                            gradient: _isComplete
                                ? const LinearGradient(
                                    colors: [_goldBright, _gold],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            color: _isComplete
                                ? null
                                : Colors.black.withValues(alpha: 0.55),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: _isComplete
                                  ? _goldBright
                                  : _gold.withValues(alpha: 0.25),
                            ),
                            boxShadow: _isComplete
                                ? [
                                    BoxShadow(
                                      color: _gold.withValues(alpha: 0.45),
                                      blurRadius: 16,
                                      offset: const Offset(0, 5),
                                    ),
                                  ]
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            findBtn,
                            style: AppFonts.cinzel(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: _isComplete
                                  ? Colors.white
                                  : const Color(0xFF6B6355),
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
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

  // Thin gold rule with a centered spark — the app's recurring mythic divider.
  Widget _ornament() {
    return Row(
      children: [
        Container(width: 34, height: 1, color: _gold.withValues(alpha: 0.7)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 9),
          child: Icon(Icons.auto_awesome, color: _goldBright, size: 13),
        ),
        Expanded(child: Container(height: 1, color: _gold.withValues(alpha: 0.3))),
      ],
    );
  }
}
