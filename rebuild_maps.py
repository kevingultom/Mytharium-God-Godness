"""Rebuild all 4 matching maps in quiz_result_screen.dart with ALL 299 non-cosmology gods."""
import re

FILE = 'D:/mythopedia/lib/screens/quiz_result_screen.dart'
DATA_FILES = [
    'D:/mythopedia/lib/data/greek_gods.dart',
    'D:/mythopedia/lib/data/egyptian_gods.dart',
    'D:/mythopedia/lib/data/nordic_gods.dart',
    'D:/mythopedia/lib/data/hindu_gods.dart',
    'D:/mythopedia/lib/data/chinese_gods.dart',
    'D:/mythopedia/lib/data/japanese_gods.dart',
]

# --- Step 1: Parse all gods ---
all_gods = {}
for fpath in DATA_FILES:
    with open(fpath, 'r', encoding='utf-8') as f:
        text = f.read()
    blocks = re.split(r'God\(\s*id:', text)[1:]
    for block in blocks:
        nm = re.search(r"name:\s*'([^']+)'", block)
        cm = re.search(r"category:\s*'([^']+)'", block)
        pm = re.search(r"powersEn:\s*\[(.*?)\]", block, re.DOTALL)
        if nm and cm:
            name = nm.group(1)
            cat = cm.group(1)
            powers = []
            if pm:
                powers = [p.strip().strip("'\"").lower() for p in pm.group(1).split(',') if p.strip().strip("'\"")]
            if cat != 'Cosmology':
                all_gods[name.lower()] = {'name': name, 'category': cat, 'powers': powers}

# --- Step 2: Auto-categorize ---
def kw_match(powers, kw_map):
    result = []
    for trait, keywords in kw_map.items():
        for p in powers:
            if any(k in p for k in keywords):
                result.append(trait)
                break
    return result

P_KW = {
    'brave': ['war','sword','combat','strength','martial','archery','defense','courage','heroism','valor','conquest','punishment','exorcism','demon','slaying','military','protector','guardian','tiger','fierce'],
    'wise': ['wisdom','knowledge','writing','measurement','archives','judgment','justice','balance','diplomacy','counsel','prophecy','fate','meditation','enlightenment','compassion','sacred','patience'],
    'creative': ['music','arts','craft','architecture','creation','transformation','shapeshifting','dance','eloquence','poetry','literature','painting'],
    'calm': ['peace','serenity','harvest','agriculture','fertility','rice','healing','medicine','rest','sleep','dreams','rain','snow','mist','prosperity','longevity','abundance'],
    'passionate': ['desire','love','beauty','charm','seduction','fire','thunder','storm','wrath','venom','plague','gluttony','rage','dark magic'],
    'mysterious': ['death','underworld','necromancy','darkness','shadow','night','void','abyss','chaos','curse','illusion','trickery','transformation','mystery','prophecy'],
}

E_KW = {
    'fire': ['fire','thunder','lightning','storm','volcano','sun disk'],
    'water': ['water','ocean','sea','flood','wave','tide','rain','river','lake','pond','ice'],
    'earth': ['earth','mountain','stone','metal','agriculture','harvest','land','soil','forest','tree','plant','growth','fertility','rice'],
    'air': ['wind','sky','air','flight','flying','cloud'],
    'lightning': ['lightning','thunder','electric'],
    'death': ['death','underworld','hell','judgment','soul','afterlife','reincarnation','curse','decay','necropolis'],
    'sun': ['sun','solar','dawn','day','light','rising sun'],
    'moon': ['moon','lunar','night','dream','tidal','nocturnal'],
}

F_KW = {
    'music': ['music','arts','eloquence','poetry','dance','calligraphy'],
    'war': ['war','combat','martial','archery','sword','battle','weapon','military','slaying','punishment','conquest','combat'],
    'knowledge': ['knowledge','wisdom','writing','measurement','archives','literature','scholarship','counsel','diplomacy','calculation','record'],
    'nature': ['nature','forest','tree','plant','agriculture','harvest','rice','fertility','animal','mountain','river','ocean','rain','weather','season','cherry','blossom'],
    'beauty': ['beauty','love','charm','lotus','perfection','grace','beguiling'],
    'adventure': ['adventure','exploration','travel','journey','quest','flight','speed','swimming','curiosity'],
    'magic': ['magic','spell','sorcery','illusion','transformation','shapeshifting','divination','enchantment','ritual','alchemy','exorcism','foxfire'],
    'wealth': ['wealth','prosperity','treasure','fortune','abundance','riches','business','commerce'],
    'family': ['family','mother','father','child','household','gate','domestic','maternal'],
    'justice': ['justice','judgment','balance','order','truth','law','fairness','karma','retribution'],
    'healing': ['healing','medicine','health','restoration','rejuvenation','cure','remedy','compassion'],
    'protection': ['protection','guardian','defend','shield','ward','purification','safety','watch','evil warding'],
}

