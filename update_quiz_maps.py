import re

FILE = 'D:/mythopedia/lib/screens/quiz_result_screen.dart'

# === GOD CATEGORIZATIONS ===
# personality: brave|wise|creative|calm|passionate|mysterious
# element: fire|water|earth|air|lightning|death|sun|moon
# favorite: music|war|knowledge|nature|beauty|adventure|magic|wealth|family|justice|healing|protection

ADD_PERSONALITY = {
    'brave': [
        'aten', 'bennu', 'wadjet', 'nekhbet', 'wepwawet',
        'bellerophon', 'typhon',
        'arjuna', 'ashwini kumaras', 'bhishma', 'karna',
        'azure dragon', 'bixie', 'dian mu', 'erlang shen', 'feng bo',
        'guan yu', 'horse-face', 'hou yi', 'jade emperor', 'long (dragon)',
        'menshen', 'mulan', 'nezha', 'ox-head', 'pangu', 'peng',
        'sha wujing', 'sun wukong', 'white tiger', 'zhao gongming', 'zhong kui',
        'zhu bajie', 'vermilion bird', 'dragon king of the south (ao qin)',
        'amaterasu', 'benkei', 'bishamonten', 'futsunushi', 'hachiman',
        'izanagi', 'kappa', 'kintaro', 'momotaro', 'raijin', 'raiju',
        'susano', 'takemikazuchi', 'yamato takeru',
    ],
    'wise': [
        'aten', 'bennu', 'ma\'at', 'seshat',
        'forseti', 'huginn & muninn', 'norns',
        'buddha', 'vishwakarma',
        'black tortoise', 'cai shen', 'dragon king of the east (ao guang)',
        'dragon king of the west (ao run)', 'fuxi', 'jade emperor',
        'li jing', 'long (dragon)', 'qilin', 'tai bai jin xing', 'taiyi',
        'ten kings of hell', 'wen chang', 'yanluo wang',
        'amenominakanushi', 'amenotokotachi', 'benzaiten', 'emma-o',
        'fukurokuju', 'izanagi', 'jurojin', 'kitsune', 'ryujin',
        'takamimusubi', 'tsukuyomi', 'ōkuninushi',
    ],
    'creative': [
        'khepri',
        'ratatoskr',
        'eight immortals', 'fuxi', 'jigong', 'nu wa', 'sun wukong',
        'wen chang',
        'benzaiten', 'hotei', 'jorōgumo', 'kamimusubi', 'kitsune',
        'tanuki',
    ],
    'calm': [
        'aten', 'mnevis', 'nefertem',
        'forseti', 'hypnos',
        'buddha', 'chandra',
        'black tortoise', 'cai shen', 'chang\'e', 'fenghuang',
        'he bo', 'pixiu', 'qilin', 'tu di gong', 'yu shi',
        'dragon king of the north (ao shun)', 'dragon king of the west (ao run)',
        'men g po',
        'amenotokotachi', 'baku', 'daikokuten', 'ebisu', 'fukurokuju',
        'hotei', 'inari', 'izanami', 'jurojin', 'kamimusubi',
        'konohanasakuya', 'kuraokami', 'momotaro', 'suijin',
        'takamimusubi', 'takeminakata', 'tsukuyomi', 'umashiashikabihikoji',
        'urashima taro', 'watatsumi', 'ōkuninushi',
    ],
    'passionate': [
        'hathor',
        'nephthys',
        'erinyes (furies)', 'typhon',
        'kamadeva',
        'dian mu', 'dragon king of the south (ao qin)', 'huli jing',
        'li gong', 'nezha', 'taotie', 'zhu bajie',
        'ame-no-uzume', 'gashadokuro', 'jorōgumo', 'oni',
        'rai', 'susano', 'yamata no orochi', 'yuki-onna',
    ],
    'mysterious': [
        'apep', 'nephthys', 'serqet', 'sokar',
        'an', 'chaos', 'charon', 'echidna', 'erebus', 'erinyes (furies)',
        'hecate', 'morpheus', 'nyx', 'proteus', 'scylla & charybdis',
        'selene', 'tartarus', 'thanatos', 'thetis', 'typhon',
        'an', 'angrboda', 'hel', 'nidhogg', 'norns', 'utgard-loki',
        'chandra',
        'black impermanence', 'chang\'e', 'huli jing', 'hundun',
        'jiangshi', 'queen mother of the west', 'white impermanence',
        'izanami', 'jorōgumo', 'kitsune', 'nue', 'shikome',
        'shinigami', 'tengu', 'yamata no orochi', 'yomotsu hirasaka',
        'yuki-onna',
    ],
}

