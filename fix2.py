import re

FILE = 'D:/mythopedia/lib/screens/quiz_result_screen.dart'

with open(FILE, 'r', encoding='utf-8') as f:
    content = f.read()

# File has: 'chang\'  (backslash before quote)
# In Python string after reading file, this is: chang\' (4 chars: c,h,a,n,g,\,')
# But Python repr shows it as: chang\\'
# We need: 'chang\'e'  in Dart = escaped apostrophe

# Simple: the literal string in the file is: chang\'
# We want to replace it with: chang\'e'
old = "chang\\'"
new = "chang\\'e'"

count = content.count(old)
print(f"Found broken chang entries: {count}")

content = content.replace(old, new)

count2 = content.count(old)
print(f"After fix: {count2} remaining")

with open(FILE, 'w', encoding='utf-8') as f:
    f.write(content)

print("Done!")
