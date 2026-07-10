import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';
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

  Widget _buildSectionTitle(String id, String lang) {
    final labels = {
      'birthday': {'id': 'Tanggal Lahir', 'en': 'Birth Date'},
      'personality': {'id': 'Kepribadianmu', 'en': 'Your Personality'},
      'element': {'id': 'Elemen yang Kamu Sukai', 'en': 'Favorite Element'},
      'favorite': {
        'id': 'Hal Kesukaanmu (bisa pilih lebih dari satu)',
        'en': 'Your Favorite Things (pick more than one)',
      },
    };
    final map = labels[id];
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: Text(
        map?[lang] ?? id,
        style: GoogleFonts.cinzel(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: const Color(0xFFB07800),
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildChipSelector({
    required List<Map<String, String>> options,
    required String? selected,
    required ValueChanged<String> onSelected,
  }) {
    final lang = LanguageProvider.of(context).value;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((opt) {
        final isSelected = opt['id'] == selected;
        return GestureDetector(
          onTap: () => onSelected(opt['id']!),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFB07800)
                  : const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFFB07800)
                    : const Color(0xFF333333),
              ),
            ),
            child: Text(
              lang == 'en' ? (opt['labelEn'] ?? opt['label']!) : opt['label']!,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFFAAAAAA),
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMultiChipSelector({
    required List<Map<String, String>> options,
    required Set<String> selected,
    required ValueChanged<String> onToggle,
  }) {
    final lang = LanguageProvider.of(context).value;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((opt) {
        final isSelected = selected.contains(opt['id']);
        return GestureDetector(
          onTap: () => onToggle(opt['id']!),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFB07800)
                  : const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFFB07800)
                    : const Color(0xFF333333),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSelected) ...[
                  const Icon(Icons.check_rounded, color: Colors.white, size: 14),
                  const SizedBox(width: 4),
                ],
                Text(
                  lang == 'en' ? (opt['labelEn'] ?? opt['label']!) : opt['label']!,
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFFAAAAAA),
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
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
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: const Color(0xFF1A1A1A),
          style: const TextStyle(color: Colors.white, fontSize: 12),
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: Color(0xFFB07800), size: 16),
          hint: Text(hint,
              style: const TextStyle(color: Color(0xFF777777), fontSize: 11)),
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
    final quizTitle = lang == 'en' ? "What's Your God?" : 'Dewa Mana Kamu?';
    final quizSub = lang == 'en'
        ? 'Find out which ancient god matches your soul'
        : 'Temukan dewa kuno yang cocok dengan jiwamu';
    final findBtn = lang == 'en' ? 'FIND MY GOD' : 'CARI DEWAKU';

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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quizTitle,
                          style: GoogleFonts.cinzel(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          quizSub,
                          style: const TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 14),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Form
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // Birth Date
                  _buildSectionTitle('birthday', lang),
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
                          height: 38,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFF333333)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _birthMonth,
                              isExpanded: true,
                              dropdownColor: const Color(0xFF1A1A1A),
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                                  color: Color(0xFFB07800), size: 16),
                              hint: Text(
                                lang == 'en' ? 'Month' : 'Bulan',
                                style: const TextStyle(color: Color(0xFF777777), fontSize: 11),
                              ),
                              items: List.generate(12, (i) {
                                final num = '${i + 1}';
                                return DropdownMenuItem(
                                  value: num,
                                  child: Text(_monthNames[i], style: const TextStyle(fontSize: 12)),
                                );
                              }).toList(),
                              onChanged: (v) => setState(() => _birthMonth = v),
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
                  const SizedBox(height: 24),

                  // Personality
                  _buildSectionTitle('personality', lang),
                  _buildChipSelector(
                    options: _personalities,
                    selected: _personality,
                    onSelected: (v) => setState(() => _personality = v),
                  ),
                  const SizedBox(height: 24),

                  // Element
                  _buildSectionTitle('element', lang),
                  _buildChipSelector(
                    options: _elements,
                    selected: _element,
                    onSelected: (v) => setState(() => _element = v),
                  ),
                  const SizedBox(height: 24),

                  // Favorites
                  _buildSectionTitle('favorite', lang),
                  _buildMultiChipSelector(
                    options: _favorites,
                    selected: _selectedFavorites,
                    onToggle: (v) => setState(() {
                      if (_selectedFavorites.contains(v)) {
                        _selectedFavorites.remove(v);
                      } else {
                        _selectedFavorites.add(v);
                      }
                    }),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            // Find My God button
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              child: GestureDetector(
                onTap: _isComplete ? _findMyGod : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _isComplete
                        ? const Color(0xFFB07800)
                        : const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: _isComplete
                        ? [
                            BoxShadow(
                              color: const Color(0xFFB07800).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      findBtn,
                      style: GoogleFonts.cinzel(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color:
                            _isComplete ? Colors.white : const Color(0xFF666666),
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
