import re

FILE = 'D:/mythopedia/lib/screens/quiz_result_screen.dart'

with open(FILE, 'r', encoding='utf-8') as f:
    content = f.read()

# In the file: 'chang\' followed by newline
# The \' escapes the closing quote, so Dart sees unterminated string
# Fix: replace with 'chang\'e' (escaped apostrophe in Dart)

# Find all broken chang entries
# File bytes: c h a n g \ ' (where \' is backslash + single-quote)
# In Python string: chang\\'
broken = re.findall(r"'chang\\\\'", content)
print(f"Broken chang entries: {len(broken)}")

# Replace each: 'chang\\' -> 'chang\\'e'
# In file: chang\' -> chang\'e
content2 = re.sub(r"'chang\\\\'(\s*,)", r"'chang\\'e'\1", content)

broken2 = re.findall(r"'chang\\\\'", content2)
print(f"After fix: {len(broken2)} remaining")

# Also check for any other broken apostrophe names
# Search for pattern: 'word\' (backslash before closing quote, not followed by more word chars)
broken_apost = re.findall(r"'[a-z]+\\\\'(?=[,\s])", content2)
print(f"Other broken apostrophes: {broken_apost}")

with open(FILE, 'w', encoding='utf-8') as f:
    f.write(content2)

print("Fixed!")