personality = {k: [] for k in P_KW}
element = {k: [] for k in E_KW}
favorite = {k: [] for k in F_KW}

for nl, god in all_gods.items():
    pp = god['powers']
    for t in kw_match(pp, P_KW):
        personality[t].append(nl)
    if not any(nl in s for s in personality.values()):
        cat = god['category'].lower()
        if cat in ['monster','creature','jotun','underworld']:
            personality['mysterious'].append(nl)
        elif cat in ['hero','war']:
            personality['brave'].append(nl)
        elif cat in ['primordial','celestial']:
            personality['wise'].append(nl)
        else:
            personality['calm'].append(nl)

    for e in kw_match(pp, E_KW):
        element[e].append(nl)
    if not any(nl in s for s in element.values()):
        element['earth'].append(nl)

    for f in kw_match(pp, F_KW):
        favorite[f].append(nl)
    if not any(nl in s for s in favorite.values()):
        favorite['knowledge'].append(nl)

# --- Step 3: Build map strings ---
def fmt_set(items, indent='      '):
    """Format a set of strings as a Dart set literal, 5 per line."""
    lines = []
    for i in range(0, len(items), 5):
        chunk = items[i:i+5]
        lines.append(indent + ', '.join(f"'{x}'" for x in chunk) + ',')
    return '\n'.join(lines)

personality_str = '  static const _personalityMap = {\n'
for trait in ['brave','wise','creative','calm','passionate','mysterious']:
    items = sorted(set(personality[trait]))
    personality_str += f"    '{trait}': {{\n{fmt_set(items)}\n    }},\n"
personality_str += '  };'

element_str = '  static const _elementMap = {\n'
for trait in ['fire','water','earth','air','lightning','death','sun','moon']:
    items = sorted(set(element[trait]))
    element_str += f"    '{trait}': {{\n{fmt_set(items)}\n    }},\n"
element_str += '  };'

favorite_str = '  static const _favoriteMap = {\n'
for trait in ['music','war','knowledge','nature','beauty','adventure','magic','wealth','family','justice','healing','protection']:
    items = sorted(set(favorite[trait]))
    favorite_str += f"    '{trait}': {{\n{fmt_set(items)}\n    }},\n"
favorite_str += '  };'

# --- Step 4: Replace in file ---
with open(FILE, 'r', encoding='utf-8') as f:
    content = f.read()

# Find each map and replace
for map_name, map_str in [('_personalityMap', personality_str), ('_elementMap', element_str), ('_favoriteMap', favorite_str)]:
    start = content.find(f'static const {map_name} = {{')
    if start == -1:
        print(f'ERROR: {map_name} not found')
        continue
    # Find the closing };
    depth = 0
    end = start
    for i in range(start, len(content)):
        if content[i] == '{': depth += 1
        elif content[i] == '}':
            depth -= 1
            if depth == 0:
                end = i + 1  # include closing }
                break
    content = content[:start] + map_str + content[end:]

# Also update _chineseZodiacMap - keep existing + add new
# Find current chinese zodiac map
cz_start = content.find('static const _chineseZodiacMap = {')
if cz_start != -1:
    depth = 0
    cz_end = cz_start
    for i in range(cz_start, len(content)):
        if content[i] == '{': depth += 1
        elif content[i] == '}':
            depth -= 1
            if depth == 0:
                cz_end = i + 1
                break
    cz_block = content[cz_start:cz_end]
    # Keep as-is, it was already updated by subagent

with open(FILE, 'w', encoding='utf-8') as f:
    f.write(content)

print('Maps rebuilt successfully!')
print(f'File size: {len(content)} chars')

# Verify
for map_name in ['_personalityMap', '_elementMap', '_favoriteMap']:
    start = content.find(f'{map_name} = {{')
    depth = 0
    end = start
    for i in range(start, len(content)):
        if content[i] == '{': depth += 1
        elif content[i] == '}':
            depth -= 1
            if depth == 0:
                end = i
                break
    block = content[start:end+1]
    names = set(re.findall(r"'([^']+)'", block))
    non_god = {'brave','wise','creative','calm','passionate','mysterious',
        'fire','water','earth','air','lightning','death','sun','moon',
        'music','war','knowledge','nature','beauty','adventure','magic',
        'wealth','family','justice','healing','protection',
        'rat','ox','tiger','rabbit','dragon','snake','horse','goat','monkey','rooster','dog','pig'}
    print(f'{map_name}: {len(names - non_god)} gods')
