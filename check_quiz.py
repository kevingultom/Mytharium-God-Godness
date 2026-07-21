import re, os, glob

# 1. Extract all god names from matching maps in quiz_result_screen.dart
with open('lib/screens/quiz_result_screen.dart', 'r', encoding='utf-8') as f:
    content = f.read()

maps = ['_personalityMap', '_elementMap', '_favoriteMap', '_chineseZodiacMap']
map_gods = set()
for m in maps:
    pattern = rf'{m}\s*=\s*\{{(.*?)\}};'
    match = re.search(pattern, content, re.DOTALL)
    if match:
        block = match.group(1)
        names = re.findall(r"'([^']+)'", block)
        map_gods.update(n.lower() for n in names)

print(f'Unique gods in matching maps: {len(map_gods)}')

# 2. Extract all god names from data files
data_files = [
    'lib/data/greek_gods.dart',
    'lib/data/egyptian_gods.dart', 
    'lib/data/nordic_gods.dart',
    'lib/data/hindu_gods.dart',
    'lib/data/chinese_gods.dart',
    'lib/data/japanese_gods.dart',
]

all_gods = []
for fpath in data_files:
    if os.path.exists(fpath):
        with open(fpath, 'r', encoding='utf-8') as f:
            text = f.read()
        names = re.findall(r"name:\s*'([^']+)'", text)
        all_gods.extend(names)
        print(f'{os.path.basename(fpath)}: {len(names)} gods')

print(f'\nTotal gods in data: {len(all_gods)}')

# 3. Find gods NOT in any matching map
all_gods_lower = [n.lower() for n in all_gods]
not_in_maps = set(all_gods_lower) - map_gods
in_maps_not_in_data = map_gods - set(all_gods_lower)

print(f'\nGods in data but NOT in matching maps ({len(not_in_maps)}):')
for g in sorted(not_in_maps):
    print(f'  - {g}')

if in_maps_not_in_data:
    print(f'\nGods in maps but NOT in data ({len(in_maps_not_in_data)}):')
    for g in sorted(in_maps_not_in_data):
        print(f'  - {g}')
