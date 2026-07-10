import 'package:flutter/material.dart';
import '../models/god_model.dart';
import '../data/gods_data.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../services/bookmark_service.dart';

class CategoryGodListScreen extends StatefulWidget {
  final String mythology;
  final String category;
  final String titleLabel;

  const CategoryGodListScreen({
    super.key,
    required this.mythology,
    required this.category,
    required this.titleLabel,
  });

  @override
  State<CategoryGodListScreen> createState() => _CategoryGodListScreenState();
}

class _CategoryGodListScreenState extends State<CategoryGodListScreen>
    with SingleTickerProviderStateMixin {
  late List<God> _gods;
  String? _expandedGodId;
  late final AnimationController _staggerCtrl;

  @override
  void initState() {
    super.initState();
    _gods = godsData
        .where((g) => g.mythology == widget.mythology && g.category == widget.category)
        .toList();
    _staggerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final ids = await BookmarkService.load();
    for (final god in _gods) {
      god.isBookmarked = ids.contains(god.id);
    }
    if (mounted) setState(() {});
  }

  Animation<double> _stagger(int index) {
    final count = _gods.length.clamp(1, 20);
    final start = (index / count).clamp(0.0, 1.0);
    final end = ((index + 1) / count).clamp(0.0, 1.0);
    return CurvedAnimation(
      parent: _staggerCtrl,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _staggerCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final color = GodCard.mythologyColor(widget.mythology);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(color, lang),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                itemCount: _gods.length,
                itemBuilder: (_, i) => GodCard(
                  god: _gods[i],
                  isExpanded: _gods[i].id == _expandedGodId,
                  entranceAnim: _stagger(i),
                  onToggle: () {
                    setState(() {
                      final tappedId = _gods[i].id;
                      _expandedGodId = _expandedGodId == tappedId ? null : tappedId;
                    });
                  },
                  onReturn: () => setState(() {}),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color color, String lang) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 20, 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF333333)),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 16),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titleLabel,
                  style: GodCard.mythologyFont(
                    widget.mythology,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${widget.mythology} · ${_gods.length} ${lang == 'id' ? 'dewa' : 'gods'}',
                  style: TextStyle(color: color, fontSize: 11.5, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