ADD_ELEMENT = {
    'fire': [
        'wadjet', 'vermilion bird',
        'arjuna', 'karna',
        'dian mu', 'dragon king of the south (ao qin)', 'erlang shen',
        'feng bo', 'guan yu', 'hou yi', 'jade emperor', 'lei gong',
        'nezha', 'sun wukong', 'zhao gongming', 'zhong kui',
        'futsunushi', 'hachiman', 'bishamonten', 'oni',
        'yamato takeru',
    ],
    'water': [
        'nephthys', 'serqet',
        'an', 'scylla & charybdis', 'thetis',
        'bhishma',
        'azure dragon', 'black tortoise', 'dragon king of the east (ao guang)',
        'dragon king of the north (ao shun)', 'dragon king of the south (ao qin)',
        'dragon king of the west (ao run)', 'he bo', 'long (dragon)',
        'sha wujing', 'yu shi',
        'benzaiten', 'ebisu', 'izanami', 'kappa', 'kuraokami',
        'ryujin', 'suijin', 'susano', 'takeminakata', 'tsukuyomi',
        'urashima taro', 'watatsumi', 'yamata no orochi', 'yuki-onna',
    ],
    'earth': [
        'echidna', 'orpheus',
        'an', 'norns', 'ratatoskr',
        'vishwakarma',
        'bixie', 'fuxi', 'hundun', 'jigong', 'pangu', 'qilin',
        'tang sanzang', 'taotie', 'tu di gong',
        'baku', 'daikokuten', 'fukurokuju', 'hotei', 'inari',
        'izanagi', 'izanami', 'jurojin', 'kamimusubi', 'kintaro',
        'konohanasakuya', 'momotaro', 'tanuki', 'takamimusubi',
        'umashiashikabihikoji', 'ōkuninushi',
    ],
    'air': [
        'ma\'at', 'nekhbet', 'seshat', 'wepwawet',
        'forseti', 'huginn & muninn', 'ratatoskr', 'utgard-loki',
        'buddha',
        'eight immortals', 'feng bo', 'jade emperor', 'li jing',
        'lu dongbin', 'peng', 'tai bai jin xing', 'taiyi', 'wen chang',
        'amenominakanushi', 'amenotokotachi', 'fujin', 'shinatsuhiko',
        'tengu',
    ],
    'lightning': [
        'dian mu', 'erlang shen', 'lei gong', 'nezha',
        'rai', 'raiju', 'takemikazuchi',
    ],
    'death': [
        'apep', 'nephthys', 'sokar',
        'an', 'erebus', 'erinyes (furies)', 'tartarus', 'thanatos',
        'hel', 'nidhogg',
        'black impermanence', 'jiangshi', 'judge cui', 'meng po',
        'ten kings of hell', 'white impermanence', 'yanluo wang',
        'emma-o', 'gashadokuro', 'izanami', 'nue', 'shikome',
        'shinigami', 'yomotsu hirasaka',
    ],
    'sun': [
        'aten', 'bennu', 'hathor', 'khepri', 'mnevis',
        'amaterasu', 'ame-no-uzume', 'marishiten',
        'vermilion bird',
    ],
    'moon': [
        'hecate', 'nephthys', 'selene',
        'chandra',
        'chang\'e', 'queen mother of the west',
        'tsukuyomi',
    ],
}

