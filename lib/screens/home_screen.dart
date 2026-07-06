import 'package:flutter/material.dart';
import '../models/god_model.dart';
import '../data/gods_data.dart';
import '../widgets/god_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<God> _allGods;
  List<God> _filteredGods = [];
  final TextEditingController _searchController = TextEditingController();
  String _selectedMythology = 'All';

  static const _mythologies = ['All', 'Greek', 'Egyptian', 'Nordic', 'Hindu'];

  @override
  void initState() {
    super.initState();
    _allGods = List.from(godsData);
    _filteredGods = List.from(godsData);
    _searchController.addListener(_applyFilters);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    setState(() {
      final q = _searchController.text.toLowerCase();
      _filteredGods = _allGods.where((g) {
        final matchQ = q.isEmpty ||
            g.name.toLowerCase().contains(q) ||
            g.title.toLowerCase().contains(q) ||
            g.powers.any((p) => p.toLowerCase().contains(q));
        final matchM =
            _selectedMythology == 'All' || g.mythology == _selectedMythology;
        return matchQ && matchM;
      }).toList();
    });
  }

  void _selectMythology(String m) {
    setState(() => _selectedMythology = m);
    _applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050812),
      body: Stack(
        children: [
          const Positioned.fill(child: _Starfield()),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildSearchBar(),
                _buildFilterChips(),
                _buildResultCount(),
                Expanded(child: _buildList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFFFD700), Color(0xFFFFC107), Color(0xFFFFAB00)],
                ).createShader(bounds),
                child: const Text(
                  'MYTHOPEDIA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text('✨', style: TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 3),
          const Text(
            'Jelajahi mitologi dunia',
            style: TextStyle(
              color: Color(0xFF4B5870),
              fontSize: 12.5,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0D1528),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF1E2D4A)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x22000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Cari nama dewa, kekuatan...',
            hintStyle: const TextStyle(color: Color(0xFF3D4F68), fontSize: 14),
            prefixIcon: const Icon(Icons.search_rounded,
                color: Color(0xFFFFC107), size: 20),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.close_rounded,
                        color: Color(0xFF3D4F68), size: 18),
                    onPressed: () => _searchController.clear(),
                  )
                : null,
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        itemCount: _mythologies.length,
        itemBuilder: (_, i) {
          final m = _mythologies[i];
          final selected = m == _selectedMythology;
          final color = m == 'All'
              ? const Color(0xFFFFC107)
              : GodCard.mythologyColor(m);
          return GestureDetector(
            onTap: () => _selectMythology(m),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: selected ? color.withValues(alpha: 0.18) : const Color(0xFF0D1528),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected ? color : const Color(0xFF1E2D4A),
                  width: selected ? 1.5 : 1,
                ),
              ),
              child: Text(
                m,
                style: TextStyle(
                  color: selected ? color : const Color(0xFF4B5870),
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResultCount() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Text(
        '${_filteredGods.length} dewa',
        style: const TextStyle(color: Color(0xFF2E3D55), fontSize: 11),
      ),
    );
  }

  Widget _buildList() {
    if (_filteredGods.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🔮', style: TextStyle(fontSize: 48)),
            SizedBox(height: 14),
            Text('Tidak ada dewa ditemukan',
                style: TextStyle(color: Color(0xFF3D4F68), fontSize: 15)),
            SizedBox(height: 6),
            Text('Coba kata kunci lain',
                style: TextStyle(color: Color(0xFF2E3D55), fontSize: 13)),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: _filteredGods.length,
      itemBuilder: (_, i) => GodCard(
        god: _filteredGods[i],
        onReturn: () => setState(() {}),
      ),
    );
  }
}

// ─── Starfield background ───────────────────────────────────────────────────

