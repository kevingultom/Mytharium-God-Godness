import 'package:flutter/material.dart';
import '../data/gods_data.dart';
import '../widgets/god_card.dart';
import '../l10n/language_provider.dart';
import '../l10n/app_strings.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen>
    with SingleTickerProviderStateMixin {
  String? _expandedGodId;
  late final AnimationController _staggerCtrl;

  List get _bookmarkedGods =>
      godsData.where((g) => g.isBookmarked).toList();

  @override
  void initState() {
    super.initState();
    _staggerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _staggerCtrl.dispose();
    super.dispose();
  }

  Animation<double> _stagger(int index) {
    final count = _bookmarkedGods.length.clamp(1, 20);
    final start = (index / count).clamp(0.0, 1.0);
    final end = ((index + 1) / count).clamp(0.0, 1.0);
    return CurvedAnimation(
      parent: _staggerCtrl,
      curve: Interval(start, end, curve: Curves.easeOutCubic),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lang = LanguageProvider.of(context).value;
    final bookmarked = _bookmarkedGods;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
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
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Icon(Icons.bookmark_rounded,
                      color: Color(0xFFB07800), size: 20),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.get('bookmarks', lang),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            // Count
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(
                '${bookmarked.length} ${AppStrings.get("resultCount", lang)}',
                style: const TextStyle(color: Color(0xFFD1D5DB), fontSize: 11),
              ),
            ),
            // List
            Expanded(
              child: bookmarked.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.bookmark_border_rounded,
                              size: 48, color: Color(0xFF555555)),
                          const SizedBox(height: 14),
                          Text(
                            AppStrings.get('emptyBookmarks', lang),
                            style: const TextStyle(
                                color: Color(0xFF999999), fontSize: 15),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            AppStrings.get('emptyBookmarksSub', lang),
                            style: const TextStyle(
                                color: Color(0xFF555555), fontSize: 13),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      itemCount: bookmarked.length,
                      itemBuilder: (_, i) => GodCard(
                        god: bookmarked[i],
                        isExpanded: bookmarked[i].id == _expandedGodId,
                        entranceAnim: _stagger(i),
                        onToggle: () {
                          setState(() {
                            final tappedId = bookmarked[i].id;
                            _expandedGodId =
                                _expandedGodId == tappedId ? null : tappedId;
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
}