ADD_FAVORITE = {
    'music': [
        'benzaiten', 'fuxi', 'wen chang',
    ],
    'war': [
        'apep', 'mnevis', 'nek', 'wadjet', 'wepwawet',
        'bellerophon', 'erinyes (furies)', 'typhon',
        'arjuna', 'bhishma', 'karna',
        'dian mu', 'dragon king of the south (ao qin)', 'erlang shen',
        'feng bo', 'guan yu', 'horse-face', 'hou yi', 'lei gong',
        'long (dragon)', 'meng po', 'nezha', 'ox-head', 'sha wujing',
        'sun wukong', 'white tiger', 'zhao gongming',
        'benkei', 'bishamonten', 'futsunushi', 'gashadokuro', 'hachiman',
        'marishiten', 'momotaro', 'oni', 'rai', 'raiju',
        'shikome', 'susano', 'takemikazuchi', 'tengu',
        'yamata no orochi', 'yamato takeru',
    ],
    'knowledge': [
        'aten', 'seshat', 'sokar',
        'huginn & muninn',
        'black tortoise', 'dragon king of the west (ao run)', 'fuxi',
        'jade emperor', 'tai bai jin xing', 'taiyi', 'wen chang',
        'amenominakanushi', 'amenotokotachi', 'benzaiten', 'emma-o',
        'fukurokuju', 'jurojin', 'kitsune', 'takamimusubi',
        'ōkuninushi',
    ],
    'nature': [
        'bennu', 'khepri', 'mnevis',
        'an', 'angrboda', 'hypnos',
        'chandra',
        'azure dragon', 'chang\'e', 'dragon king of the east (ao guang)',
        'dragon king of the north (ao shun)', 'dragon king of the west (ao run)',
        'fenghuang', 'fuxi', 'he bo', 'hou yi', 'long (dragon)',
        'pangu', 'tu di gong', 'yu shi',
        'baku', 'ebisu', 'inari', 'izanagi', 'izanami', 'jurojin',
        'kamimusubi', 'konohanasakuya', 'kuraokami', 'ryujin',
        'suijin', 'takamimusubi', 'umashiashikabihikoji',
        'urashima taro', 'watatsumi', 'ōkuninushi',
    ],
    'beauty': [
        'benzaiten', 'chang\'e', 'fenghuang',
        'ame-no-uzume', 'jorōgumo', 'kitsune', 'konohanasakuya',
        'yuki-onna',
    ],
    'adventure': [
        'bellerophon', 'charon', 'scylla & charybdis', 'thetis',
        'arjuna', 'ashwini kumaras',
        'dian mu', 'dragon king of the east (ao guang)', 'dragon king of the south (ao qin)',
        'eight immortals', 'feng bo', 'guan yu', 'hou yi', 'long (dragon)',
        'lu dongbin', 'p', 'sun wukong',
        'ame-no-uzume', 'ebisu', 'fujin', 'kappa', 'kintaro',
        'momotaro', 'susano', 'takemikazuchi', 'urashima taro',
        'watatsumi', 'yamato takeru',
    ],
    'magic': [
        'apep', 'nephthys', 'serqet',
        'an', 'erebus', 'hypnos', 'morpheus', 'nyx', 'proteus',
        'tartarus', 'thanatos',
        'angrboda', 'utgard-loki',
        'black impermanence', 'fuxi', 'huli jing', 'hundun',
        'jiangshi', 'nu wa', 'queen mother of the west', 'sun wukong',
        'white impermanence',
        'benkei', 'bishamonten', 'gashadokuro', 'izanagi', 'izanami',
        'jorōgumo', 'kitsune', 'marishiten', 'oni', 'shikome',
        'shinigami', 'tanuki', 'tengu', 'yuki-onna',
    ],
    'wealth': [
        'cai shen', 'long (dragon)', 'zhao gongming',
        'benkei', 'bishamonten', 'daikokuten', 'ebisu',
        'inari', 'ryujin', 'tanuki',
    ],
    'family': [
        'fenghuang', 'guan yu', 'menshen',
        'daikokuten', 'hotei', 'konohanasakuya', 'li jing',
    ],
    'justice': [
        'erinyes (furies)', 'hector',
        'qilin', 'ten kings of hell', 'zhong kui',
        'emma-o', 'hachiman',
    ],
    'healing': [
        'nefertem', 'thanatos',
        'buddha',
        'jigong', 'tang sanzang', 'yu shi',
        'fukurokuju', 'shinatsuhiko', 'suijin', 'umashiashikabihikoji',
        'ōkuninushi',
    ],
    'protection': [
        'nekhbet', 'wadjet',
        'azure dragon', 'bixie', 'he bo', 'horse-face', 'li jing',
        'long (dragon)', 'menshen', 'pixiu',
        'amaterasu', 'benkei', 'bishamonten', 'hachiman',
        'izanagi', 'marishiten', 'momotaro', 'suijin',
        'yomotsu hirasaka',
    ],
}

ADD_CHINESE_ZODIAC = {
    'dragon': ['jade emperor', 'long (dragon)', 'azure dragon', 'dragon king of the east (ao guang)'],
    'monkey': ['sun wukong', 'zhu bajie'],
    'snake': ['nezha', 'nu wa'],
    'tiger': ['guan yu', 'zhong kui', 'white tiger'],
    'horse': ['hou yi', 'erlang shen', 'li jing'],
    'rat': ['cai shen', 'pixiu', 'zhao gongming'],
    'ox': ['pangu', 'fuxi', 'black tortoise'],
    'rabbit': ['fenghuang', 'qilin', 'konohanasakuya'],
    'goat': ['wen chang', 'daikokuten', 'fukurokuju'],
    'dog': ['menshen', 'judge cui'],
    'pig': ['hotei', 'ebisu', 'jigong'],
    'rooster': ['vermilion bird', 'baku', 'tanuki'],
}

with open(FILE, 'r', encoding='utf-8') as f:
    content = f.read()