class _Starfield extends StatelessWidget {
  const _Starfield();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _StarPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _StarPainter extends CustomPainter {
  // x%, y%, radius, opacity
  static const _stars = [
    [0.03, 0.05, 1.0, 0.70], [0.12, 0.10, 1.5, 0.40], [0.24, 0.07, 0.8, 0.80],
    [0.36, 0.03, 1.2, 0.60], [0.47, 0.11, 1.0, 0.45], [0.59, 0.06, 1.5, 0.85],
    [0.68, 0.09, 0.8, 0.40], [0.80, 0.04, 1.0, 0.65], [0.91, 0.12, 1.3, 0.50],
    [0.07, 0.18, 1.2, 0.45], [0.19, 0.22, 0.8, 0.75], [0.31, 0.16, 1.5, 0.35],
    [0.43, 0.20, 1.0, 0.65], [0.55, 0.14, 0.8, 0.50], [0.64, 0.24, 1.2, 0.80],
    [0.75, 0.17, 1.0, 0.55], [0.87, 0.21, 1.5, 0.35], [0.97, 0.15, 0.8, 0.65],
    [0.02, 0.30, 0.8, 0.55], [0.14, 0.35, 1.2, 0.45], [0.26, 0.28, 1.5, 0.75],
    [0.38, 0.33, 0.8, 0.40], [0.50, 0.29, 1.0, 0.65], [0.62, 0.36, 1.2, 0.50],
    [0.73, 0.31, 0.8, 0.80], [0.84, 0.27, 1.5, 0.35], [0.95, 0.34, 1.0, 0.55],
    [0.06, 0.42, 1.5, 0.35], [0.17, 0.46, 0.8, 0.70], [0.29, 0.40, 1.0, 0.50],
    [0.41, 0.44, 1.2, 0.65], [0.53, 0.48, 0.8, 0.40], [0.66, 0.41, 1.5, 0.55],
    [0.78, 0.45, 1.0, 0.45], [0.89, 0.43, 0.8, 0.75], [0.98, 0.49, 1.2, 0.35],
    [0.04, 0.55, 1.0, 0.65], [0.16, 0.58, 1.5, 0.35], [0.27, 0.52, 0.8, 0.55],
    [0.39, 0.57, 1.0, 0.45], [0.52, 0.54, 1.2, 0.75], [0.63, 0.60, 0.8, 0.40],
    [0.75, 0.56, 1.5, 0.65], [0.86, 0.53, 1.0, 0.50], [0.96, 0.59, 0.8, 0.55],
    [0.08, 0.66, 1.2, 0.45], [0.20, 0.70, 0.8, 0.65], [0.32, 0.64, 1.5, 0.35],
    [0.44, 0.68, 1.0, 0.55], [0.56, 0.72, 0.8, 0.45], [0.67, 0.65, 1.2, 0.75],
    [0.79, 0.69, 1.0, 0.40], [0.90, 0.66, 1.5, 0.55], [0.99, 0.73, 0.8, 0.45],
    [0.03, 0.80, 0.8, 0.70], [0.15, 0.83, 1.5, 0.35], [0.27, 0.78, 1.0, 0.55],
    [0.40, 0.82, 0.8, 0.45], [0.52, 0.79, 1.2, 0.65], [0.64, 0.85, 1.0, 0.35],
    [0.76, 0.81, 1.5, 0.55], [0.88, 0.77, 0.8, 0.45], [0.97, 0.84, 1.0, 0.65],
    [0.10, 0.91, 1.2, 0.45], [0.22, 0.95, 0.8, 0.65], [0.35, 0.93, 1.5, 0.35],
    [0.48, 0.90, 1.0, 0.55], [0.61, 0.96, 0.8, 0.45], [0.72, 0.92, 1.2, 0.75],
    [0.83, 0.94, 1.0, 0.35], [0.93, 0.89, 1.5, 0.55],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (final s in _stars) {
      paint.color = Colors.white.withValues(alpha: s[3]);
      canvas.drawCircle(
        Offset(s[0] * size.width, s[1] * size.height),
        s[2],
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
