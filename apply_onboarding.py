"""Apply all onboarding page 4-7 changes in one shot."""
FILE = 'D:/mythopedia/lib/screens/onboarding_screen.dart'

with open(FILE, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Choice pages title: fontSize 29→24, height 1.18→1.2
content = content.replace(
    """          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 29,
              fontWeight: FontWeight.w800,
              height: 1.18,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 12),
            Text(subtitle,
                style: const TextStyle(color: _muted, fontSize: 15, height: 1.4)),
          ],
          const SizedBox(height: 26),""",
    """          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(subtitle,
                style: const TextStyle(color: _muted, fontSize: 14, height: 1.4)),
          ],
          const SizedBox(height: 20),""")

# 2. Option tile: height 44, remove Column/sub, label fontSize 14
content = content.replace(
    """        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: selected ? _gold.withValues(alpha: 0.10) : _tileBg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected ? _gold : _tileBorder,
              width: selected ? 1.6 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.5,
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w600,
                      ),
                    ),
                    if (sub != null) ...[
                      const SizedBox(height: 3),
                      Text(sub,
                          style:
                              const TextStyle(color: _muted, fontSize: 12.5)),
                    ],
                  ],
                ),
              ),
              if (selected)
                const Icon(Icons.check_circle_rounded, color: _gold, size: 20),
            ],
          ),""",
    """        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: selected ? _gold.withValues(alpha: 0.10) : _tileBg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected ? _gold : _tileBorder,
              width: selected ? 1.6 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight:
                        selected ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
              ),
              if (selected)
                const Icon(Icons.check_circle_rounded, color: _gold, size: 18),
            ],
          ),""")

# 3. Summary row: height 44, remove vertical padding
content = content.replace(
    """  Widget _summaryRow(IconData icon, String label, String value, Color accent) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: _tileBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _tileBorder),
      ),""",
    """  Widget _summaryRow(IconData icon, String label, String value, Color accent) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: _tileBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _tileBorder),
      ),""")

# 4. Ready page: title 26, subtitle center 14, remove summary rows, bigger circle
content = content.replace(
    """          Text(
            'Your Archive Is Ready',
            textAlign: TextAlign.center,
            style: AppFonts.cinzel(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            entry != null
                ? 'You\u2019ve chosen ${entry.name} of ${_realm ?? ""} as your patron. Your journey begins now.'
                : 'Your journey begins now.',
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.white70, fontSize: 15, height: 1.55),
          ),
          const SizedBox(height: 28),
          _summaryRow(Icons.shield_rounded, 'Patron', entry?.name ?? '\u2014', accent),
          const SizedBox(height: 12),
          _summaryRow(Icons.public_rounded, 'Realm', _realm ?? '\u2014', accent),
          const SizedBox(height: 12),
          _summaryRow(Icons.schedule_rounded, 'Rhythm',
              _rhythm ?? 'When I Have Time', accent),
          const Spacer(flex: 2),""",
    """          Text(
            'Your Archive Is Ready',
            textAlign: TextAlign.center,
            style: AppFonts.cinzel(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            entry != null
                ? "You've chosen ${entry.name} of ${_realm ?? ''} as your patron. Your journey begins now."
                : 'Your journey begins now.',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white70, fontSize: 14, height: 1.4),
          ),
          const Spacer(flex: 2),""")

# 5. Bigger circle + center image
content = content.replace(
    """            Container(
              width: 108,
              height: 108,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: accent, width: 2),
                boxShadow: [
                  BoxShadow(color: accent.withValues(alpha: 0.35), blurRadius: 24),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                entry.imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (_, __, ___) => Container(
                  color: accent.withValues(alpha: 0.15),
                  child: Icon(Icons.shield_moon_rounded, color: accent, size: 40),
                ),
              ),
            )
          else
            Icon(Icons.verified_rounded, color: accent, size: 44),""",
    """            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: accent, width: 2.5),
                boxShadow: [
                  BoxShadow(color: accent.withValues(alpha: 0.35), blurRadius: 24),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                entry.imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (_, __, ___) => Container(
                  color: accent.withValues(alpha: 0.15),
                  child: Icon(Icons.shield_moon_rounded, color: accent, size: 48),
                ),
              ),
            )
          else
            Icon(Icons.verified_rounded, color: accent, size: 48),""")

with open(FILE, 'w', encoding='utf-8') as f:
    f.write(content)

print("All changes applied successfully")
