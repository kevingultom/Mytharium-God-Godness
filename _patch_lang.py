#!/usr/bin/env python3
"""Batch replace ternary id/en patterns with localize() calls."""
import re
import os

BASE = "D:/mythopedia/lib"

def replace_ternaries(content):
    """Replace lang=='id' ? X : Y and id ? X : Y with localize(lang, X, Y)."""

    # Multi-line lang == 'id' ternaries first (before single-line)
    # Pattern: lang == 'id'\n                      ? 'text'\n                      : 'text'
    def replace_multiline_lang_id(m):
        before = m.group(1)
        x = m.group(2)
        y = m.group(3)
        return f"{before}localize(lang, {x}, {y})"

    content = re.sub(
        r"(lang == 'id')\s*\n\s*\?\s*('(?:[^'\\]|\\.)*')\s*\n\s*:\s*('(?:[^'\\]|\\.)*')",
        replace_multiline_lang_id,
        content
    )

    # Single-line lang == 'id' ? '...' : '...'
    content = re.sub(
        r"lang == 'id' \? ('(?:[^'\\]|\\.)*')\s*:\s*('(?:[^'\\]|\\.)*')",
        lambda m: f"localize(lang, {m.group(1)}, {m.group(2)})",
        content
    )

    # Single-line lang == 'id' ? "..." : "..."
    content = re.sub(
        r"""lang == 'id' \? ("(?:[^"\\]|\\.)*")\s*:\s*("(?:[^"\\]|\\.)*")""",
        lambda m: f'localize(lang, {m.group(1)}, {m.group(2)})',
        content
    )

    # Multi-line id ? 'text'\n                      : 'text'  (within statusText chain etc.)
    # These are nested ternaries like: id ? 'A' : id ? 'B' : 'C'
    # Handle the chain: (lang == 'id' ? 'A' : 'B') patterns that are part of larger ternary chains
    # Already handled above for lang == 'id'

    # Single-line id ? '...' : '...'
    content = re.sub(
        r"\bid \? ('(?:[^'\\]|\\.)*')\s*:\s*('(?:[^'\\]|\\.)*')",
        lambda m: f"localize(lang, {m.group(1)}, {m.group(2)})",
        content
    )

    # Single-line id ? "..." : "..."
    content = re.sub(
        r"""\bid \? ("(?:[^"\\]|\\.)*")\s*:\s*("(?:[^"\\]|\\.)*")""",
        lambda m: f'localize(lang, {m.group(1)}, {m.group(2)})',
        content
    )

    # lang == 'id' ? variable : variable  (e.g. titleId/titleEn)
    content = re.sub(
        r"lang == 'id' \? (\w+)\s*:\s*(\w+)",
        lambda m: f"localize(lang, {m.group(1)}, {m.group(2)})" if m.group(1) != m.group(2) else m.group(0),
        content
    )

    # id ? variable : variable
    content = re.sub(
        r"\bid \? (\w+)\s*:\s*(\w+)",
        lambda m: f"localize(lang, {m.group(1)}, {m.group(2)})" if m.group(1) != m.group(2) else m.group(0),
        content
    )

    return content

def ensure_import(content, file_path):
    """Ensure language_provider.dart is imported."""
    if 'language_provider.dart' in content:
        return content

    rel = '../l10n/language_provider.dart'
    lines = content.split('\n')
    last_import_idx = 0
    for i, line in enumerate(lines):
        if line.strip().startswith('import '):
            last_import_idx = i

    lines.insert(last_import_idx + 1, f"import '{rel}';")
    return '\n'.join(lines)

def remove_unused_id(content):
    """Remove 'final id = lang == 'id';' if 'id' is no longer used."""
    # Find the declaration
    match = re.search(r'^(\s*)final id = lang == \'id\';\s*$', content, re.MULTILINE)
    if not match:
        return content

    # Check if 'id' is used anywhere else
    # Remove the declaration line temporarily
    test = content[:match.start()] + content[match.end():]
    # Check for standalone 'id' usage (not as part of other words)
    # Look for: id ?, if (id), etc.
    if re.search(r'\bid\s*[?!)]|\bid\s*==\s*', test):
        return content  # id is still used, keep it

    # id is only used in ternaries (which we already replaced), remove it
    return content[:match.start()] + content[match.end():]

def process_file(file_path):
    """Process a single file."""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    original = content

    # Replace ternaries
    content = replace_ternaries(content)

    # Try to remove unused id variable
    content = remove_unused_id(content)

    # Add import if needed
    content = ensure_import(content, file_path)

    # Clean up double blank lines from removed declarations
    content = re.sub(r'\n{3,}', '\n\n', content)

    if content != original:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(content)
        return True
    return False

# Process all files
files = [
    f"{BASE}/screens/quiz_trivia_result_screen.dart",
    f"{BASE}/screens/history_story_detail_screen.dart",
    f"{BASE}/screens/god_battle_screen.dart",
    f"{BASE}/screens/quiz_trivia_screen.dart",
    f"{BASE}/screens/quiz_genre_screen.dart",
    f"{BASE}/screens/genre_stories_screen.dart",
    f"{BASE}/screens/main_shell.dart",
    f"{BASE}/screens/immersive_god_list_screen.dart",
    f"{BASE}/widgets/god_card.dart",
    f"{BASE}/models/quiz_question_model.dart",
    f"{BASE}/services/battle_engine.dart",
    f"{BASE}/screens/chinese_category_screen.dart",
    f"{BASE}/screens/codex_screen.dart",
    f"{BASE}/screens/egypt_category_screen.dart",
    f"{BASE}/screens/favorites_screen.dart",
    f"{BASE}/screens/greek_category_screen.dart",
    f"{BASE}/screens/help_screen.dart",
    f"{BASE}/screens/hindu_category_screen.dart",
    f"{BASE}/screens/japanese_category_screen.dart",
    f"{BASE}/screens/mythic_pop_culture_screen.dart",
    f"{BASE}/screens/my_myths_screen.dart",
    f"{BASE}/screens/nordic_category_screen.dart",
    f"{BASE}/screens/pop_culture_detail_screen.dart",
    f"{BASE}/screens/privacy_policy_screen.dart",
    f"{BASE}/screens/profile_screen.dart",
    f"{BASE}/screens/stories_screen.dart",
    f"{BASE}/screens/terms_of_service_screen.dart",
    f"{BASE}/widgets/random_god_dialog.dart",
    f"{BASE}/screens/about_screen.dart",
]

modified = 0
for f in files:
    if os.path.exists(f):
        if process_file(f):
            modified += 1
            print(f"OK {os.path.basename(f)}")
        else:
            print(f"-- {os.path.basename(f)} (no changes)")
    else:
        print(f"XX {os.path.basename(f)} (not found)")

print(f"\nModified: {modified}/{len(files)}")
