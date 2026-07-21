import re, os

BASE = 'D:/mythopedia'

data_files = [
    f'{BASE}/lib/data/greek_gods.dart',
    f'{BASE}/lib/data/egyptian_gods.dart', 
    f'{BASE}/lib/data/nordic_gods.dart',
    f'{BASE}/lib/data/hindu_gods.dart',
    f'{BASE}/lib/data/chinese_gods.dart',
    f'{BASE}/lib/data/japanese_gods.dart',
]

cosmology_gods = set()
all_gods_info = []

for fpath in data_files:
    with open(fpath, 'r', encoding='utf-8') as f:
        text = f.read()
    
    blocks = re.split(r'God\(\s*id:', text)[1:]  # split on God( id:
    for block in blocks:
        name_m = re.search(r"name:\s*'([^']+)'", block)
        cat_m = re.search(r"category:\s*'([^']+)'", block)
        myth_m = re.search(r"mythology:\s*'([^']+)'", block)
        powers_m = re.search(r"powers:\s*\[(.*?)\]", block, re.DOTALL)
        powers_en_m = re.search(r"powersEn:\s*\[(.*?)\]", block, re.DOTALL)
        
        if name_m and cat_m:
            name = name_m.group(1)
            cat = cat_m.group(1)
            myth = myth_m.group(1) if myth_m else ''
            powers = []
            if powers_m:
                powers = [p.strip().strip("'\"") for p in powers_m.group(1).split(',') if p.strip().strip("'\"")]
            powers_en = []
            if powers_en_m:
                powers_en = [p.strip().strip("'\"") for p in powers_en_m.group(1).split(',') if p.strip().strip("'\"")]
            
            if cat == 'Cosmology':
                cosmology_gods.add(name.lower())
            
            all_gods_info.append({
                'name': name,
                'name_lower': name.lower(),
                'category': cat,
                'mythology': myth,
                'powers': powers,
                'powers_en': powers_en,
            })

print(f'Cosmology gods to exclude ({len(cosmology_gods)}):')
for g in sorted(cosmology_gods):
    print(f'  - {g}')

# Find non-cosmology gods not in maps
with open(f'{BASE}/lib/screens/quiz_result_screen.dart', 'r', encoding='utf-8') as f:
    content = f.read()

# Extract all god names from the 4 matching maps
# We need to be more careful - parse only inside the map value sets
map_pattern_names = set()
for map_name in ['_personalityMap', '_elementMap', '_favoriteMap', '_chineseZodiacMap']:
    start = content.find(f'{map_name} = {{')
    if start == -1:
        continue
    # Find the closing };
    depth = 0
    end = start
    for i in range(start, len(content)):
        if content[i] == '{':
            depth += 1
        elif content[i] == '}':
            depth -= 1
            if depth == 0:
                end = i
                break
    block = content[start:end+1]
    # Extract quoted strings that look like god names (not map keys)
    # Map keys are like 'brave': {...}, god names are inside the sets
    # God names appear as values in sets: {'zeus', 'ares', ...}
    # They also appear as map keys for _chineseZodiacMap
    names = re.findall(r"'([^']+)'", block)
    for n in names:
        map_pattern_names.add(n.lower())

# Filter out known non-god identifiers
non_god = {'brave','wise','creative','calm','passionate','mysterious',
    'fire','water','earth','air','lightning','death','sun','moon',
    'music','war','knowledge','nature','beauty','adventure','magic',
    'wealth','family','justice','healing','protection',
    'rat','ox','tiger','rabbit','dragon','snake','horse','goat','monkey','rooster','dog','pig'}
map_pattern_names -= non_god

missing = []
for g in all_gods_info:
    if g['name_lower'] not in map_pattern_names and g['category'] != 'Cosmology':
        missing.append(g)

print(f'\nNon-cosmology gods already in maps: {len([g for g in all_gods_info if g["name_lower"] in map_pattern_names and g["category"] != "Cosmology"])}')
print(f'Missing non-cosmology gods to add ({len(missing)}):')
for g in sorted(missing, key=lambda x: (x['mythology'], x['name'])):
    pe = ', '.join(g['powers_en'][:6]) if g['powers_en'] else '(none)'
    print(f"  {g['mythology']:10s} | {g['category']:15s} | {g['name']:35s} | {pe}")