def add_to_map(content, map_name, trait, gods):
    """Add gods to a specific trait set in a named map."""
    # Find the trait line like 'brave': {
    pattern = rf"('{re.escape(trait)}':\s*\{{)"
    match = re.search(pattern, content)
    if not match:
        print(f"  WARNING: trait '{trait}' not found in {map_name}")
        return content
    
    # Find the closing } for this trait's set
    start = match.end()
    depth = 1
    end = start
    for i in range(start, len(content)):
        if content[i] == '{': depth += 1
        elif content[i] == '}':
            depth -= 1
            if depth == 0:
                end = i
                break
    
    block = content[start:end]
    existing = set(re.findall(r"'([^']+)'", block))
    
    # Filter out already-present gods
    new_gods = [g for g in gods if g.lower() not in {e.lower() for e in existing}]
    
    if not new_gods:
        return content
    
    # Format new entries
    new_entries = ", ".join(f"'{g}'" for g in new_gods)
    
    # Add before the closing }
    # Find last non-whitespace before }
    insert_pos = end - 1
    # Skip whitespace
    while insert_pos > start and content[insert_pos] in ' \t\n\r':
        insert_pos -= 1
    
    # Add comma if needed
    if content[insert_pos] != ',':
        insert_pos += 1
        content = content[:insert_pos] + ',' + content[insert_pos:]
        end += 1
    
    # Insert new entries
    # Add proper indentation
    # Get the indentation of the existing entries
    lines = block.strip().split('\n')
    indent = '      '  # default
    for line in reversed(lines):
        stripped = line.strip()
        if stripped.startswith("'") or stripped.startswith('//'):
            indent = line[:len(line) - len(line.lstrip())]
            break
    
    new_text = f"\n{indent}{new_entries},"
    content = content[:end] + new_text + content[end:]
    
    return content

# Apply all additions
print("Updating _personalityMap...")
for trait, gods in ADD_PERSONALITY.items():
    content = add_to_map(content, '_personalityMap', trait, gods)

print("Updating _elementMap...")
for trait, gods in ADD_ELEMENT.items():
    content = add_to_map(content, '_elementMap', trait, gods)

print("Updating _favoriteMap...")
for trait, gods in ADD_FAVORITE.items():
    content = add_to_map(content, '_favoriteMap', trait, gods)

print("Updating _chineseZodiacMap...")
for animal, gods in ADD_CHINESE_ZODIAC.items():
    content = add_to_map(content, '_chineseZodiacMap', animal, gods)

with open(FILE, 'w', encoding='utf-8') as f:
    f.write(content)

print("\nDone! Verifying...")

# Verify
with open(FILE, 'r', encoding='utf-8') as f:
    content = f.read()

for map_name in ['_personalityMap', '_elementMap', '_favoriteMap', '_chineseZodiacMap']:
    start = content.find(f'{map_name} = {{')
    if start == -1:
        print(f'{map_name}: NOT FOUND')
        continue
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
    god_names = names - non_god
    print(f'{map_name}: {len(god_names)} gods')

# Final check: missing from personalityMap
cosmology = set()
import os
for fpath in ['D:/mythopedia/lib/data/greek_gods.dart', 'D:/mythopedia/lib/data/egyptian_gods.dart',
              'D:/mythopedia/lib/data/nordic_gods.dart', 'D:/mythopedia/lib/data/hindu_gods.dart',
              'D:/mythopedia/lib/data/chinese_gods.dart', 'D:/mythopedia/lib/data/japanese_gods.dart']:
    with open(fpath, 'r', encoding='utf-8') as f:
        text = f.read()
    names = re.findall(r"name:\s*'([^']+)'", text)
    blocks = re.split(r'God\(\s*id:', text)[1:]
    for block in blocks:
        nm = re.search(r"name:\s*'([^']+)'", block)
        cm = re.search(r"category:\s*'([^']+)'", block)
        if nm and cm and cm.group(1) == 'Cosmology':
            cosmology.add(nm.group(1).lower())

all_names = set()
for fpath in ['D:/mythopedia/lib/data/greek_gods.dart', 'D:/mythopedia/lib/data/egyptian_gods.dart',
              'D:/mythopedia/lib/data/nordic_gods.dart', 'D:/mythopedia/lib/data/hindu_gods.dart',
              'D:/mythopedia/lib/data/chinese_gods.dart', 'D:/mythopedia/lib/data/japanese_gods.dart']:
    with open(fpath, 'r', encoding='utf-8') as f:
        text = f.read()
    all_names.update(n.lower() for n in re.findall(r"name:\s*'([^']+)'", text))

non_cosmology = all_names - cosmology
personality_start = content.find('_personalityMap = {')
depth = 0
personality_end = personality_start
for i in range(personality_start, len(content)):
    if content[i] == '{': depth += 1
    elif content[i] == '}':
        depth -= 1
        if depth == 0:
            personality_end = i
            break
pblock = content[personality_start:personality_end+1]
pnames = set(re.findall(r"'([^']+)'", pblock)) - non_god
still_missing = non_cosmology - pnames
if still_missing:
    print(f'\nStill missing ({len(still_missing)}):')
    for g in sorted(still_missing):
        print(f'  - {g}')
else:
    print('\nAll non-cosmology gods covered!')
