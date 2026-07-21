"""Rebuild matching maps — anchored to correct map declarations."""
import re

FILE = 'D:/mythopedia/lib/screens/quiz_result_screen.dart'
DATA = [
    'D:/mythopedia/lib/data/greek_gods.dart',
    'D:/mythopedia/lib/data/egyptian_gods.dart',
    'D:/mythopedia/lib/data/nordic_gods.dart',
    'D:/mythopedia/lib/data/hindu_gods.dart',
    'D:/mythopedia/lib/data/chinese_gods.dart',
    'D:/mythopedia/lib/data/japanese_gods.dart',
]

QCHARS = "'\""

# Parse gods
all_gods = {}
for fpath in DATA:
    with open(fpath, 'r', encoding='utf-8') as f:
        text = f.read()
    for block in re.split(r'God\(\s*id:', text)[1:]:
        nm = re.search(r"name:\s*'([^']+)'", block)
        cm = re.search(r"category:\s*'([^']+)'", block)
        pm = re.search(r"powersEn:\s*\[(.*?)\]", block, re.DOTALL)
        if nm and cm:
            name = nm.group(1)
            cat = cm.group(1)
            powers = [p.strip().strip(QCHARS).lower() for p in pm.group(1).split(',') if p.strip().strip(QCHARS)] if pm else []
            if cat != 'Cosmology':
                all_gods[name.lower()] = {'name': name, 'cat': cat, 'pw': powers}

def kw_match(powers, kw_map):
    out = []
    for t, kws in kw_map.items():
        for p in powers:
            if any(k in p for k in kws):
                out.append(t); break
    return out

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
    'war': ['war','combat','martial','archery','sword','battle','weapon','military','slaying','punishment','conquest'],
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
    pp = god['pw']
    for t in kw_match(pp, P_KW): personality[t].append(nl)
    if not any(nl in s for s in personality.values()):
        cat = god['cat'].lower()
        if cat in ['monster','creature','jotun','underworld']: personality['mysterious'].append(nl)
        elif cat in ['hero','war']: personality['brave'].append(nl)
        elif cat in ['primordial','celestial']: personality['wise'].append(nl)
        else: personality['calm'].append(nl)
    for e in kw_match(pp, E_KW): element[e].append(nl)
    if not any(nl in s for s in element.values()): element['earth'].append(nl)
    for f in kw_match(pp, F_KW): favorite[f].append(nl)
    if not any(nl in s for s in favorite.values()): favorite['knowledge'].append(nl)

def fmt(items, indent='      '):
    items = sorted(set(items))
    lines = []
    for i in range(0, len(items), 5):
        chunk = items[i:i+5]
        lines.append(indent + ', '.join(f"'{x}'" for x in chunk) + ',')
    return '\n'.join(lines)

# Build map blocks
def build_map(name, traits, data):
    lines = [f'  static const {name} = {{']
    for t in traits:
        lines.append(f"    '{t}': {{")
        lines.append(fmt(data[t]))
        lines.append('    },')
    lines.append('  };')
    return '\n'.join(lines)

p_map = build_map('_personalityMap', ['brave','wise','creative','calm','passionate','mysterious'], personality)
e_map = build_map('_elementMap', ['fire','water','earth','air','lightning','death','sun','moon'], element)
f_map = build_map('_favoriteMap', ['music','war','knowledge','nature','beauty','adventure','magic','wealth','family','justice','healing','protection'], favorite)

# Read file and replace maps by finding their full extent
with open(FILE, 'r', encoding='utf-8') as f:
    content = f.read()

for map_name, new_block in [('_personalityMap', p_map), ('_elementMap', e_map), ('_favoriteMap', f_map)]:
    # Find "static const _personalityMap = {"
    marker = f'static const {map_name} = {{'
    start = content.find(marker)
    if start == -1:
        print(f'ERROR: {map_name} not found'); continue
    # Find matching closing };
    depth = 0
    end = start
    for i in range(start, len(content)):
        if content[i] == '{': depth += 1
        elif content[i] == '}':
            depth -= 1
            if depth == 0:
                end = i + 1  # include }
                break
    # Also skip trailing ;\n if present
    while end < len(content) and content[end] in ';\n\r ':
        end += 1
    content = content[:start] + new_block + '\n' + content[end:]

with open(FILE, 'w', encoding='utf-8') as f:
    f.write(content)

print(f'Done. File: {len(content)} chars')

# Verify
for mn in ['_personalityMap', '_elementMap', '_favoriteMap']:
    s = content.find(f'{mn} = {{')
    d = 0; e = s
    for i in range(s, len(content)):
        if content[i] == '{': d += 1
        elif content[i] == '}':
            d -= 1
            if d == 0: e = i; break
    block = content[s:e+1]
    ns = set(re.findall(r"'([^']+)'", block))
    ng = {'brave','wise','creative','calm','passionate','mysterious','fire','water','earth','air','lightning','death','sun','moon','music','war','knowledge','nature','beauty','adventure','magic','wealth','family','justice','healing','protection','rat','ox','tiger','rabbit','dragon','snake','horse','goat','monkey','rooster','dog','pig'}
    print(f'{mn}: {len(ns - ng)} gods')
