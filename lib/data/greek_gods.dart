import '../models/god_model.dart';

final List<God> greekGods = [
  God(
    id: '1',
    name: 'Zeus',
    mythology: 'Greek',
    title: 'Raja Para Dewa',
    titleEn: 'King of the Gods',
    symbol: '⚡',
    powers: ['Petir', 'Langit', 'Otoritas', 'Keadilan', 'Hukum'],
    powersEn: ['Lightning', 'Sky', 'Authority', 'Justice', 'Law'],
    story: '''
Zeus adalah putra bungsu dari pasangan Titan Cronus dan Rhea, lahir di tengah era ketika Cronus, karena nubuat bahwa salah satu anaknya kelak akan menggulingkannya, menelan setiap bayi yang dilahirkan Rhea. Untuk menyelamatkan Zeus, Rhea diam-diam melahirkannya di sebuah gua di Gunung Ida, Kreta, lalu menyerahkan batu yang dibungkus kain kepada Cronus sebagai gantinya. Zeus dibesarkan secara rahasia oleh para nimfa dan disusui oleh kambing ajaib Amalthea hingga ia dewasa dan cukup kuat untuk menantang ayahnya. Setelah memaksa Cronus memuntahkan saudara-saudaranya yang tertelan, Zeus memimpin saudara-saudaranya—para Olympian—dalam Titanomachy, perang besar sepuluh tahun melawan para Titan, yang berakhir dengan kemenangan Olympian dan pengasingan sebagian besar Titan ke Tartarus. Dari kemenangan itu Zeus dinobatkan sebagai raja para dewa yang memerintah dari puncak Gunung Olympus.

Sebagai penguasa langit, Zeus mengendalikan petir, guntur, dan cuaca, dengan senjata utamanya berupa kilat yang ditempa khusus oleh para Cyclops sebagai ucapan terima kasih atas pembebasan mereka dari Tartarus. Elang dan pohon ek suci menjadi lambangnya, mencerminkan kekuatannya atas langit dan otoritas tertinggi yang ia pegang di antara para dewa maupun manusia. Zeus dipandang sebagai penjaga tatanan kosmis: ia menegakkan hukum, keadilan, sumpah, dan adat menerima tamu (xenia), sehingga sering disebut pelindung para raja dan penjamin ketertiban dunia. Meski dihormati karena wibawa dan keadilannya, ia juga dikenal karena sifatnya yang berubah-ubah dan hasratnya yang tak terkendali, yang membuahkan banyak kisah cinta dan keturunan di kalangan dewa maupun manusia.

Salah satu kisah paling terkenal tentang Zeus adalah saat ia menelan istri pertamanya, Metis, setelah mendengar ramalan bahwa anak yang dikandungnya kelak akan lebih perkasa darinya; dari tindakan itu lahirlah Athena, yang muncul langsung dari kepala Zeus dalam wujud dewasa dan bersenjata lengkap. Zeus menikahi Hera sebagai istri utamanya dan bersama para dewa Olympian lain membentuk pantheon yang memerintah dari Olympus, meski hubungan mereka sering diwarnai kecemburuan akibat perselingkuhan Zeus dengan dewi maupun manusia seperti Leto, Alcmene, dan Europa. Sebagai raja para dewa, Zeus menjadi pusat pemujaan terbesar dalam agama Yunani kuno, termasuk kuil megahnya di Olympia yang menaungi patung raksasa karya Phidias, salah satu dari Tujuh Keajaiban Dunia Kuno, menjadikannya simbol otoritas dan keadilan ilahi yang bertahan hingga budaya Barat modern.''',
    storyEn: '''
Zeus is the youngest son of the Titans Cronus and Rhea, born during an age when Cronus, fearing a prophecy that one of his children would overthrow him, swallowed each infant Rhea bore. To save Zeus, Rhea secretly gave birth to him in a cave on Mount Ida in Crete and gave Cronus a stone wrapped in swaddling cloth in his place. Zeus was raised in secrecy by nymphs and nursed by the divine goat Amalthea until he grew strong enough to challenge his father. After forcing Cronus to disgorge his swallowed siblings, Zeus led the Olympians in the Titanomachy, a ten-year war against the Titans that ended in Olympian victory and the imprisonment of most Titans in Tartarus. From that triumph Zeus was crowned king of the gods, ruling from the summit of Mount Olympus.

As ruler of the sky, Zeus commands thunder, lightning, and storms, wielding a thunderbolt forged especially for him by the Cyclopes in gratitude for their release from Tartarus. The eagle and the sacred oak are his emblems, reflecting his dominion over the heavens and the supreme authority he holds among gods and mortals alike. Zeus is regarded as the guardian of cosmic order, upholding law, justice, oaths, and the sacred custom of hospitality, and is often invoked as the protector of kings and guarantor of world order. Though revered for his authority and sense of justice, he is equally known for his unpredictable temper and uncontrollable desire, which produced countless love affairs and offspring among both gods and mortals.

One of the most famous episodes involving Zeus is his swallowing of his first wife, Metis, after learning a prophecy that her child would surpass him in power; from this act Athena was born, springing fully grown and armored directly from Zeus's head. Zeus married Hera as his principal consort and, together with the other Olympians, formed the pantheon that ruled from Olympus, though their marriage was frequently strained by Zeus's affairs with goddesses and mortals such as Leto, Alcmene, and Europa. As king of the gods, Zeus stood at the center of ancient Greek religious life, including his monumental sanctuary at Olympia, which housed Phidias's colossal statue of him, one of the Seven Wonders of the Ancient World, cementing his lasting legacy as a symbol of divine authority and justice in Western culture.''',
    imageUrl:
        'assets/images/Greek/Olympians/zeus.webp',
    category: 'Olympian',
  ),
  God(
    id: '2',
    name: 'Athena',
    mythology: 'Greek',
    title: 'Dewi Kebijaksanaan & Perang',
    titleEn: 'Goddess of Wisdom & War',
    symbol: '🦉',
    powers: ['Kebijaksanaan', 'Strategi Perang', 'Kerajinan', 'Keadilan', 'Ilmu Pengetahuan'],
    powersEn: ['Wisdom', 'War Strategy', 'Craftsmanship', 'Justice', 'Knowledge'],
    story: '''
Athena lahir dari Zeus tanpa melalui rahim seorang ibu dalam pengertian biasa: setelah menelan istri pertamanya, Metis, karena ramalan bahwa anak mereka akan menjadi lebih kuat darinya, Zeus mengalami sakit kepala hebat hingga Hephaestus (dalam sebagian versi dibantu Prometheus) membelah tengkoraknya dengan kapak, dan dari sana muncullah Athena dalam wujud dewasa yang telah mengenakan baju zirah lengkap sambil meneriakkan pekik perang. Karena kelahirannya yang unik ini, Athena dianggap lahir langsung dari pikiran Zeus, menjadikannya perwujudan kebijaksanaan dan strategi yang lahir dari akal, bukan nafsu. Ia segera diterima sebagai salah satu dewi Olympian yang paling dihormati, berdiri sejajar dengan putra-putra Zeus lainnya meski lahir dengan cara yang berbeda dari saudara-saudaranya.

Athena adalah dewi kebijaksanaan, strategi perang, kerajinan, dan keadilan, memerintah bukan atas kekacauan pertempuran melainkan atas taktik, disiplin, dan pertahanan yang terencana—sebuah kontras tegas dengan Ares yang mewakili kekerasan perang yang membabi buta. Burung hantu menjadi lambangnya sebagai simbol kebijaksanaan dan penglihatan tajam dalam kegelapan, sementara pohon zaitun—yang menurut mitos ia ciptakan sendiri sebagai hadiah bagi manusia—melambangkan kedamaian, kemakmuran, dan pengetahuan. Sebagai pelindung para perajin dan penemu, Athena juga diasosiasikan dengan tenun, pertukangan, dan seni, mencerminkan kepribadiannya yang cerdas, tenang, dan berorientasi pada penyelesaian masalah secara rasional. Ia dikenal adil namun tegas, dan meski perawan abadi, ia sering menjadi penasihat dan pelindung para pahlawan besar.

Salah satu kisah paling terkenal tentang Athena adalah persaingannya dengan Poseidon untuk menjadi pelindung sebuah kota di Attica; Poseidon menghadirkan mata air asin dengan hentakan trisulanya, sementara Athena memberikan pohon zaitun, dan penduduk kota memilih hadiah Athena sehingga kota tersebut dinamai Athena sebagai penghormatan kepadanya. Ia juga dikenal sebagai pelindung setia para pahlawan seperti Odysseus dalam pengembaraannya pulang ke Ithaca sebagaimana dikisahkan dalam Odyssey karya Homer, serta Perseus dan Heracles dalam berbagai tugas berat mereka. Sebagai salah satu dari Tiga Dewi Perawan (bersama Artemis dan Hestia), Athena tidak pernah menikah namun memiliki hubungan mentor yang erat dengan banyak tokoh mitologi, dan kuil Parthenon yang megah di Acropolis Athena, salah satu monumen arsitektur paling ikonik dalam sejarah manusia, dibangun untuk menghormatinya hingga kini menjadi simbol peradaban dan kebijaksanaan Yunani klasik.''',
    storyEn: '''
Athena was born from Zeus without a mother in the ordinary sense: after Zeus swallowed his first wife, Metis, fearing a prophecy that their child would grow more powerful than he, he was struck by a violent headache so severe that Hephaestus, in some versions aided by Prometheus, split his skull open with an axe, and from the wound Athena emerged fully grown, already clad in armor and letting out a war cry. Because of this extraordinary birth, Athena is regarded as having sprung directly from Zeus's mind, making her the embodiment of wisdom and strategy born of reason rather than passion. She was immediately accepted as one of the most honored Olympian deities, standing alongside Zeus's other children despite entering the world through so unusual a manner.

Athena is the goddess of wisdom, strategic warfare, craftsmanship, and justice, presiding not over the chaos of battle but over tactics, discipline, and planned defense, a sharp contrast to Ares, who embodies war's raw violence. The owl serves as her emblem, symbolizing wisdom and keen sight in darkness, while the olive tree, which myth credits her with creating as a gift to humanity, represents peace, prosperity, and knowledge. As patron of artisans and inventors, Athena is also linked to weaving, craftsmanship, and the arts, reflecting a personality that is intelligent, composed, and oriented toward rational problem-solving. She is known for being fair yet firm, and although an eternal virgin, she frequently serves as counselor and protector to great heroes.

One of the most famous myths about Athena is her contest with Poseidon for patronage of a city in Attica: Poseidon struck the ground with his trident to produce a spring of salt water, while Athena offered an olive tree, and the citizens chose her gift, naming the city Athens in her honor. She is also known as the steadfast protector of heroes such as Odysseus during his long journey home to Ithaca in Homer's Odyssey, as well as Perseus and Heracles during their arduous labors. As one of the Three Virgin Goddesses alongside Artemis and Hestia, Athena never married but maintained close mentoring relationships with many figures of myth, and the magnificent Parthenon temple on the Athenian Acropolis, one of the most iconic architectural monuments in human history, was built in her honor and remains a lasting symbol of classical Greek civilization and wisdom.''',
    imageUrl:
        'assets/images/Greek/Olympians/athena.webp',
    category: 'Olympian',
  ),
  God(
    id: '3',
    name: 'Hades',
    mythology: 'Greek',
    title: 'Penguasa Dunia Bawah',
    titleEn: 'Lord of the Underworld',
    symbol: '👑',
    powers: ['Kematian', 'Kekayaan', 'Dunia Bawah', 'Kegelapan', 'Jiwa-jiwa'],
    powersEn: ['Death', 'Wealth', 'Underworld', 'Darkness', 'Souls'],
    story: '''
Hades adalah putra tertua Cronus dan Rhea, sehingga secara teknis merupakan kakak tertua di antara generasi pertama Olympian, meski ia ditelan pertama kali oleh ayahnya dan dimuntahkan terakhir. Setelah para Olympian menang dalam Titanomachy melawan para Titan, tiga bersaudara laki-laki—Zeus, Poseidon, dan Hades—membagi kekuasaan atas alam semesta melalui undian: Zeus mendapatkan langit, Poseidon mendapatkan lautan, dan Hades mendapatkan dunia bawah sebagai wilayah kekuasaannya. Sejak saat itu Hades meninggalkan Gunung Olympus dan menetap secara permanen di kerajaan bawah tanah, memerintah sebagai penguasa arwah orang mati, terpisah dari kehidupan para dewa Olympian lainnya di atas.

Sebagai penguasa dunia bawah, Hades mengatur nasib jiwa-jiwa yang telah meninggal, memastikan mereka menyeberangi Sungai Styx dan menerima penghakiman yang layak, sekaligus menjadi penjaga kekayaan bumi seperti logam mulia dan permata yang terkubur di bawah tanah—karena itu ia juga dikenal dengan sebutan Plouton, yang berarti "yang kaya". Simbolnya meliputi Cerberus, anjing berkepala tiga penjaga gerbang dunia bawah, serta helm ketidaktampakan (Helm of Darkness) buatan para Cyclops yang membuat pemakainya tak terlihat. Berbeda dari citra populer sebagai sosok jahat, Hades dalam mitologi Yunani klasik digambarkan adil, tegas, dan tidak memihak, seorang hakim yang dingin namun tidak kejam tanpa alasan, jarang meninggalkan wilayahnya dan tidak terlibat dalam intrik para dewa Olympian di atas.

Kisah paling terkenal tentang Hades adalah penculikannya terhadap Persephone, putri Demeter, yang ia bawa paksa ke dunia bawah untuk dijadikan istri; kesedihan Demeter yang mendalam menyebabkan bumi menjadi tandus, sehingga Zeus turun tangan dan mencapai kesepakatan bahwa Persephone akan menghabiskan sebagian tahun bersama Hades dan sisanya bersama ibunya, sebuah mitos yang menjelaskan asal-usul pergantian musim. Melalui pernikahan ini Hades menjadi suami Persephone sekaligus penguasa bersama dunia bawah, dan bersama Zeus serta Poseidon ia membentuk trio penguasa tertinggi alam semesta meski jarang tampil dalam kisah-kisah Olympian lainnya. Warisan Hades sebagai figur dunia bawah yang tegas namun adil menjadikannya salah satu dewa yang paling banyak disalahpahami, sekaligus tokoh sentral dalam pemahaman orang Yunani kuno tentang kematian, akhirat, dan tatanan kosmis.''',
    storyEn: '''
Hades is the eldest son of Cronus and Rhea, making him technically the firstborn of the first generation of Olympians, though he was the first to be swallowed by his father and the last to be disgorged. After the Olympians defeated the Titans in the Titanomachy, the three brothers, Zeus, Poseidon, and Hades, divided the cosmos by lot: Zeus received the sky, Poseidon the sea, and Hades the underworld as his domain. From that point on, Hades left Mount Olympus and settled permanently in the subterranean realm, ruling as lord over the souls of the dead, apart from the affairs of the other Olympians above.

As ruler of the underworld, Hades oversees the fate of departed souls, ensuring they cross the River Styx and receive proper judgment, while also serving as guardian of the earth's buried wealth, such as precious metals and gems, which is why he is also known as Plouton, meaning "the rich one." His symbols include Cerberus, the three-headed hound guarding the gates of the underworld, and the Helm of Darkness crafted by the Cyclopes, which renders its wearer invisible. Contrary to his popular image as a villain, Hades in classical Greek mythology is portrayed as just, stern, and impartial, a cold but not gratuitously cruel judge who rarely leaves his realm and stays largely uninvolved in the intrigues of the Olympians above.

The most famous myth involving Hades is his abduction of Persephone, daughter of Demeter, whom he carried off to the underworld to be his wife; Demeter's profound grief caused the earth to grow barren, prompting Zeus to intervene and broker an agreement that Persephone would spend part of the year with Hades and the rest with her mother, a myth that explains the origin of the changing seasons. Through this union Hades became Persephone's husband and co-ruler of the underworld, and together with Zeus and Poseidon he formed the triad of supreme rulers of the cosmos, even though he rarely appears in the wider Olympian narratives. Hades's legacy as a stern yet fair figure of the underworld makes him one of the most misunderstood deities, while remaining central to the ancient Greek understanding of death, the afterlife, and cosmic order.''',
    imageUrl: 'assets/images/Greek/Underworld/hades.webp',
    category: 'Underworld',
  ),
  God(
    id: '4',
    name: 'Poseidon',
    mythology: 'Greek',
    title: 'Penguasa Lautan',
    titleEn: 'Lord of the Seas',
    symbol: '🔱',
    powers: ['Lautan', 'Gempa Bumi', 'Badai', 'Kuda', 'Pelayaran'],
    powersEn: ['Oceans', 'Earthquakes', 'Storms', 'Horses', 'Sailing'],
    story: '''
Poseidon adalah putra Cronus dan Rhea, salah satu dari tiga bersaudara laki-laki yang selamat dari upaya ayahnya menelan anak-anaknya, dan seperti Hades, ia dimuntahkan kembali oleh Cronus setelah Zeus memaksanya melalui tipu daya Metis. Setelah kemenangan para Olympian dalam Titanomachy, ketiga bersaudara membagi alam semesta melalui undian, dan Poseidon mendapatkan lautan serta seluruh perairan dunia sebagai wilayah kekuasaannya. Ia kemudian membangun istananya di dasar laut dan menjadi salah satu dewa paling berkuasa di jajaran Olympian, sering disebut sebagai saudara yang sejajar kekuatannya dengan Zeus, meski kekuasaannya terbatas pada ranah perairan dan daratan yang bergetar.

Sebagai penguasa lautan, Poseidon mengendalikan ombak, badai, dan gempa bumi—julukannya "Sang Penggetar Bumi" (Earth-Shaker) merujuk pada kekuatannya menggetarkan daratan dengan trisulanya. Ia juga dikenal sebagai pencipta kuda pertama dan pelindung para pelaut, sehingga trisula dan kuda menjadi simbol utamanya, melambangkan kekuatan liar sekaligus kendali atas alam yang tak terduga. Kepribadian Poseidon digambarkan temperamental dan mudah tersinggung, cepat murka ketika dihina namun juga bisa menjadi sekutu yang kuat bagi mereka yang dihormatinya, mencerminkan sifat laut itu sendiri yang bisa tenang sekaligus ganas.

Salah satu kisah paling terkenal tentang Poseidon adalah persaingannya dengan Athena untuk menjadi pelindung kota Athena, di mana ia menghadirkan mata air asin dengan trisulanya namun kalah dari pohon zaitun pemberian Athena, sebuah kekalahan yang menurut sebagian sumber membuatnya menyimpan dendam terhadap kota tersebut. Dalam Odyssey karya Homer, Poseidon menjadi musuh utama Odysseus setelah sang pahlawan membutakan putranya, Polyphemus sang Cyclops, sehingga ia mengirimkan badai demi badai untuk menghalangi perjalanan pulang Odysseus selama bertahun-tahun. Poseidon menikah dengan Amphitrite, salah satu Nereid, dan memiliki banyak keturunan baik dewa maupun makhluk mitologis, menjadikannya figur sentral dalam kehidupan maritim Yunani kuno yang bergantung pada laut untuk perdagangan, perang, dan kelangsungan hidup.''',
    storyEn: '''
Poseidon is a son of Cronus and Rhea, one of the three brothers who survived their father's attempts to swallow his children, and like Hades, he was disgorged by Cronus after Zeus forced the act through Metis's trickery. Following the Olympians' victory in the Titanomachy, the three brothers divided the cosmos by lot, and Poseidon received the sea and all the world's waters as his domain. He then built his palace beneath the ocean and became one of the most powerful deities among the Olympians, often described as a peer in strength to Zeus, though his authority remained confined to the waters and the trembling earth.

As ruler of the seas, Poseidon commands the waves, storms, and earthquakes, his epithet "Earth-Shaker" referring to his power to make the ground tremble with a strike of his trident. He is also credited with creating the first horse and is honored as protector of sailors, making the trident and the horse his principal symbols, representing both untamed force and mastery over an unpredictable natural world. Poseidon's personality is often depicted as temperamental and easily provoked, quick to anger when disrespected yet capable of being a powerful ally to those he favors, mirroring the sea itself, which can be calm one moment and violent the next.

One of the most famous myths involving Poseidon is his contest with Athena for patronage of the city of Athens, in which he struck the ground to produce a spring of salt water but lost to Athena's gift of the olive tree, a defeat that, according to some accounts, left him harboring resentment toward the city. In Homer's Odyssey, Poseidon becomes Odysseus's chief adversary after the hero blinds his son, the Cyclops Polyphemus, prompting Poseidon to send storm after storm to delay Odysseus's homeward journey for years. Poseidon married Amphitrite, one of the Nereids, and fathered numerous offspring among both gods and mythological creatures, making him a central figure in the maritime life of ancient Greece, a civilization deeply dependent on the sea for trade, warfare, and survival.''',
    imageUrl:
        'assets/images/Greek/Olympians/poseidon.webp',
    category: 'Olympian',
  ),
  God(
    id: '5',
    name: 'Apollo',
    mythology: 'Greek',
    title: 'Dewa Matahari & Musik',
    titleEn: 'God of the Sun & Music',
    symbol: '☀️',
    powers: ['Matahari', 'Musik', 'Ramalan', 'Penyembuhan', 'Panah'],
    powersEn: ['Sun', 'Music', 'Prophecy', 'Healing', 'Archery'],
    story: '''
Apollo adalah putra Zeus dan Leto, seorang Titanid, dilahirkan bersama saudari kembarnya Artemis di pulau kecil Delos setelah Leto lama mengembara mencari tempat berlindung karena dikejar kemarahan Hera yang cemburu. Menurut mitos, Delos adalah satu-satunya tempat yang mau menerima Leto karena pulau itu terapung dan tidak terikat pada daratan mana pun, sehingga tidak termasuk dalam larangan Hera. Setelah lahir, Apollo tumbuh dengan sangat cepat dan segera menunjukkan kekuatan ilahinya, termasuk membunuh ular raksasa Python yang menjaga Delphi, sebuah tindakan yang kemudian menjadikannya penguasa tempat suci paling penting dalam dunia Yunani kuno itu.

Apollo adalah dewa matahari, musik, ramalan, penyembuhan, dan panah, sebuah kombinasi kekuatan yang menjadikannya salah satu dewa paling serbaguna dan dihormati di Olympus. Ia membawa lira sebagai lambang keahliannya dalam musik dan busur panah sebagai lambang kekuatannya sebagai pemanah, sementara burung gagak, angsa, dan pohon laurel diasosiasikan dengannya dalam berbagai mitos. Melalui Oracle of Delphi, tempat pendeta wanita bernama Pythia menyampaikan ramalannya, Apollo menjadi sumber kebijaksanaan dan petunjuk ilahi bagi manusia. Kepribadiannya digambarkan sebagai sosok yang tampan, rasional, dan berorientasi pada keteraturan serta harmoni, mencerminkan mottonya "tidak berlebihan" yang terukir di kuilnya di Delphi.

Salah satu mitos paling terkenal tentang Apollo adalah pembunuhannya terhadap Python, ular raksasa yang menjaga celah bumi di Delphi, yang kemudian ia jadikan pusat pemujaannya dan tempat Oracle Delphi yang termasyhur. Ia juga terlibat dalam kisah tragis Daphne, seorang nimfa yang berubah menjadi pohon laurel untuk menghindari kejarannya, serta kisah Hyacinthus, seorang pemuda yang dicintainya namun tewas akibat kecelakaan saat berlatih lempar cakram. Sebagai saudara kembar Artemis dan putra kesayangan Zeus, Apollo memiliki hubungan erat dengan banyak dewa dan pahlawan, termasuk sebagai pelindung para penyair dan musisi melalui kepemimpinannya atas sembilan Muse, menjadikannya simbol abadi keindahan, seni, dan pencerahan dalam warisan budaya Barat.''',
    storyEn: '''
Apollo is the son of Zeus and Leto, a Titaness, born together with his twin sister Artemis on the small island of Delos after Leto wandered for a long time seeking refuge from the jealous wrath of Hera. According to myth, Delos was the only place willing to receive Leto because the island floated freely and was not fixed to any mainland, exempting it from Hera's decree. After his birth, Apollo grew with extraordinary speed and quickly displayed his divine power, including slaying the giant serpent Python that guarded Delphi, an act that later made him lord of the most important sanctuary in the ancient Greek world.

Apollo is the god of the sun, music, prophecy, healing, and archery, a combination of powers that makes him one of the most versatile and revered deities on Olympus. He carries a lyre as the emblem of his musical mastery and a bow as the symbol of his skill as an archer, while the crow, the swan, and the laurel tree are associated with him in various myths. Through the Oracle of Delphi, where a priestess called the Pythia delivered his prophecies, Apollo became a source of wisdom and divine guidance for humanity. His character is portrayed as handsome, rational, and oriented toward order and harmony, reflecting the motto "nothing in excess" inscribed at his temple in Delphi.

One of the most famous myths about Apollo is his slaying of Python, the giant serpent guarding the chasm at Delphi, which he then made the center of his worship and the site of the renowned Delphic Oracle. He also figures in the tragic tale of Daphne, a nymph who transformed into a laurel tree to escape his pursuit, and the story of Hyacinthus, a young man he loved who died in an accident during discus practice. As the twin brother of Artemis and a favored son of Zeus, Apollo maintains close ties with many gods and heroes, including his role as patron of poets and musicians through his leadership of the nine Muses, making him an enduring symbol of beauty, art, and enlightenment in Western cultural heritage.''',
    imageUrl:
        'assets/images/Greek/Olympians/apollo.webp',
    category: 'Olympian',
  ),
  God(
    id: '6',
    name: 'Artemis',
    mythology: 'Greek',
    title: 'Dewi Perburuan & Bulan',
    titleEn: 'Goddess of the Hunt & Moon',
    symbol: '🌙',
    powers: ['Perburuan', 'Bulan', 'Alam Liar', 'Panah', 'Perlindungan Perempuan'],
    powersEn: ['Hunting', 'Moon', 'Wilderness', 'Archery', 'Protection of Women'],
    story: '''
Artemis adalah putri Zeus dan Leto, lahir sebagai saudari kembar Apollo di pulau Delos, dan menurut sebagian versi mitos ia lahir lebih dulu lalu membantu ibunya melahirkan Apollo, sebuah alasan yang kemudian menjadikannya juga dewi yang diseru dalam proses persalinan. Sejak kecil, Artemis dikisahkan meminta kepada ayahnya, Zeus, agar diizinkan tetap perawan selamanya, memiliki busur dan panahnya sendiri, serta menguasai gunung dan hutan belantara sebagai wilayahnya, permintaan yang dikabulkan penuh oleh Zeus. Ia dibesarkan di alam liar bersama sekelompok nimfa pengiring yang juga bersumpah menjaga kesucian mereka, menjadikannya sosok independen yang memilih hidup jauh dari kehidupan sosial Olympus yang ramai.

Artemis adalah dewi perburuan, bulan, dan alam liar, dipuja sebagai pelindung hewan liar sekaligus pemburu ulung yang berkeliaran di hutan bersama rombongan nimfanya. Busur perak dan anak panahnya menjadi simbol utamanya, sementara rusa dan burung gagak sering diasosiasikan dengannya, dan cahaya bulan dipandang sebagai representasi kehadirannya di langit malam. Sebagai pelindung perempuan, khususnya dalam masa kehamilan dan kelahiran, Artemis memiliki kepribadian yang tegas, mandiri, dan sangat menjaga jarak, dikenal pula karena kemarahannya yang cepat dan hukuman berat bagi siapa pun yang melanggar kesuciannya atau menghina harga dirinya.

Salah satu kisah paling terkenal tentang Artemis adalah hukumannya terhadap pemburu Actaeon, yang secara tidak sengaja melihatnya mandi telanjang di hutan, sehingga Artemis mengubahnya menjadi rusa dan membiarkannya diburu serta dibunuh oleh anjing-anjingnya sendiri. Ia juga dikenal karena membunuh raksasa Orion, sahabat pemburunya, dalam versi mitos yang berbeda-beda, serta perannya menghukum Niobe yang menyombongkan diri atas banyaknya anak yang ia miliki dibanding Leto. Sebagai salah satu dari Tiga Dewi Perawan bersama Athena dan Hestia, Artemis tidak pernah menikah namun menjadi figur pelindung yang sangat dihormati bagi perempuan muda, pemburu, dan alam liar, dengan kuilnya di Ephesus—salah satu dari Tujuh Keajaiban Dunia Kuno—menjadi bukti luasnya pemujaan terhadapnya di dunia Yunani kuno.''',
    storyEn: '''
Artemis is the daughter of Zeus and Leto, born as the twin sister of Apollo on the island of Delos, and according to some versions of the myth she was born first and helped her mother deliver Apollo, which is why she is also invoked as a goddess of childbirth. As a young girl, Artemis is said to have asked her father, Zeus, to grant her eternal virginity, her own bow and arrows, and dominion over the mountains and wild forests, a request Zeus fully granted. She was raised in the wilderness accompanied by a band of nymphs who likewise vowed to preserve their chastity, making her an independent figure who chose to live apart from the bustling social life of Olympus.

Artemis is the goddess of the hunt, the moon, and the wilderness, worshipped as both protector of wild animals and a formidable huntress who roams the forests with her retinue of nymphs. Her silver bow and arrows are her principal emblems, while the deer and the crow are often associated with her, and moonlight is regarded as a representation of her presence in the night sky. As protector of women, particularly during pregnancy and childbirth, Artemis is portrayed as firm, self-reliant, and fiercely guarded, also known for her swift anger and severe punishment of anyone who violated her chastity or insulted her dignity.

One of the most famous myths about Artemis is her punishment of the hunter Actaeon, who accidentally saw her bathing naked in the forest, prompting her to transform him into a stag and let him be hunted down and killed by his own hounds. She is also credited, in various versions of the myth, with killing the giant Orion, her hunting companion, and with punishing Niobe, who boasted of having more children than Leto. As one of the Three Virgin Goddesses alongside Athena and Hestia, Artemis never married but became a deeply revered protector of young women, hunters, and the wild, with her temple at Ephesus, one of the Seven Wonders of the Ancient World, standing as evidence of the widespread devotion she commanded throughout the ancient Greek world.''',
    imageUrl:
        'assets/images/Greek/Olympians/artemis.webp',
    category: 'Olympian',
  ),
  God(
    id: '7',
    name: 'Ares',
    mythology: 'Greek',
    title: 'Dewa Perang',
    titleEn: 'God of War',
    symbol: '⚔️',
    powers: ['Perang', 'Keberanian', 'Kekuatan', 'Kekerasaan', 'Pertempuran'],
    powersEn: ['War', 'Bravery', 'Strength', 'Violence', 'Battle'],
    story: '''
Ares adalah putra Zeus dan Hera, lahir dari pasangan penguasa Olympus sebagai salah satu dari sedikit dewa Olympian yang merupakan anak sah dari kedua orang tua yang sama-sama dewa utama. Meski berasal dari keturunan tertinggi, Ares tidak pernah menjadi anak favorit di antara para dewa lain, bahkan orang tuanya sendiri; Zeus dalam Iliad karya Homer secara terbuka menyatakan bahwa Ares adalah anak yang paling ia benci di antara semua penghuni Olympus karena kegemarannya pada kekacauan dan pertumpahan darah. Ia tumbuh menjadi dewa perang yang ditakuti, namun keberadaannya di Olympus sering kali diwarnai konflik dengan dewa-dewi lain, khususnya Athena, yang mewakili aspek perang yang lebih terhormat dan strategis.

Ares adalah dewa perang yang mewujudkan sisi kekerasan, kebrutalan, dan kekacauan pertempuran, berbeda dari Athena yang mewakili strategi dan pertahanan yang terencana. Ia digambarkan mengenakan baju zirah lengkap dan membawa tombak, dengan burung nasar dan anjing sebagai hewan yang menyertainya di medan perang, melambangkan kematian dan kehancuran yang mengikuti langkahnya. Kepribadian Ares digambarkan sebagai sosok yang impulsif, haus darah, dan mudah terprovokasi, mencintai pertempuran demi pertempuran itu sendiri tanpa mempertimbangkan tujuan atau kehormatan yang lebih besar, sehingga ia sering dipandang sebagai simbol kekerasan yang tidak berguna dibanding kepahlawanan sejati.

Salah satu kisah paling terkenal tentang Ares adalah perselingkuhannya dengan Aphrodite, istri Hephaestus, yang berujung memalukan ketika Hephaestus memasang jaring logam tak terlihat di ranjangnya dan menjebak keduanya di depan seluruh dewa Olympian yang menertawakan mereka. Dalam Iliad, Ares turut berperang dalam Perang Troya di pihak Troya namun berulang kali dikalahkan, termasuk terluka oleh pahlawan manusia Diomedes yang dibantu Athena, menegaskan citranya sebagai dewa perang yang kuat secara fisik namun kalah dalam kebijaksanaan strategis. Meski demikian, Ares tetap menjadi figur penting dalam budaya Yunani sebagai perwujudan keberanian mentah dan kekuatan militer, dan bangsa Romawi kelak mengangkatnya dengan nama Mars menjadi salah satu dewa paling dihormati dalam pantheon mereka karena identitas Roma yang lekat dengan tradisi militer.''',
    storyEn: '''
Ares is the son of Zeus and Hera, born to the ruling couple of Olympus as one of the few Olympian gods who is the legitimate child of two major deities. Despite his exalted lineage, Ares was never a favored child among the other gods, not even his own parents; in Homer's Iliad, Zeus openly declares Ares to be the most hateful of all his children on Olympus because of his love of strife and bloodshed. He grew into a feared god of war, though his presence on Olympus was frequently marked by conflict with other deities, particularly Athena, who represents the more honorable and strategic aspect of warfare.

Ares is the god of war who embodies the violent, brutal, and chaotic side of battle, in contrast to Athena, who represents strategy and planned defense. He is depicted in full armor carrying a spear, with vultures and dogs as the creatures that accompany him on the battlefield, symbolizing the death and destruction that follow in his wake. Ares's personality is portrayed as impulsive, bloodthirsty, and easily provoked, loving combat for its own sake without regard for higher purpose or honor, which is why he is often viewed as a symbol of senseless violence rather than true heroism.

One of the most famous myths about Ares is his affair with Aphrodite, wife of Hephaestus, which ended in humiliation when Hephaestus rigged an invisible metal net over their bed and trapped the pair before all the Olympian gods, who laughed at their disgrace. In the Iliad, Ares fights in the Trojan War on the side of Troy but is repeatedly bested, including being wounded by the mortal hero Diomedes with Athena's assistance, reinforcing his image as a god of great physical power yet lacking in strategic wisdom. Nevertheless, Ares remained an important figure in Greek culture as the embodiment of raw courage and military force, and the Romans later elevated him, under the name Mars, into one of the most revered gods in their pantheon, owing to Rome's identity as a deeply militaristic civilization.''',
    imageUrl:
        'assets/images/Greek/Olympians/ares.webp',
    category: 'Olympian',
  ),
  God(
    id: '40',
    name: 'Cronus',
    mythology: 'Greek',
    title: 'Raja Para Titan',
    titleEn: 'King of the Titans',
    symbol: '⏳',
    powers: ['Waktu', 'Panen', 'Kekuasaan', 'Kepemimpinan', 'Takdir'],
    powersEn: ['Time', 'Harvest', 'Dominion', 'Leadership', 'Fate'],
    story: '''
Cronus adalah putra bungsu Uranus (Langit) dan Gaia (Bumi), dan menjadi pemimpin generasi Titan setelah ia mengebiri ayahnya sendiri, Uranus, menggunakan sabit bergerigi yang diberikan Gaia karena Uranus terus menindas dan mengurung anak-anaknya di dalam tubuh Gaia. Setelah menggulingkan Uranus, Cronus membebaskan saudara-saudaranya sesama Titan dan menjadi penguasa alam semesta pada Zaman Keemasan, sebuah era yang menurut mitos dipenuhi kedamaian dan kemakmuran tanpa perlu bekerja keras. Ia menikahi saudarinya sendiri, Rhea, dan bersama mereka melahirkan generasi pertama Olympian, meski ketakutannya akan ramalan bahwa salah satu anaknya akan menggulingkannya menyebabkannya menelan setiap bayi yang lahir.

Cronus adalah penguasa waktu, panen, dan kekuasaan tertinggi, dipuja pada masanya sebagai raja para dewa yang mengatur siklus musim dan pertanian pada Zaman Keemasan. Sabit atau arit menjadi senjata dan simbol utamanya, mengingatkan pada tindakannya mengebiri Uranus sekaligus perannya sebagai dewa panen yang menuai hasil bumi. Kepribadiannya digambarkan sebagai sosok yang kuat dan berwibawa di masa kejayaannya, namun juga paranoid dan kejam ketika dikuasai ketakutan akan kehilangan takhta, sebuah sifat yang akhirnya menjadi penyebab kejatuhannya sendiri. Ironisnya, dewa yang menguasai waktu ini pada akhirnya tidak mampu menghindari takdir yang telah diramalkan untuknya.

Kisah paling terkenal tentang Cronus adalah caranya menelan lima dari enam anaknya—Hestia, Demeter, Hera, Hades, dan Poseidon—segera setelah lahir karena takut akan ramalan Gaia dan Uranus bahwa ia akan digulingkan oleh anaknya sendiri, sebagaimana ia sendiri pernah menggulingkan Uranus. Rhea, yang berduka kehilangan anak-anaknya satu per satu, akhirnya menyelamatkan anak keenam, Zeus, dengan menipu Cronus menggunakan batu yang dibungkus kain, dan setelah dewasa Zeus kembali untuk memaksa Cronus memuntahkan saudara-saudaranya sebelum mengalahkannya dalam Titanomachy. Setelah kekalahannya, Cronus diasingkan, meski dalam sebagian versi mitos ia kemudian dibebaskan untuk memerintah sebuah kerajaan damai di Elysium, menjadikan kisahnya simbol abadi tentang siklus kekuasaan yang tak terelakkan antara generasi ayah dan anak.''',
    storyEn: '''
Cronus is the youngest son of Uranus (Sky) and Gaia (Earth), and became leader of the Titan generation after castrating his own father, Uranus, with a jagged sickle given to him by Gaia, who was distraught over Uranus continually oppressing and imprisoning their children within her body. After overthrowing Uranus, Cronus freed his fellow Titan siblings and became ruler of the cosmos during the Golden Age, an era myth describes as filled with peace and abundance without the need for toil. He married his own sister, Rhea, and together they produced the first generation of Olympians, though his fear of a prophecy that one of his children would overthrow him led him to swallow every infant born to them.

Cronus is the ruler of time, harvest, and supreme dominion, worshipped in his era as king of the gods who governed the cycle of seasons and agriculture during the Golden Age. A sickle or scythe is his principal weapon and symbol, recalling both his act of castrating Uranus and his role as a harvest god reaping the earth's bounty. His personality is portrayed as powerful and commanding at the height of his reign, yet also paranoid and ruthless when gripped by fear of losing his throne, a trait that ultimately caused his own downfall. Ironically, this god who governed time itself was ultimately unable to escape the fate prophesied for him.

The most famous myth about Cronus is his swallowing of five of his six children, Hestia, Demeter, Hera, Hades, and Poseidon, immediately after their birth, out of fear of the prophecy from Gaia and Uranus that he would be overthrown by his own child, just as he himself had once overthrown Uranus. Rhea, grieving the loss of her children one by one, eventually saved her sixth child, Zeus, by deceiving Cronus with a stone wrapped in cloth, and once grown Zeus returned to force Cronus to disgorge his siblings before defeating him in the Titanomachy. After his defeat, Cronus was banished, though in some versions of the myth he was later freed to rule over a peaceful realm in Elysium, making his story an enduring symbol of the inevitable cycle of power between generations of father and child.''',
    imageUrl: 'assets/images/Greek/Titans/cronus.webp',
    category: 'Titan',
  ),
  God(
    id: '201',
    name: 'Kratos',
    mythology: 'Greek',
    title: 'Dewa Kekuatan & Kekuasaan',
    titleEn: 'God of Strength & Power',
    symbol: '\U0001F4AA',
    powers: ['Kekuatan', 'Kekuasaan', 'Ketangguhan', 'Ketahanan', 'Otoritas'],
    powersEn: ['Strength', 'Power', 'Might', 'Endurance', 'Authority'],
    story: '''
Kratos adalah personifikasi kekuatan dan kekuasaan dalam mitologi Yunani, salah satu abdi setia Zeus. Bersama saudaranya Bia (Kekerasan), Zelos (Semangat), dan Nike (Kemenangan), Kratos membentuk lingkaran pengawal pribadi Zeus yang menjalankan perintah raja para dewa dengan keteguhan dan kekuatan yang tak tertandingi.

Dalam mitologi Yunani kuno, Kratos tidak memiliki kisah independennya sendiri, melainkan muncul sebagai tokoh pendukung dalam drama Aeschylus berjudul Prometheus Bound. Dalam drama itu, Kratos diutus oleh Zeus bersama Bia untuk mengikat Prometheus pada Gunung Kaukasus sebagai hukuman karena telah mencuri api dan memberikannya kepada manusia. Kratos menjalankan tugasnya tanpa belas kasihan, menggambarkan wujud kekuasaan otoriter yang taat pada perintah atasan tanpa mempertanyakan keadilannya.

Sebagai simbol kekuatan murni, Kratos melambangkan konsep Yunani kuno tentang kekuasaan yang tak terbendung namun juga tunduk pada otoritas yang lebih tinggi. Ia tidak memiliki kehendak sendiri, hanya kekuatan untuk melaksanakan kehendak Zeus. Dalam budaya populer modern, terutama seri game God of War, nama Kratos dipinjam untuk karakter utama, meskipun versi game ini adalah interpretasi fiksi yang sangat berbeda dari mitos aslinya. Dalam tradisi kuno, Kratos tetap menjadi pengingat bahwa kekuatan terbesar pun harus tunduk pada tatanan kosmis yang ditetapkan oleh Zeus.
''',
    storyEn: '''
Kratos is the personification of strength and power in Greek mythology, one of the loyal enforcers of Zeus. Together with his siblings Bia (Violence), Zelos (Zeal), and Nike (Victory), Kratos formed Zeus's personal guard, executing the king of the gods' commands with unmatched tenacity and force.

In ancient Greek mythology, Kratos does not have an independent story of his own, but appears as a supporting figure in Aeschylus's play Prometheus Bound. In this drama, Kratos is sent by Zeus alongside Bia to bind Prometheus to Mount Caucasus as punishment for stealing fire and giving it to humanity. Kratos carries out his task without mercy, embodying the image of authoritarian power that obeys a superior's commands without questioning their justice.

As a symbol of pure strength, Kratos represents the ancient Greek concept of irresistible power that nonetheless submits to a higher authority. He has no will of his own, only the strength to carry out Zeus's will. In modern popular culture, particularly the God of War game series, the name Kratos was borrowed for the main character, though this game version is a fictional interpretation very different from the original myth. In ancient tradition, Kratos remains a reminder that even the greatest power must submit to the cosmic order established by Zeus.
''',
    imageUrl: 'assets/images/Mythic/kratos.webp',
    category: 'Titan',
  ),
  God(
    id: '10',
    name: 'Hephaestus',
    mythology: 'Greek',
    title: 'Dewa Api & Tempa',
    titleEn: 'God of Fire & Forge',
    symbol: '🔥',
    powers: ['Api', 'Pandai Besi', 'Teknologi', 'Kerajinan', 'Senjata Dewa'],
    powersEn: ['Fire', 'Smithing', 'Technology', 'Craftsmanship', 'Divine Weapons'],
    story: '''
Hephaestus adalah putra Zeus dan Hera menurut sebagian besar sumber, meski dalam Theogony karya Hesiod ia disebutkan lahir dari Hera seorang diri sebagai balasan atas kelahiran Athena dari Zeus tanpa keterlibatannya. Karena terlahir cacat atau menurut versi lain dilempar dari Olympus oleh Hera yang malu dengan kondisi fisiknya, Hephaestus jatuh ke laut dan diselamatkan oleh dewi laut Thetis dan Eurynome, yang membesarkannya secara diam-diam selama bertahun-tahun. Setelah dewasa dan menunjukkan bakat luar biasa dalam pandai besi, Hephaestus akhirnya kembali ke Olympus, dan meski hubungannya dengan Hera tetap rumit, ia diterima kembali sebagai salah satu dari dua belas dewa Olympian utama.

Hephaestus adalah dewa api, pandai besi, dan teknologi, dikenal sebagai pengrajin paling terampil di antara para dewa yang menciptakan senjata dan perhiasan ilahi di bengkelnya, termasuk petir Zeus, baju zirah Achilles, dan mahkota Aphrodite. Palu, landasan, dan api menjadi simbol utamanya, sementara ia bekerja dibantu para automaton logam ciptaannya sendiri yang bisa bergerak dan berpikir layaknya makhluk hidup, menunjukkan kejeniusan tekniknya yang jauh melampaui zamannya. Berbeda dari kebanyakan dewa Olympian yang digambarkan sempurna secara fisik, Hephaestus digambarkan pincang namun memiliki kepribadian yang pekerja keras, sabar, dan rendah hati, mencerminkan nilai kerja keras dan keterampilan tangan dalam masyarakat Yunani kuno.

Salah satu kisah paling terkenal tentang Hephaestus adalah caranya membalas dendam terhadap Hera dengan mengirimkan sebuah takhta emas yang terlihat indah namun terperangkap mekanisme rahasia, yang mengunci Hera begitu ia duduk di atasnya hingga Dionysus berhasil membujuk Hephaestus turun dari pengasingannya untuk membebaskannya. Ia menikah dengan Aphrodite atas perjodohan Zeus, namun pernikahan itu diwarnai perselingkuhan Aphrodite dengan Ares, yang berhasil ia tangkap basah menggunakan jaring logam tak terlihat ciptaannya sendiri di hadapan seluruh dewa Olympian. Sebagai pencipta banyak senjata dan artefak legendaris yang digunakan para pahlawan besar seperti Achilles dan Heracles, Hephaestus menjadi simbol abadi keahlian teknis dan kreativitas manusia, dihormati secara khusus oleh para pengrajin dan pandai besi di seluruh dunia Yunani kuno.''',
    storyEn: '''
Hephaestus is the son of Zeus and Hera according to most sources, though Hesiod's Theogony states that Hera bore him alone in retaliation for Zeus giving birth to Athena without her involvement. Because he was born with a physical disability, or according to another version because Hera, ashamed of his appearance, hurled him from Olympus, Hephaestus fell into the sea and was rescued by the sea goddesses Thetis and Eurynome, who raised him secretly for many years. Once grown and having shown extraordinary talent in metalworking, Hephaestus eventually returned to Olympus, and although his relationship with Hera remained complicated, he was accepted back as one of the twelve principal Olympian gods.

Hephaestus is the god of fire, smithing, and technology, renowned as the most skilled craftsman among the gods, creating divine weapons and jewelry in his forge, including Zeus's thunderbolt, Achilles's armor, and Aphrodite's crown. The hammer, anvil, and fire are his principal symbols, and he works with the aid of metal automatons of his own invention that can move and think as if alive, showcasing an engineering genius far ahead of his time. Unlike most Olympians, who are depicted as physically flawless, Hephaestus is portrayed as lame, yet possessing a hardworking, patient, and humble personality, reflecting the value ancient Greek society placed on labor and craftsmanship.

One of the most famous myths about Hephaestus recounts how he took revenge on Hera by sending her a beautiful golden throne rigged with a hidden mechanism that trapped her the moment she sat upon it, a predicament resolved only when Dionysus persuaded Hephaestus, living in self-imposed exile, to come free her. He married Aphrodite through an arrangement made by Zeus, but the marriage was marked by Aphrodite's affair with Ares, whom he caught in the act using an invisible metal net of his own design in front of the assembled Olympian gods. As the creator of many legendary weapons and artifacts wielded by great heroes such as Achilles and Heracles, Hephaestus stands as an enduring symbol of technical skill and human creativity, especially honored by craftsmen and blacksmiths throughout the ancient Greek world.''',
    imageUrl: 'assets/images/Greek/Olympians/hephaestus.webp',
    category: 'Olympian',
  ),
  God(
    id: '9',
    name: 'Hermes',
    mythology: 'Greek',
    title: 'Utusan Para Dewa',
    titleEn: 'Messenger of the Gods',
    symbol: '🪶',
    powers: ['Kecepatan', 'Komunikasi', 'Perdagangan', 'Kecerdikan', 'Panduan Jiwa'],
    powersEn: ['Speed', 'Communication', 'Trade', 'Cunning', 'Psychopomp'],
    story: '''
Hermes adalah putra Zeus dan Maia, salah satu dari tujuh Pleiades yang merupakan putri Titan Atlas, dilahirkan secara diam-diam di sebuah gua di Gunung Cyllene, Arcadia. Menurut Hymn Homer untuk Hermes, ia menunjukkan kecerdikannya sejak hari pertama kelahirannya: pada pagi hari ia sudah keluar dari buaian, menciptakan lira pertama dari cangkang kura-kura, dan pada malam harinya berhasil mencuri kawanan sapi suci milik Apollo tanpa meninggalkan jejak yang bisa dilacak. Kecerdikan luar biasa ini segera membuatnya diterima ke dalam jajaran Olympian, dan sebagai balasan atas pencurian sapi tersebut, ia memberikan lira ciptaannya kepada Apollo sebagai tanda perdamaian, yang kemudian menjadi salah satu instrumen paling ikonik milik Apollo.

Hermes adalah dewa kecepatan, komunikasi, perdagangan, dan kecerdikan, sekaligus bertugas sebagai utusan resmi para dewa yang menyampaikan pesan antara Olympus, dunia manusia, dan bahkan dunia bawah. Ia mengenakan sandal bersayap dan topi bersayap yang memungkinkannya bergerak secepat kilat, serta membawa tongkat caduceus yang dililit dua ular sebagai simbol perdamaian dan negosiasi. Sebagai pemandu jiwa (psychopomp), Hermes juga bertugas mengantar arwah orang mati menuju dunia bawah, peran yang menjadikannya satu-satunya dewa yang bisa bergerak bebas di antara ketiga alam: langit, bumi, dan dunia bawah. Kepribadiannya digambarkan cerdik, lincah, dan pandai bernegosiasi, sering digambarkan sebagai penengah yang licik namun jarang berniat jahat sungguhan.

Selain kisah pencurian sapi Apollo yang terkenal, Hermes juga berperan penting dalam banyak mitos lain, termasuk membantu Perseus dengan memberikan sandal bersayap dalam misinya mengalahkan Medusa, serta memandu Persephone kembali dari dunia bawah menuju ibunya, Demeter, setiap tahun. Sebagai dewa perdagangan dan pelindung para pelancong, pedagang, dan bahkan pencuri, Hermes dihormati luas oleh masyarakat Yunani kuno yang mendirikan patung batas jalan bernama herma untuk memohon perlindungannya dalam perjalanan. Hubungannya yang dekat dengan Zeus sebagai anak kesayangan serta perannya sebagai penghubung antar dunia menjadikan Hermes salah satu dewa paling serbaguna dan dicintai, yang warisannya bertahan dalam istilah modern seperti "hermetik" dan berbagai simbol perdagangan yang masih menggunakan tongkat caduceus.''',
    storyEn: '''
Hermes is the son of Zeus and Maia, one of the seven Pleiades and daughter of the Titan Atlas, born in secret in a cave on Mount Cyllene in Arcadia. According to the Homeric Hymn to Hermes, he displayed his cunning from the very day of his birth: by morning he had already climbed out of his cradle and invented the first lyre from a tortoise shell, and by nightfall he had stolen Apollo's sacred cattle without leaving a traceable trail. This extraordinary cleverness quickly earned him a place among the Olympians, and in recompense for the cattle theft, he gave his newly invented lyre to Apollo as a peace offering, which became one of Apollo's most iconic instruments.

Hermes is the god of speed, communication, trade, and cunning, serving as the official messenger of the gods who carries messages between Olympus, the mortal world, and even the underworld. He wears winged sandals and a winged cap that allow him to move with lightning speed, and he carries the caduceus, a staff entwined with two serpents symbolizing peace and negotiation. As a psychopomp, Hermes is also tasked with guiding the souls of the dead to the underworld, a role that makes him the only god able to move freely among all three realms of sky, earth, and the underworld. His personality is portrayed as clever, quick, and skilled at negotiation, often depicted as a shrewd mediator who rarely bears genuine malice.

Beyond the famous theft of Apollo's cattle, Hermes plays a significant role in many other myths, including aiding Perseus with winged sandals for his quest to defeat Medusa, and guiding Persephone back from the underworld to her mother, Demeter, each year. As the god of trade and protector of travelers, merchants, and even thieves, Hermes was widely honored by the ancient Greeks, who erected roadside boundary markers called herms to seek his protection while journeying. His close bond with Zeus as a favored son and his role as a connector between worlds make Hermes one of the most versatile and beloved gods, his legacy enduring in modern terms such as "hermetic" and in the caduceus, still used today as a symbol of commerce.''',
    imageUrl:
        'assets/images/Greek/Olympians/hermes.webp',
    category: 'Olympian',
  ),
  God(
    id: '8',
    name: 'Aphrodite',
    mythology: 'Greek',
    title: 'Dewi Cinta & Kecantikan',
    titleEn: 'Goddess of Love & Beauty',
    symbol: '💞',
    powers: ['Cinta', 'Kecantikan', 'Kesuburan', 'Hasrat', 'Pesona'],
    powersEn: ['Love', 'Beauty', 'Fertility', 'Desire', 'Charm'],
    story: '''
Menurut Theogony karya Hesiod, Aphrodite lahir dengan cara yang tidak biasa: ketika Cronus mengebiri ayahnya, Uranus, dan melemparkan alat kelaminnya ke laut, buih yang terbentuk di sekitarnya melahirkan Aphrodite, yang kemudian muncul dari ombak di dekat pulau Cyprus dalam wujud dewi dewasa yang sempurna. Karena asal-usul ini, Aphrodite sebenarnya tergolong generasi yang lebih tua dari para Olympian keturunan Cronus dan Rhea, meski ia tetap diterima sebagai salah satu dari dua belas dewa utama Olympus. Versi mitos lain, terutama dalam tradisi Homer, menyebutnya sebagai putri Zeus dan Dione, namun kisah kelahirannya dari buih laut tetap menjadi versi yang paling dikenal luas dan menjadi inspirasi karya seni klasik seperti lukisan "The Birth of Venus".

Aphrodite adalah dewi cinta, kecantikan, kesuburan, dan hasrat, dipuja karena kekuatannya yang mampu memikat hati dewa maupun manusia serta mempengaruhi jalannya banyak peristiwa besar dalam mitologi Yunani hanya melalui daya tarik dan pesonanya. Burung merpati dan angsa menjadi hewan sucinya, sementara mawar dan pohon murad diasosiasikan dengannya sebagai simbol keindahan dan cinta abadi. Ia memiliki ikat pinggang ajaib bernama kestos himas yang mampu membuat siapa pun yang melihatnya jatuh cinta, dan kepribadiannya digambarkan sebagai sosok yang menawan namun juga posesif dan mudah cemburu, sering terlibat dalam intrik cinta yang memengaruhi nasib para dewa dan manusia.

Salah satu kisah paling terkenal tentang Aphrodite adalah perannya dalam Penghakiman Paris, ketika ia menjanjikan cinta wanita tercantik di dunia, Helen dari Sparta, kepada pangeran Troya bernama Paris sebagai imbalan atas gelar dewi tercantik, sebuah janji yang pada akhirnya memicu meletusnya Perang Troya. Ia dinikahkan oleh Zeus dengan Hephaestus, dewa pandai besi yang pincang, namun tetap menjalin hubungan asmara dengan Ares yang berujung memalukan ketika keduanya tertangkap basah dalam jebakan jaring Hephaestus. Sebagai ibu dari Eros, dewa cinta asmara, dan tokoh sentral dalam berbagai kisah cinta serta konflik mitologis, Aphrodite tetap menjadi simbol abadi kecantikan dan gairah dalam warisan budaya Yunani, yang kelak diwarisi oleh bangsa Romawi melalui sosok Venus.''',
    storyEn: '''
According to Hesiod's Theogony, Aphrodite was born in an extraordinary way: when Cronus castrated his father, Uranus, and cast his severed genitals into the sea, the foam that gathered around them gave rise to Aphrodite, who emerged from the waves near the island of Cyprus as a fully formed, adult goddess. Because of this origin, Aphrodite technically belongs to an older generation than the Olympians descended from Cronus and Rhea, though she was nonetheless accepted as one of the twelve principal deities of Olympus. An alternate tradition, especially in Homer, describes her as the daughter of Zeus and Dione, but the tale of her birth from sea foam remains the most widely known version and has inspired classical artworks such as "The Birth of Venus."

Aphrodite is the goddess of love, beauty, fertility, and desire, revered for her power to captivate the hearts of gods and mortals alike and to influence the course of major events in Greek mythology through attraction and charm alone. The dove and the swan are her sacred creatures, while the rose and the myrtle tree are associated with her as symbols of beauty and eternal love. She possesses a magical girdle called the kestos himas, capable of making anyone who beholds it fall in love, and her personality is portrayed as enchanting yet also possessive and easily jealous, frequently entangled in romantic intrigues that shape the fate of gods and mortals.

One of the most famous myths about Aphrodite is her role in the Judgment of Paris, in which she promised the love of the most beautiful woman in the world, Helen of Sparta, to the Trojan prince Paris in exchange for being named the fairest goddess, a promise that ultimately triggered the outbreak of the Trojan War. She was married by Zeus to Hephaestus, the lame god of the forge, yet carried on an affair with Ares that ended in humiliation when the pair were caught in Hephaestus's trap of an invisible net. As the mother of Eros, the god of romantic love, and a central figure in numerous myths of passion and conflict, Aphrodite remains an enduring symbol of beauty and desire in Greek cultural heritage, later inherited by the Romans through the figure of Venus.''',
    imageUrl:
        'assets/images/Greek/Olympians/aphrodite.webp',
    category: 'Olympian',
  ),
  God(
    id: '37',
    name: 'Hera',
    mythology: 'Greek',
    title: 'Ratu Para Dewa',
    titleEn: 'Queen of the Gods',
    symbol: '👑',
    powers: ['Pernikahan', 'Keluarga', 'Kesetiaan', 'Kelahiran', 'Kerajaan'],
    powersEn: ['Marriage', 'Family', 'Fidelity', 'Childbirth', 'Sovereignty'],
    story: '''
Hera adalah putri Cronus dan Rhea, salah satu dari enam bersaudara generasi pertama Olympian, dan seperti saudara-saudaranya, ia sempat ditelan oleh ayahnya sendiri sebelum akhirnya dimuntahkan kembali setelah Zeus mengalahkan Cronus. Setelah kemenangan para Olympian dalam Titanomachy, Hera menjadi salah satu dewi paling dihormati di Olympus, dan setelah melalui masa pacaran yang menurut mitos melibatkan tipu daya Zeus yang menyamar sebagai burung kukuk yang kedinginan untuk menarik simpatinya, Hera akhirnya menikah dengan Zeus dan dinobatkan sebagai ratu para dewa.

Hera adalah dewi pernikahan, keluarga, dan kelahiran, dipuja sebagai pelindung institusi pernikahan dan kesetiaan, meski ironisnya pernikahannya sendiri dengan Zeus penuh gejolak akibat perselingkuhan sang suami. Burung merak dan sapi menjadi hewan sucinya, melambangkan keanggunan dan kesuburan, sementara mahkota yang selalu ia kenakan menegaskan statusnya sebagai ratu Olympus. Kepribadian Hera digambarkan agung, berwibawa, namun juga pencemburu dan pendendam, terutama terhadap kekasih-kekasih Zeus dan anak-anak hasil perselingkuhannya, sebuah sifat yang mendorong banyak kisah balas dendamnya dalam mitologi Yunani.

Salah satu kisah paling terkenal tentang kemarahan Hera adalah penganiayaannya terhadap Heracles, putra Zeus dari seorang wanita fana bernama Alcmene, yang ia kirimi dua ular berbisa saat masih bayi dan kemudian membuatnya menjalani Dua Belas Tugas Berat sebagai hukuman atas kegilaan yang Hera sebabkan padanya. Ia juga berperan penting dalam Perang Troya dengan mendukung pihak Yunani karena kebenciannya terhadap Paris, yang tidak memilihnya sebagai dewi tercantik dalam Penghakiman Paris. Sebagai ratu Olympus dan pelindung pernikahan, Hera tetap menjadi figur sentral dalam struktur kekuasaan para dewa, dan kota Argos serta Samos menjadi pusat pemujaannya yang paling penting di dunia Yunani kuno, dengan kuil-kuil megah yang dibangun untuk menghormatinya.''',
    storyEn: '''
Hera is the daughter of Cronus and Rhea, one of the six siblings of the first generation of Olympians, and like her brothers and sisters, she was swallowed by her own father before being disgorged after Zeus defeated Cronus. Following the Olympians' victory in the Titanomachy, Hera became one of the most honored goddesses on Olympus, and after a courtship that, according to myth, involved Zeus disguising himself as a shivering cuckoo to win her sympathy, Hera eventually married Zeus and was crowned queen of the gods.

Hera is the goddess of marriage, family, and childbirth, worshipped as protector of the institution of marriage and fidelity, though ironically her own marriage to Zeus was marked by turmoil stemming from her husband's infidelities. The peacock and the cow are her sacred animals, symbolizing elegance and fertility, while the crown she always wears affirms her status as queen of Olympus. Hera's personality is portrayed as majestic and dignified, yet also jealous and vengeful, particularly toward Zeus's lovers and the children born of his affairs, a trait that drives many of her acts of retribution throughout Greek mythology.

One of the most famous accounts of Hera's wrath is her persecution of Heracles, Zeus's son by the mortal woman Alcmene, whom she sent two venomous serpents to kill as an infant and later afflicted with a fit of madness that led to his undertaking the Twelve Labors as penance. She also played a significant role in the Trojan War, supporting the Greek side out of resentment toward Paris, who had failed to choose her as the fairest goddess in the Judgment of Paris. As queen of Olympus and protector of marriage, Hera remained a central figure in the divine hierarchy, and the cities of Argos and Samos became her most important centers of worship in the ancient Greek world, home to magnificent temples built in her honor.''',
    imageUrl: 'assets/images/Greek/Olympians/hera.webp',
    category: 'Olympian',
  ),
  God(
    id: '38',
    name: 'Demeter',
    mythology: 'Greek',
    title: 'Dewi Panen & Kesuburan',
    titleEn: 'Goddess of Harvest & Fertility',
    symbol: '🌾',
    powers: ['Panen', 'Pertanian', 'Kesuburan', 'Musim', 'Bumi'],
    powersEn: ['Harvest', 'Agriculture', 'Fertility', 'Seasons', 'Earth'],
    story: '''
Demeter adalah putri Cronus dan Rhea, saudari dari Zeus, Hades, Poseidon, Hera, dan Hestia, yang seperti saudara-saudaranya sempat ditelan oleh Cronus sebelum dimuntahkan kembali setelah kekalahannya dalam Titanomachy. Sebagai salah satu dewi generasi pertama Olympian, Demeter memegang peran penting sejak awal terbentuknya tatanan dunia baru di bawah kepemimpinan Zeus, meski ia lebih memilih untuk fokus mengurus kesuburan bumi dan pertanian dibanding terlibat dalam intrik kekuasaan Olympus. Dari hubungannya dengan Zeus, saudaranya sendiri, lahirlah Persephone, putri yang kelak menjadi pusat mitos paling terkenal tentang Demeter.

Demeter adalah dewi panen, pertanian, dan kesuburan bumi, dipuja oleh masyarakat agraris Yunani kuno sebagai sumber kehidupan karena kekuatannya mengatur pertumbuhan tanaman dan kesuburan tanah. Gandum dan bunga poppy menjadi simbolnya, mewakili panen dan siklus kehidupan-kematian-kelahiran kembali, sementara babi juga sering dikaitkan dengannya dalam ritual pemujaan kuno. Kepribadian Demeter digambarkan sebagai sosok keibuan, penyayang, namun juga sangat berduka dan bisa menjadi keras ketika kehilangan atau terluka, sebagaimana tampak jelas dalam mitos paling terkenalnya. Ia juga menjadi pusat Misteri Eleusis, salah satu ritual keagamaan paling rahasia dan dihormati dalam sejarah Yunani kuno.

Kisah paling terkenal tentang Demeter adalah kesedihannya yang mendalam ketika putrinya, Persephone, diculik oleh Hades untuk dijadikan ratu dunia bawah; dalam duka dan amarahnya, Demeter membiarkan seluruh bumi menjadi tandus dan gagal panen, memaksa Zeus turun tangan untuk menegosiasikan kembalinya Persephone. Kesepakatan yang dicapai—bahwa Persephone akan menghabiskan sepertiga tahun di dunia bawah bersama Hades dan sisanya bersama ibunya—menjadi mitos asal-usul pergantian musim, dengan musim dingin merepresentasikan kesedihan Demeter saat berpisah dari putrinya. Melalui mitos ini serta perannya sebagai pendiri Misteri Eleusis yang mengajarkan tentang kehidupan setelah kematian, Demeter menjadi salah satu dewi paling dihormati dalam kehidupan spiritual dan pertanian masyarakat Yunani kuno, melambangkan hubungan tak terpisahkan antara alam, kesuburan, dan kasih seorang ibu.''',
    storyEn: '''
Demeter is the daughter of Cronus and Rhea, sister to Zeus, Hades, Poseidon, Hera, and Hestia, and like her siblings she was swallowed by Cronus before being disgorged following his defeat in the Titanomachy. As one of the first-generation Olympian goddesses, Demeter held an important role from the very beginning of the new world order established under Zeus's leadership, though she preferred to focus on the earth's fertility and agriculture rather than engage in the power struggles of Olympus. From her union with Zeus, her own brother, came Persephone, the daughter who would later become the center of Demeter's most famous myth.

Demeter is the goddess of harvest, agriculture, and the earth's fertility, worshipped by the agrarian society of ancient Greece as a source of life because of her power to govern the growth of crops and the fruitfulness of the soil. Wheat and the poppy flower are her symbols, representing harvest and the cycle of life, death, and rebirth, while the pig is also frequently associated with her in ancient ritual worship. Demeter's personality is portrayed as maternal and nurturing, yet also capable of deep grief and severity when wounded or bereaved, as clearly shown in her most famous myth. She is also central to the Eleusinian Mysteries, one of the most secretive and revered religious rites in ancient Greek history.

The most famous myth about Demeter is her profound grief when her daughter, Persephone, was abducted by Hades to become queen of the underworld; in her sorrow and anger, Demeter let the entire earth turn barren and crops fail, forcing Zeus to intervene and negotiate Persephone's return. The agreement reached, that Persephone would spend a third of the year in the underworld with Hades and the rest with her mother, became the origin myth for the changing seasons, with winter representing Demeter's grief during her separation from her daughter. Through this myth, along with her role as founder of the Eleusinian Mysteries, which taught initiates about the afterlife, Demeter became one of the most revered goddesses in the spiritual and agricultural life of ancient Greece, symbolizing the inseparable bond between nature, fertility, and a mother's love.''',
    imageUrl: 'assets/images/Greek/Olympians/demeter.webp',
    category: 'Olympian',
  ),
  God(
    id: '39',
    name: 'Dionysus',
    mythology: 'Greek',
    title: 'Dewa Anggur & Pesta',
    titleEn: 'God of Wine & Festivity',
    symbol: '🍇',
    powers: ['Anggur', 'Pesta', 'Ekstase', 'Teater', 'Kesuburan'],
    powersEn: ['Wine', 'Festivity', 'Ecstasy', 'Theater', 'Fertility'],
    story: '''
Dionysus adalah putra Zeus dan Semele, seorang putri fana dari Thebes, dan kelahirannya tergolong paling tidak biasa di antara semua dewa Olympian. Semele, yang terpedaya oleh Hera yang cemburu untuk meminta Zeus menampakkan wujud aslinya, tewas terbakar oleh kilauan ilahi Zeus, namun Zeus berhasil menyelamatkan janin yang dikandungnya dan menjahitnya ke dalam pahanya sendiri hingga cukup bulan untuk dilahirkan—karena itu Dionysus dijuluki "yang lahir dua kali". Setelah lahir, ia dititipkan kepada para nimfa Gunung Nysa untuk dibesarkan secara rahasia demi melindunginya dari kemarahan Hera yang terus mengejarnya hingga dewasa.

Dionysus adalah dewa anggur, pesta, ekstase, dan teater, dipuja karena kemampuannya membawa kegembiraan sekaligus kekacauan liar melalui minuman anggur dan perayaan yang penuh gairah. Pohon anggur dan ivy menjadi simbolnya, sementara macan tutul dan harimau sering digambarkan menemaninya sebagai lambang sisi liar dan tak terkendali dari alamnya. Dionysus juga dianggap sebagai bapak drama Yunani karena festival-festival pemujaannya, terutama Dionysia di Athena, menjadi asal-usul teater Yunani klasik. Kepribadiannya digambarkan ambivalen: di satu sisi ia membawa kegembiraan, kebebasan, dan pembebasan dari norma sosial, namun di sisi lain ia juga bisa menjadi sosok yang mengerikan dan membalas dendam terhadap siapa pun yang menolak pemujaannya.

Salah satu kisah paling terkenal tentang Dionysus adalah hukumannya terhadap Raja Pentheus dari Thebes, yang menolak mengakui kedewaannya dan melarang pemujaannya, sehingga Dionysus membuat ibu dan bibi-bibi Pentheus mengalami kegilaan ekstatik hingga secara tidak sengaja mencabik-cabik sang raja hidup-hidup, sebuah kisah yang diabadikan dalam drama tragedi "The Bacchae" karya Euripides. Ia juga dikenal karena menyelamatkan dan menikahi Ariadne, putri Raja Minos yang ditinggalkan sendirian di pulau Naxos setelah membantu Theseus mengalahkan Minotaur. Sebagai satu-satunya dewa Olympian dengan ibu manusia, Dionysus menjadi jembatan unik antara dunia fana dan dunia ilahi, dan warisannya bertahan hingga kini melalui tradisi teater Barat serta festival-festival anggur yang masih dirayakan di berbagai belahan dunia.''',
    storyEn: '''
Dionysus is the son of Zeus and Semele, a mortal princess of Thebes, and his birth is among the most unusual of all the Olympian gods. Semele, tricked by a jealous Hera into asking Zeus to reveal his true divine form, was consumed by the blinding radiance of his presence, but Zeus managed to save the unborn child and sewed him into his own thigh until he was ready to be born, which is why Dionysus is called "twice-born." After birth, he was entrusted to the nymphs of Mount Nysa to be raised in secret, protected from the wrath of Hera, who continued to pursue him into adulthood.

Dionysus is the god of wine, festivity, ecstasy, and theater, worshipped for his power to bring both joy and wild disorder through wine and passionate celebration. The grapevine and ivy are his symbols, while leopards and tigers are often depicted accompanying him as emblems of the untamed, uncontrollable side of his nature. Dionysus is also regarded as the father of Greek drama, since the festivals held in his honor, particularly the Dionysia in Athens, gave rise to classical Greek theater. His personality is portrayed as ambivalent: on one hand he brings joy, freedom, and liberation from social convention, but on the other he can become a terrifying and vengeful figure toward anyone who refuses to honor his worship.

One of the most famous myths about Dionysus is his punishment of King Pentheus of Thebes, who refused to acknowledge his divinity and banned his worship, prompting Dionysus to drive Pentheus's mother and aunts into ecstatic madness, causing them to unknowingly tear the king apart with their bare hands, a story immortalized in Euripides's tragedy "The Bacchae." He is also known for rescuing and marrying Ariadne, daughter of King Minos, who had been abandoned alone on the island of Naxos after helping Theseus defeat the Minotaur. As the only Olympian god with a mortal mother, Dionysus serves as a unique bridge between the mortal and divine worlds, and his legacy endures today through the tradition of Western theater and the wine festivals still celebrated in many parts of the world.''',
    imageUrl: 'assets/images/Greek/Olympians/dionysus.webp',
    category: 'Olympian',
  ),

  God(
    id: '41',
    name: 'Oceanus',
    mythology: 'Greek',
    title: 'Titan Samudra',
    titleEn: 'Titan of the Ocean',
    symbol: '🌊',
    powers: ['Samudra', 'Sungai', 'Air Dunia', 'Kehidupan Laut', 'Aliran'],
    powersEn: ['Ocean', 'Rivers', 'World-Waters', 'Sea Life', 'Currents'],
    story: '''
Oceanus adalah putra sulung Uranus (Langit) dan Gaia (Bumi), menjadikannya salah satu dari dua belas Titan generasi pertama dan yang tertua di antara saudara-saudaranya. Sebagai Titan tertua, Oceanus memerintah bersama saudarinya sekaligus istrinya, Tethys, atas sungai besar yang menurut kepercayaan Yunani kuno mengelilingi seluruh tepi dunia yang datar, sebuah aliran air raksasa yang menjadi sumber dari segala sungai, mata air, dan lautan di bumi. Berbeda dari kebanyakan Titan lain, Oceanus memilih untuk tidak terlibat dalam Titanomachy, perang besar antara Titan dan Olympian, sehingga ia dan keturunannya selamat dari hukuman yang menimpa sebagian besar Titan lainnya.

Oceanus adalah personifikasi dari samudra purba yang mengelilingi dunia, dipuja sebagai sumber dari seluruh air tawar dan air laut, termasuk sungai, danau, dan mata air yang mengalir dari batasnya yang tak terhingga. Ia sering digambarkan sebagai sosok setengah manusia setengah ular atau ikan raksasa dengan tanduk di kepalanya, melambangkan kekuatannya yang purba dan berbeda dari dewa laut generasi berikutnya seperti Poseidon. Bersama Tethys, Oceanus melahirkan ribuan Oceanid, para nimfa air tawar, serta para dewa sungai yang tersebar di seluruh dunia, menjadikannya salah satu leluhur paling produktif dalam mitologi Yunani. Kepribadiannya digambarkan tenang, bijaksana, dan cenderung netral, mencerminkan sifat air yang mengalir tanpa henti dan tidak memihak dalam konflik generasi para dewa.

Salah satu peran penting Oceanus dalam mitologi adalah statusnya sebagai kakek dari banyak dewa dan nimfa penting melalui putri-putrinya para Oceanid, termasuk Metis, istri pertama Zeus, dan Styx, dewi sungai dunia bawah yang sumpahnya dianggap paling suci di antara para dewa. Dalam Prometheus Bound karya Aeschylus, Oceanus digambarkan mengunjungi Prometheus yang dirantai untuk menawarkan nasihat agar tunduk kepada Zeus, menunjukkan kepribadiannya yang lebih memilih perdamaian dibanding konfrontasi terbuka. Sebagai representasi dari konsep geografis kuno tentang lautan yang mengelilingi dunia, Oceanus menjadi simbol penting dalam pemahaman kosmologi Yunani kuno, dan namanya bertahan hingga kini dalam istilah modern seperti "ocean" dalam bahasa Inggris.''',
    storyEn: '''
Oceanus is the eldest son of Uranus (Sky) and Gaia (Earth), making him one of the twelve first-generation Titans and the oldest among his siblings. As the eldest Titan, Oceanus ruled together with his sister and wife, Tethys, over the great river that, according to ancient Greek belief, encircled the entire rim of the flat earth, an immense flowing body of water regarded as the source of all rivers, springs, and seas on earth. Unlike most of the other Titans, Oceanus chose not to take part in the Titanomachy, the great war between the Titans and the Olympians, allowing him and his descendants to escape the punishment inflicted on most of the other Titans.

Oceanus is the personification of the primordial sea that encircles the world, worshipped as the source of all fresh and salt water, including the rivers, lakes, and springs that flow from his boundless expanse. He is often depicted as a being half-man and half-serpent or as a giant fish with horns upon his head, reflecting his primordial power distinct from later sea gods such as Poseidon. Together with Tethys, Oceanus fathered thousands of Oceanids, the freshwater nymphs, as well as the river gods found throughout the world, making him one of the most prolific ancestral figures in Greek mythology. His personality is portrayed as calm, wise, and largely neutral, mirroring the nature of water that flows endlessly and takes no side in the conflicts among generations of gods.

One of Oceanus's significant roles in mythology is his status as grandfather to many important gods and nymphs through his daughters, the Oceanids, including Metis, Zeus's first wife, and Styx, goddess of the underworld river whose oath was considered the most sacred among the gods. In Aeschylus's Prometheus Bound, Oceanus is depicted visiting the chained Prometheus to offer counsel that he submit to Zeus, revealing a personality that favors peace over open confrontation. As the embodiment of the ancient Greek geographical concept of a sea encircling the world, Oceanus holds an important place in the understanding of ancient Greek cosmology, and his name endures today in the modern English term "ocean."''',
    imageUrl: 'assets/images/Greek/Titans/oceanus.webp',
    category: 'Titan',
  ),
  God(
    id: '42',
    name: 'Iapetus',
    mythology: 'Greek',
    title: 'Titan Kefanaan',
    titleEn: 'Titan of Mortality',
    symbol: '🗡️',
    powers: ['Kefanaan', 'Kematian', 'Kerajinan', 'Umur Manusia', 'Keahlian'],
    powersEn: ['Mortality', 'Death', 'Craft', 'Human Lifespan', 'Skill'],
    story: '''
Iapetus adalah salah satu putra Uranus (Langit) dan Gaia (Bumi), tergolong dalam generasi pertama para Titan yang memerintah alam semesta sebelum era para Olympian. Ia menikah dengan Clymene atau menurut sebagian sumber dengan Asia, seorang Oceanid putri dari Oceanus dan Tethys, dan dari pernikahan ini lahirlah empat putra yang kelak memainkan peran penting dalam mitologi Yunani: Atlas, Prometheus, Epimetheus, dan Menoetius. Karena garis keturunannya yang menghasilkan tokoh-tokoh terkait nasib dan kehidupan manusia, Iapetus sering disebut sebagai "Titan Kefanaan", leluhur yang menghubungkan dunia para dewa dengan nasib umat manusia.

Iapetus dikaitkan dengan konsep kefanaan, kematian, dan umur manusia, sebuah domain yang tercermin dari peran anak-anaknya dalam mitos penciptaan dan nasib manusia—Prometheus yang menciptakan manusia dari tanah liat dan memberi mereka api, serta Atlas yang dihukum menopang langit sebagai akibat dari Titanomachy. Sumber-sumber kuno tidak banyak mencatat simbol atau atribut fisik khusus untuk Iapetus dibanding Titan lain, namun ia sering diasosiasikan dengan keterampilan dan kerajinan melalui garis keturunannya yang berhubungan erat dengan asal-usul teknologi dan pengetahuan manusia. Kepribadiannya dalam mitos digambarkan sebagai figur yang lebih pasif dibanding saudara-saudaranya, hadir terutama melalui kisah anak-anaknya dibanding tindakannya sendiri.

Iapetus turut serta dalam Titanomachy melawan para Olympian bersama sebagian besar Titan lainnya, dan setelah kekalahan mereka, ia dilemparkan ke Tartarus bersama para Titan pemberontak lainnya sebagai hukuman. Warisannya yang paling signifikan datang melalui putra-putranya: Prometheus, yang mencuri api dari Olympus untuk diberikan kepada manusia dan dihukum berat oleh Zeus karenanya, dan Atlas, yang dipaksa memikul langit di pundaknya selamanya. Melalui keturunan inilah Iapetus dianggap sebagai "bapak leluhur" umat manusia dalam beberapa tradisi Yunani kuno, menjadikannya figur penting meski tidak selalu tampil langsung dalam narasi utama mitologi, karena warisannya diteruskan melalui kisah-kisah anak-anaknya yang jauh lebih terkenal.''',
    storyEn: '''
Iapetus is one of the sons of Uranus (Sky) and Gaia (Earth), belonging to the first generation of Titans who ruled the cosmos before the age of the Olympians. He married Clymene, or according to some sources Asia, an Oceanid daughter of Oceanus and Tethys, and from this union came four sons who would play significant roles in Greek mythology: Atlas, Prometheus, Epimetheus, and Menoetius. Because his bloodline produced figures so closely tied to human fate and existence, Iapetus is often called the "Titan of Mortality," an ancestor linking the world of the gods to the destiny of humankind.

Iapetus is associated with the concepts of mortality, death, and the human lifespan, a domain reflected through the roles his sons played in the myths of human creation and fate, Prometheus, who shaped humans from clay and gave them fire, and Atlas, who was condemned to bear the sky as a consequence of the Titanomachy. Ancient sources record relatively few specific symbols or physical attributes for Iapetus compared to other Titans, though he is often associated with skill and craft through his lineage's close connection to the origins of human technology and knowledge. His personality in myth is portrayed as more passive than his siblings, appearing primarily through the stories of his sons rather than through his own actions.

Iapetus took part in the Titanomachy against the Olympians alongside most of the other Titans, and after their defeat, he was cast into Tartarus with the other rebellious Titans as punishment. His most significant legacy comes through his sons: Prometheus, who stole fire from Olympus to give to humanity and was severely punished by Zeus for it, and Atlas, who was forced to carry the heavens upon his shoulders for eternity. Through this lineage, Iapetus is regarded as a kind of ancestral father of humankind in some ancient Greek traditions, making him an important figure even though he rarely appears directly in the central mythological narratives, his legacy instead carried forward through the far more famous stories of his sons.''',
    imageUrl: 'assets/images/Greek/Titans/iapetus.webp',
    category: 'Titan',
  ),
  God(
    id: '43',
    name: 'Hyperion',
    mythology: 'Greek',
    title: 'Titan Cahaya Surgawi',
    titleEn: 'Titan of Heavenly Light',
    symbol: '☀️',
    powers: ['Cahaya', 'Matahari', 'Pengamatan', 'Langit', 'Terang'],
    powersEn: ['Light', 'Sun', 'Observation', 'Sky', 'Radiance'],
    story: '''
Hyperion adalah salah satu putra Uranus (Langit) dan Gaia (Bumi), termasuk dalam generasi pertama Titan yang memerintah sebelum era Olympian. Ia menikahi saudarinya sendiri, Theia, dewi cahaya ilahi, dan dari pernikahan ini lahir tiga anak yang menguasai benda-benda langit paling penting: Helios sang matahari, Selene sang bulan, dan Eos sang fajar. Karena garis keturunan inilah Hyperion dikenal sebagai leluhur dari seluruh cahaya langit, sosok yang namanya sendiri dalam bahasa Yunani kuno berarti "yang berjalan di atas" atau "yang mengamati dari atas", merujuk pada posisinya yang mengawasi pergerakan benda-benda langit.

Hyperion dikaitkan dengan cahaya surgawi, matahari, dan pengamatan langit, sebuah domain yang kemudian sebagian besar diwariskan kepada putranya, Helios, yang secara langsung mengendarai kereta matahari melintasi langit setiap hari. Meski Hyperion sendiri jarang digambarkan secara rinci dalam sumber-sumber kuno, ia sering dianggap sebagai personifikasi cahaya itu sendiri sebelum peran ini secara bertahap dialihkan kepada keturunannya yang lebih dikenal luas. Kepribadiannya digambarkan sebagai sosok yang bijaksana dan penuh pengamatan, mencerminkan perannya sebagai pengawas pergerakan waktu melalui siklus matahari, bulan, dan fajar yang teratur.

Sebagai ayah dari Helios, Selene, dan Eos, Hyperion memainkan peran penting sebagai leluhur dari trio penguasa langit yang mengatur siklus siang dan malam dalam kosmologi Yunani kuno, sebuah warisan yang jauh lebih dikenal dibanding tindakan Hyperion sendiri dalam mitos. Seperti Titan lainnya, ia turut serta dalam Titanomachy melawan para Olympian yang dipimpin Zeus, dan setelah kekalahan para Titan, perannya sebagai penguasa cahaya surgawi secara bertahap digantikan oleh keturunannya sendiri, terutama Helios yang menjadi identik dengan matahari dalam mitologi Yunani klasik. Nama Hyperion kemudian diabadikan dalam berbagai karya sastra kemudian, termasuk puisi epik karya John Keats, menjadikannya simbol keagungan cahaya purba yang mendahului era para dewa Olympian.''',
    storyEn: '''
Hyperion is one of the sons of Uranus (Sky) and Gaia (Earth), belonging to the first generation of Titans who ruled before the age of the Olympians. He married his own sister, Theia, goddess of divine light, and from this union came three children who governed the most important celestial bodies: Helios the sun, Selene the moon, and Eos the dawn. Because of this lineage, Hyperion is known as the ancestral source of all heavenly light, his very name in ancient Greek meaning "he who goes above" or "the watcher from on high," referring to his position overseeing the movement of celestial bodies.

Hyperion is associated with heavenly light, the sun, and the observation of the sky, a domain later largely inherited by his son, Helios, who personally drives the sun's chariot across the sky each day. Although Hyperion himself is rarely described in detail in ancient sources, he is often regarded as the personification of light itself before this role was gradually passed on to his far more widely known descendants. His personality is portrayed as wise and observant, reflecting his role as overseer of the passage of time through the regular cycles of sun, moon, and dawn.

As the father of Helios, Selene, and Eos, Hyperion plays a crucial role as ancestor to the trio of celestial rulers who govern the cycle of day and night in ancient Greek cosmology, a legacy far more prominent than any action attributed to Hyperion himself in the surviving myths. Like the other Titans, he took part in the Titanomachy against the Olympians led by Zeus, and after the Titans' defeat, his role as ruler of heavenly light was gradually taken over by his own descendants, particularly Helios, who became synonymous with the sun in classical Greek mythology. The name Hyperion was later immortalized in later literary works, including an epic poem by John Keats, making him a lasting symbol of the primordial majesty of light that preceded the age of the Olympian gods.''',
    imageUrl: 'assets/images/Greek/Titans/hyperion.webp',
    category: 'Titan',
  ),
  God(
    id: '44',
    name: 'Crius',
    mythology: 'Greek',
    title: 'Titan Rasi Bintang',
    titleEn: 'Titan of Constellations',
    symbol: '🐏',
    powers: ['Bintang', 'Rasi', 'Ukuran', 'Musim', 'Ketetapan'],
    powersEn: ['Stars', 'Constellations', 'Measure', 'Seasons', 'Order'],
    story: '''
Crius adalah salah satu putra Uranus (Langit) dan Gaia (Bumi), termasuk dalam generasi pertama dua belas Titan yang memerintah alam semesta sebelum kebangkitan para Olympian. Ia menikahi Eurybia, putri Pontus (Laut) dan Gaia, dan dari pernikahan ini lahir tiga putra yang masing-masing memiliki peran penting dalam mitologi selanjutnya: Astraeus, Pallas, dan Perses. Dibanding Titan lain seperti Cronus atau Oceanus, Crius adalah salah satu Titan yang paling sedikit dicatat kisahnya secara individual dalam sumber-sumber kuno, sehingga banyak pemahaman tentangnya berasal dari peran keturunannya.

Crius dikaitkan dengan rasi bintang, ukuran, dan tatanan musim, sebuah domain yang tercermin dari keturunannya—Astraeus yang menjadi ayah dari para bintang dan angin melalui pernikahannya dengan Eos sang fajar. Sebagai salah satu Titan yang berkaitan dengan konsep ketetapan dan pengukuran langit, Crius sering dipandang sebagai personifikasi dari prinsip keteraturan kosmis, meski atribut fisik atau simbol khususnya tidak banyak dijelaskan secara rinci dalam Theogony karya Hesiod maupun sumber-sumber klasik lainnya. Kepribadiannya dalam mitos cenderung digambarkan minim, mencerminkan posisinya sebagai salah satu Titan generasi pertama yang perannya lebih bersifat kosmologis daripada naratif.

Seperti Titan lainnya, Crius turut serta dalam Titanomachy, perang besar antara para Titan dan Olympian yang dipimpin Zeus, dan setelah kekalahan para Titan, ia dijebloskan ke Tartarus bersama sebagian besar saudara-saudaranya. Warisannya yang paling signifikan diteruskan melalui putranya, Astraeus, yang bersama Eos melahirkan para Anemoi (dewa angin) dan Astra Planeta (dewa bintang-bintang pengembara), menjadikan Crius sebagai kakek dari banyak personifikasi langit malam dalam mitologi Yunani. Meski jarang tampil langsung dalam narasi mitologis utama, Crius tetap penting sebagai bagian dari struktur kosmologis Titan yang menjelaskan asal-usul benda-benda langit dan tatanan musim dalam pemahaman Yunani kuno tentang alam semesta.''',
    storyEn: '''
Crius is one of the sons of Uranus (Sky) and Gaia (Earth), belonging to the first generation of twelve Titans who ruled the cosmos before the rise of the Olympians. He married Eurybia, daughter of Pontus (Sea) and Gaia, and from this union came three sons, each of whom would play significant roles in later mythology: Astraeus, Pallas, and Perses. Compared to Titans such as Cronus or Oceanus, Crius is one of the least individually documented Titans in ancient sources, meaning much of what is understood about him comes through the roles of his descendants.

Crius is associated with the constellations, measurement, and the ordering of the seasons, a domain reflected through his descendants, particularly Astraeus, who fathered the stars and winds through his union with Eos, goddess of the dawn. As one of the Titans connected to the concept of celestial order and measurement, Crius is often regarded as a personification of the principle of cosmic regularity, though his specific physical attributes or symbols are not described in much detail in Hesiod's Theogony or other classical sources. His personality in myth tends to be sparsely depicted, reflecting his position as one of the first-generation Titans whose role is more cosmological than narrative.

Like the other Titans, Crius took part in the Titanomachy, the great war between the Titans and the Olympians led by Zeus, and after the Titans' defeat, he was cast into Tartarus along with most of his siblings. His most significant legacy is carried forward through his son Astraeus, who together with Eos fathered the Anemoi, the wind gods, and the Astra Planeta, the wandering star gods, making Crius the grandfather of many personifications of the night sky in Greek mythology. Although he rarely appears directly in the central mythological narratives, Crius remains important as part of the Titan cosmological structure that explains the origins of celestial bodies and the ordering of the seasons in the ancient Greek understanding of the universe.''',
    imageUrl: 'assets/images/Greek/Titans/crius.webp',
    category: 'Titan',
  ),
  God(
    id: '45',
    name: 'Coeus',
    mythology: 'Greek',
    title: 'Titan Kecerdasan',
    titleEn: 'Titan of Intellect',
    symbol: '🧠',
    powers: ['Kecerdasan', 'Pengetahuan', 'Poros Langit', 'Nubuat', 'Nalar'],
    powersEn: ['Intellect', 'Knowledge', 'Celestial Axis', 'Prophecy', 'Reason'],
    story: '''
Coeus adalah salah satu putra Uranus (Langit) dan Gaia (Bumi), termasuk dalam generasi pertama dua belas Titan yang memerintah alam semesta sebelum era para Olympian. Ia menikahi saudarinya, Phoebe, seorang Titanid yang dikaitkan dengan cahaya bulan dan nubuat, dan dari pernikahan ini lahir dua putri penting, Leto dan Asteria, yang keduanya kelak melahirkan dewa-dewi penting dalam pantheon Olympian. Karena posisinya sebagai kakek dari Apollo dan Artemis melalui putrinya Leto, Coeus menempati tempat penting dalam silsilah yang menghubungkan generasi Titan dengan generasi Olympian.

Coeus dikaitkan dengan kecerdasan, pengetahuan, dan poros langit, sebuah domain yang menurut sebagian penafsiran modern terhadap Theogony karya Hesiod merujuk pada perannya sebagai personifikasi dari akal dan pertanyaan yang diarahkan ke langit. Bersama istrinya Phoebe yang menguasai ramalan, Coeus dipandang sebagai simbol kebijaksanaan dan poros pemikiran, meski sumber-sumber kuno tidak banyak memberikan detail naratif langsung tentang tindakannya. Kepribadiannya dalam mitos digambarkan minim dan lebih bersifat abstrak dibanding Titan-Titan lain yang lebih aktif dalam narasi, mencerminkan sifatnya sebagai personifikasi konsep filosofis ketimbang tokoh dengan kisah petualangan sendiri.

Seperti Titan lainnya, Coeus turut serta dalam Titanomachy melawan para Olympian, dan setelah kekalahan para Titan, ia dijebloskan ke Tartarus bersama sebagian besar saudara-saudaranya sebagai hukuman atas pemberontakan mereka. Warisannya yang paling penting diteruskan melalui putrinya, Leto, yang kelak menjadi kekasih Zeus dan melahirkan Apollo serta Artemis, menjadikan Coeus sebagai kakek dari dua dewa Olympian paling dihormati dalam pantheon Yunani. Melalui garis keturunan inilah Coeus, meski jarang tampil dalam kisah-kisah aktif, tetap memegang peran signifikan sebagai penghubung silsilah antara kebijaksanaan Titan purba dengan kekuatan cahaya dan ramalan yang diwariskan kepada cucu-cucunya di generasi Olympian.''',
    storyEn: '''
Coeus is one of the sons of Uranus (Sky) and Gaia (Earth), belonging to the first generation of twelve Titans who ruled the cosmos before the age of the Olympians. He married his sister Phoebe, a Titaness associated with the light of the moon and prophecy, and from this union came two important daughters, Leto and Asteria, both of whom would go on to bear significant deities within the Olympian pantheon. Because of his position as grandfather to Apollo and Artemis through his daughter Leto, Coeus occupies an important place in the genealogy connecting the Titan generation to the Olympian generation.

Coeus is associated with intellect, knowledge, and the celestial axis, a domain that, according to some modern interpretations of Hesiod's Theogony, refers to his role as a personification of reason and inquiry directed toward the heavens. Alongside his wife Phoebe, who governed prophecy, Coeus is regarded as a symbol of wisdom and the axis of thought, though ancient sources provide relatively few direct narrative details about his actions. His personality in myth is portrayed sparsely and more abstractly than other, more narratively active Titans, reflecting his nature as a personification of a philosophical concept rather than a figure with adventures of his own.

Like the other Titans, Coeus took part in the Titanomachy against the Olympians, and after the Titans' defeat, he was cast into Tartarus with most of his siblings as punishment for their rebellion. His most important legacy is carried forward through his daughter Leto, who later became a lover of Zeus and bore Apollo and Artemis, making Coeus the grandfather of two of the most revered Olympian gods in the Greek pantheon. Through this lineage, Coeus, though rarely appearing in active myths himself, holds a significant role as the genealogical link between ancient Titan wisdom and the powers of light and prophecy passed down to his grandchildren in the Olympian generation.''',
    imageUrl: 'assets/images/Greek/Titans/coeus.webp',
    category: 'Titan',
  ),
  God(
    id: '46',
    name: 'Rhea',
    mythology: 'Greek',
    title: 'Ibu Para Dewa',
    titleEn: 'Mother of the Gods',
    symbol: '🦁',
    powers: ['Kesuburan', 'Keibuan', 'Kelahiran', 'Aliran', 'Perlindungan'],
    powersEn: ['Fertility', 'Motherhood', 'Birth', 'Flow', 'Protection'],
    story: '''
Rhea adalah putri Uranus (Langit) dan Gaia (Bumi), termasuk dalam generasi pertama dua belas Titan, dan menikah dengan saudaranya sendiri, Cronus, yang kemudian menjadi raja para Titan setelah menggulingkan Uranus. Bersama Cronus, Rhea melahirkan enam anak yang kelak menjadi generasi pertama Olympian—Hestia, Demeter, Hera, Hades, Poseidon, dan Zeus—namun karena ramalan bahwa salah satu anaknya akan menggulingkan Cronus, setiap bayi yang ia lahirkan langsung ditelan oleh suaminya sendiri. Kesedihan mendalam atas hilangnya lima anaknya secara berturut-turut mendorong Rhea untuk merancang rencana penyelamatan bagi anak keenamnya, Zeus, sebuah tindakan yang kelak mengubah jalannya seluruh mitologi Yunani.

Rhea dikaitkan dengan kesuburan, keibuan, dan kelahiran, dipuja sebagai personifikasi keibuan agung yang melahirkan generasi dewa yang akan memerintah dunia setelah era Titan berakhir. Ia sering diasosiasikan dengan singa dan kereta yang ditarik oleh singa dalam tradisi yang kemudian menyatu dengan pemujaan dewi Cybele dari Anatolia, melambangkan kekuatan dan otoritas keibuannya yang tak tergoyahkan. Kepribadian Rhea digambarkan sebagai sosok yang penuh kasih namun juga berani dan cerdik, sebagaimana tampak dari keberaniannya menipu Cronus demi melindungi anak bungsunya, sebuah tindakan yang menunjukkan bahwa di balik kelembutannya tersimpan tekad yang kuat.

Kisah paling terkenal tentang Rhea adalah perannya menyelamatkan Zeus dari ayahnya sendiri: setelah melahirkan Zeus secara diam-diam di sebuah gua di Kreta, Rhea membungkus sebuah batu besar dengan kain bayi dan memberikannya kepada Cronus untuk ditelan sebagai pengganti anaknya, sementara Zeus yang sesungguhnya dititipkan kepada para nimfa dan kambing ajaib Amalthea untuk dibesarkan secara rahasia. Tindakan inilah yang kelak memungkinkan Zeus tumbuh dewasa, kembali menantang Cronus, memaksanya memuntahkan saudara-saudaranya, dan akhirnya memenangkan Titanomachy untuk mendirikan tatanan dunia baru di bawah para Olympian. Sebagai ibu dari generasi dewa yang mengubah sejarah mitologi Yunani, Rhea dihormati sebagai "Ibu Para Dewa", figur yang keberaniannya menjadi fondasi bagi seluruh kisah kebangkitan Olympus.''',
    storyEn: '''
Rhea is the daughter of Uranus (Sky) and Gaia (Earth), belonging to the first generation of twelve Titans, and married her own brother, Cronus, who later became king of the Titans after overthrowing Uranus. Together with Cronus, Rhea bore six children who would become the first generation of Olympians, Hestia, Demeter, Hera, Hades, Poseidon, and Zeus, but because of a prophecy that one of her children would overthrow Cronus, every infant she bore was immediately swallowed by her own husband. Rhea's deep grief over losing five children in succession drove her to devise a plan to save her sixth child, Zeus, an act that would go on to change the entire course of Greek mythology.

Rhea is associated with fertility, motherhood, and birth, worshipped as the great maternal personification who bore the generation of gods that would rule the world after the age of the Titans ended. She is often associated with lions and a chariot drawn by lions, a tradition that later merged with the worship of the Anatolian goddess Cybele, symbolizing her unshakable maternal strength and authority. Rhea's personality is portrayed as loving yet also brave and resourceful, as shown by her courage in deceiving Cronus to protect her youngest child, an act revealing that beneath her gentleness lay firm resolve.

The most famous myth about Rhea is her role in saving Zeus from his own father: after secretly giving birth to Zeus in a cave in Crete, Rhea wrapped a large stone in swaddling cloth and gave it to Cronus to swallow in place of their child, while the real Zeus was entrusted to nymphs and the divine goat Amalthea to be raised in secret. This act made it possible for Zeus to grow to adulthood, return to challenge Cronus, force him to disgorge his siblings, and ultimately win the Titanomachy to establish the new world order under the Olympians. As mother to the generation of gods who reshaped the course of Greek mythology, Rhea is honored as the "Mother of the Gods," a figure whose courage laid the foundation for the entire rise of Olympus.''',
    imageUrl: 'assets/images/Greek/Titans/rhea.webp',
    category: 'Titan',
  ),
  God(
    id: '47',
    name: 'Tethys',
    mythology: 'Greek',
    title: 'Ibu Sungai Dunia',
    titleEn: 'Mother of the World\'s Rivers',
    symbol: '💧',
    powers: ['Air Tawar', 'Sungai', 'Sumber Kehidupan', 'Pengasuhan', 'Aliran'],
    powersEn: ['Fresh Water', 'Rivers', 'Life-Source', 'Nurture', 'Streams'],
    story: '''
Tethys adalah putri Uranus (Langit) dan Gaia (Bumi), termasuk dalam generasi pertama dua belas Titan, dan menikah dengan saudaranya sendiri, Oceanus, Titan tertua yang menguasai sungai raksasa yang mengelilingi dunia. Bersama Oceanus, Tethys melahirkan tiga ribu putra yang dikenal sebagai Potamoi, para dewa sungai yang mengalir di seluruh penjuru dunia, serta tiga ribu putri yang dikenal sebagai Oceanid, para nimfa air tawar yang mendiami mata air, danau, dan aliran sungai. Karena jumlah keturunannya yang sangat besar, Tethys dianggap sebagai salah satu figur leluhur paling produktif dalam seluruh mitologi Yunani, menjadi sumber dari hampir semua badan air tawar yang dikenal oleh masyarakat Yunani kuno.

Tethys dikaitkan dengan air tawar, sungai, dan sumber kehidupan, dipuja sebagai personifikasi dari kekuatan pengasuh yang memberi kehidupan melalui aliran air yang menyuburkan bumi. Ia sering digambarkan sebagai sosok keibuan yang lembut, berbeda dari gambaran dewa laut yang lebih ganas seperti Poseidon, mencerminkan sifat air tawar yang menenangkan dan menghidupi dibanding sifat lautan yang liar dan penuh badai. Kepribadian Tethys digambarkan penuh kasih, pengasuh, dan cenderung menjaga jarak dari konflik kekuasaan antar generasi dewa, sebuah sifat yang tercermin dari pilihannya bersama Oceanus untuk tidak terlibat dalam Titanomachy.

Salah satu peran penting Tethys dalam mitologi adalah menurut sebuah kisah dalam Iliad karya Homer, di mana Hera mengunjungi Tethys dan Oceanus yang telah mengasuhnya semasa kecil, menunjukkan hubungan dekat antara generasi Titan dan Olympian meski keduanya pernah berperang. Melalui putri-putrinya para Oceanid, termasuk Metis dan Styx, Tethys menjadi nenek moyang dari banyak tokoh penting termasuk dalam garis keturunan yang mengarah pada kelahiran Athena. Sebagai ibu dari ribuan dewa sungai dan nimfa air, Tethys tetap menjadi figur sentral dalam kosmologi Yunani kuno yang menjelaskan asal-usul seluruh sumber air tawar di dunia, sebuah warisan yang menegaskan perannya sebagai "Ibu Sungai Dunia" yang menopang kehidupan di bumi.''',
    storyEn: '''
Tethys is the daughter of Uranus (Sky) and Gaia (Earth), belonging to the first generation of twelve Titans, and married her own brother, Oceanus, the eldest Titan who ruled the great river encircling the world. Together with Oceanus, Tethys bore three thousand sons known as the Potamoi, the river gods flowing throughout the world, and three thousand daughters known as the Oceanids, the freshwater nymphs who inhabit springs, lakes, and streams. Because of her enormous number of descendants, Tethys is regarded as one of the most prolific ancestral figures in all of Greek mythology, serving as the source of nearly every body of fresh water known to the ancient Greeks.

Tethys is associated with fresh water, rivers, and the source of life, worshipped as the personification of the nurturing power that gives life through the flow of water that fertilizes the earth. She is often depicted as a gentle, maternal figure, in contrast to the fiercer imagery associated with sea gods such as Poseidon, reflecting the calming, life-giving nature of fresh water as opposed to the wild, stormy nature of the open sea. Tethys's personality is portrayed as loving, nurturing, and inclined to keep her distance from the power struggles among generations of gods, a trait reflected in her and Oceanus's choice not to take part in the Titanomachy.

One of Tethys's significant roles in mythology appears in a passage from Homer's Iliad, where Hera visits Tethys and Oceanus, who had raised her during her childhood, revealing a close bond between the Titan and Olympian generations despite their having once been at war. Through her daughters, the Oceanids, including Metis and Styx, Tethys became ancestor to many important figures, including within the lineage leading to the birth of Athena. As mother to thousands of river gods and water nymphs, Tethys remains a central figure in ancient Greek cosmology, explaining the origin of every source of fresh water in the world, a legacy that affirms her role as the "Mother of the World's Rivers" who sustains life on earth.''',
    imageUrl: 'assets/images/Greek/Titans/tethys.webp',
    category: 'Titan',
  ),
  God(
    id: '48',
    name: 'Theia',
    mythology: 'Greek',
    title: 'Titan Penglihatan & Cahaya',
    titleEn: 'Titaness of Sight & Light',
    symbol: '✨',
    powers: ['Cahaya', 'Penglihatan', 'Kilau', 'Logam Mulia', 'Ramalan'],
    powersEn: ['Light', 'Sight', 'Radiance', 'Precious Metals', 'Divination'],
    story: '''
Theia adalah salah satu Titan generasi pertama, putri dari Uranus (Langit) dan Gaia (Bumi), lahir pada awal penciptaan alam semesta bersama sebelas saudara Titan lainnya. Ia menikah dengan saudaranya sendiri, Hyperion, Titan cahaya surgawi, dan bersama mereka melahirkan tiga anak yang kelak menjadi penguasa benda-benda langit paling terang: Helios sang Matahari, Selene sang Bulan, dan Eos sang Fajar. Kedudukannya sebagai ibu dari para dewa cahaya menempatkan Theia sebagai sumber dari segala keindahan dan kemilau yang tampak di langit.

Sebagai Titan penglihatan dan cahaya, Theia melambangkan kemampuan mata untuk menangkap keindahan dunia serta kilau yang memancar dari emas, perak, dan batu permata. Menurut penyair Pindar, Theia dihormati manusia karena dialah yang memberi nilai berkedip pada emas, perak, dan gading, menjadikan logam-logam itu berharga di mata manusia. Ia juga dikaitkan dengan kemampuan ramalan, karena cahaya dipercaya membuka penglihatan batin dan memungkinkan seseorang melihat apa yang tersembunyi. Sifatnya digambarkan tenang dan agung, mencerminkan cahaya yang menyinari tanpa harus bersuara.

Dalam Theogony karya Hesiod, Theia disebutkan sebagai istri yang tunduk pada cinta Hyperion dan melahirkan tiga anak yang melampaui semuanya dalam kilau cahaya mereka. Melalui garis keturunannya, Theia menjadi nenek moyang dari banyak tokoh penting seperti Phaethon, cucunya dari Helios. Warisannya bertahan dalam gagasan bahwa cahaya dan penglihatan adalah anugerah ilahi yang menyinari dunia, sebuah konsep yang kelak diwariskan kepada keturunannya yang lebih dikenal luas dalam mitologi Yunani.''',
    storyEn: '''
Theia is one of the twelve original Titans, a daughter of Uranus (Sky) and Gaia (Earth), born among the first generation of divine beings at the dawn of the cosmos. She married her own brother Hyperion, the Titan of heavenly light, and together they became the parents of three of the brightest powers in the sky: Helios the Sun, Selene the Moon, and Eos the Dawn. As the mother of these luminous deities, Theia stands at the origin of all radiance and visible splendor in the heavens.

As the Titaness of sight and light, Theia personifies the eye's capacity to perceive beauty and the brilliance that radiates from gold, silver, and precious gems. The poet Pindar credits her with giving these metals their shimmering worth, explaining why humans prize gold, silver, and ivory above other materials. She is also linked to divination, since light was believed to illuminate hidden truths and grant clarity of inner vision. Ancient sources describe her as serene and dignified, embodying a light that shines quietly rather than through open conflict.

In Hesiod's Theogony, Theia is described as submitting to the love of Hyperion and bearing three children who excel all others in their brightness. Through this lineage she becomes the grandmother of figures such as Phaethon, whose disastrous attempt to drive his father's sun chariot became one of Greek mythology's cautionary tales. Theia's legacy endures in the ancient association between vision, light, and divine truth, a concept passed down through her more widely known descendants who came to govern the sun, moon, and dawn.''',
    imageUrl: 'assets/images/Greek/Titans/theia.webp',
    category: 'Titan',
  ),
  God(
    id: '49',
    name: 'Phoebe',
    mythology: 'Greek',
    title: 'Titan Nubuat',
    titleEn: 'Titaness of Prophecy',
    symbol: '🌙',
    powers: ['Nubuat', 'Kecerdasan', 'Bulan', 'Oracle', 'Kebijaksanaan'],
    powersEn: ['Prophecy', 'Intellect', 'Moon', 'Oracle', 'Wisdom'],
    story: '''
Phoebe adalah Titan generasi pertama, putri Uranus dan Gaia, serta salah satu dari dua belas Titan yang lahir sebelum masa kekuasaan Zeus. Ia menikah dengan saudaranya, Coeus, Titan kecerdasan, dan dari pernikahan itu lahir dua putri: Leto, yang kelak menjadi ibu dari Apollo dan Artemis, dan Asteria, dewi bintang jatuh dan ramalan malam. Melalui Leto, Phoebe menjadi nenek dari dua dewa Olympian yang sangat dihormati, menempatkannya pada posisi penting dalam silsilah para dewa cahaya dan nubuat.

Sebagai Titan nubuat, Phoebe melambangkan kecerdasan ilahi dan kemampuan meramal masa depan, sering pula dikaitkan dengan cahaya bulan sebagai simbol penglihatan yang menembus kegelapan. Namanya sendiri berarti yang bercahaya atau yang murni, julukan yang kelak diwariskan kepada cucunya, Apollo, yang dikenal juga sebagai Phoebus. Ia dihormati karena kebijaksanaannya yang tenang dan kemampuannya membaca tanda-tanda gaib, sifat yang menjadikannya penjaga pengetahuan suci di antara para Titan.

Menurut drama Eumenides karya Aeschylus, Phoebe adalah pemilik ketiga Oracle Delphi, sebuah tempat ramalan suci yang ia warisi dari Themis, sebelum akhirnya ia memberikannya sebagai hadiah kelahiran kepada cucunya, Apollo. Melalui pemberian ini, Phoebe secara langsung menghubungkan warisan nubuatnya dengan salah satu pusat keagamaan terpenting di dunia Yunani kuno. Julukan Phoebus yang disandang Apollo sepanjang mitologi Yunani adalah bukti abadi dari pengaruh neneknya ini, menjadikan Phoebe figur penting meski jarang tampil langsung dalam kisah-kisah utama.''',
    storyEn: '''
Phoebe is one of the twelve original Titans, a daughter of Uranus and Gaia born in the first generation of divine beings before the reign of Zeus. She married her brother Coeus, the Titan of intellect, and together they had two daughters: Leto, who would become the mother of Apollo and Artemis, and Asteria, goddess of falling stars and nocturnal oracles. Through Leto, Phoebe became the grandmother of two of the most venerated Olympian gods, giving her a lasting place in the lineage of light and prophecy.

As the Titaness of prophecy, Phoebe embodies divine intellect and the power to foresee the future, and she is often linked to the light of the moon as a symbol of vision piercing the darkness. Her name itself means the bright one or the pure one, an epithet later inherited by her grandson Apollo, who came to be known as Phoebus. She was honored for her calm wisdom and her skill in reading mystical signs, qualities that made her a keeper of sacred knowledge among the Titans.

According to Aeschylus's tragedy Eumenides, Phoebe was the third divine owner of the Oracle at Delphi, a sacred seat of prophecy she inherited from Themis before giving it as a birthday gift to her grandson Apollo. Through this act, Phoebe directly linked her prophetic legacy to one of the most important religious centers of the ancient Greek world. The epithet Phoebus that Apollo carried throughout Greek mythology stands as lasting evidence of his grandmother's influence, making Phoebe a quietly foundational figure despite her rare direct appearances in the major myths.''',
    imageUrl: 'assets/images/Greek/Titans/phoebe.webp',
    category: 'Titan',
  ),
  God(
    id: '50',
    name: 'Themis',
    mythology: 'Greek',
    title: 'Titan Keadilan Ilahi',
    titleEn: 'Titaness of Divine Law',
    symbol: '⚖️',
    powers: ['Keadilan', 'Hukum Ilahi', 'Ketertiban', 'Nubuat', 'Adat'],
    powersEn: ['Justice', 'Divine Law', 'Order', 'Prophecy', 'Custom'],
    story: '''
Themis adalah Titan generasi pertama, putri Uranus dan Gaia, yang kemudian menjadi istri kedua Zeus setelah Metis. Sebagai Titan yang dekat dengan tatanan kosmis, Themis melahirkan dua kelompok dewi penting dari hubungannya dengan Zeus: para Horai (dewi musim dan ketertiban waktu) dan para Moirai (tiga dewi takdir yang menentukan nasib setiap makhluk). Posisinya sebagai istri Zeus, meski tidak seabadi pernikahannya dengan Hera, menjadikan Themis salah satu Titan yang paling dihormati dan tetap memiliki tempat di Olympus setelah kejatuhan para Titan lainnya.

Themis adalah personifikasi hukum ilahi, keadilan, dan tatanan yang mengatur hubungan antara dewa dan manusia, berbeda dari hukum manusia biasa karena bersifat kekal dan berasal dari kehendak kosmis itu sendiri. Ia sering digambarkan membawa neraca sebagai simbol penimbangan yang adil, dan dikenal karena kebijaksanaannya dalam memutuskan perkara serta memanggil para dewa ke pertemuan agung di Olympus. Karena keadilan sejati membutuhkan pandangan ke depan, Themis juga memiliki karunia nubuat, menjadikannya penasihat yang dipercaya oleh Zeus dalam banyak keputusan penting.

Sebelum Apollo menguasainya, Oracle Delphi pertama kali dijaga oleh Gaia, kemudian diwariskan kepada Themis, yang menjadikannya sebagai salah satu pemegang awal tempat ramalan paling suci di Yunani kuno. Themis juga berperan penting dalam memperingatkan para dewa agar Zeus tidak menikahi Thetis, karena nubuat menyatakan anak dari Thetis akan menjadi lebih kuat dari ayahnya, sebuah peringatan yang akhirnya menyelamatkan Zeus dari nasib menggulingkan ayahnya sendiri sebagaimana Cronus menggulingkan Uranus. Sebagai lambang keadilan ilahi, warisan Themis bertahan hingga zaman modern melalui konsep hukum dan pengadilan yang adil, menjadikan namanya identik dengan gagasan keadilan itu sendiri.''',
    storyEn: '''
Themis is one of the original Titans, a daughter of Uranus and Gaia who later became Zeus's second wife after Metis. As a Titaness closely tied to cosmic order, Themis bore two important groups of goddesses through her union with Zeus: the Horae, who governed the seasons and the order of time, and the Moirai, the three Fates who determined the destiny of every living being. Her position as one of Zeus's consorts, though not as lasting as his marriage to Hera, made Themis one of the most respected Titans, retaining her place on Olympus even after the fall of the other Titans.

Themis is the personification of divine law, justice, and the order that governs relations between gods and mortals, distinct from human law because it is eternal and rooted in cosmic will itself. She is often depicted holding a set of scales as a symbol of fair judgment, and she was known for her wisdom in settling disputes and for summoning the gods to their great assemblies on Olympus. Because true justice requires foresight, Themis also possessed the gift of prophecy, making her a trusted advisor to Zeus in many of his most important decisions.

Before Apollo claimed it, the Oracle at Delphi was first guarded by Gaia and then passed to Themis, making her one of the earliest keepers of one of ancient Greece's holiest sites of prophecy. Themis also played a crucial role in warning the gods that Zeus should not marry the sea nymph Thetis, since prophecy foretold that any son born of her would grow stronger than his father, a warning that ultimately spared Zeus the fate of being overthrown by his own son, just as Cronus had overthrown Uranus. As the embodiment of divine justice, Themis's legacy endures into the modern era through concepts of law and fair judgment, her name remaining synonymous with the very idea of justice.''',
    imageUrl: 'assets/images/Greek/Titans/themis.webp',
    category: 'Titan',
  ),
  God(
    id: '51',
    name: 'Mnemosyne',
    mythology: 'Greek',
    title: 'Titan Ingatan',
    titleEn: 'Titaness of Memory',
    symbol: '📜',
    powers: ['Ingatan', 'Bahasa', 'Ilham', 'Sejarah Lisan', 'Seni'],
    powersEn: ['Memory', 'Language', 'Inspiration', 'Oral History', 'Arts'],
    story: '''
Mnemosyne adalah Titan generasi pertama, putri Uranus dan Gaia, yang menjadi personifikasi ingatan dalam mitologi Yunani. Ia dikenal luas karena hubungannya dengan Zeus, yang mengunjunginya selama sembilan malam berturut-turut di Pieria; dari pertemuan itu lahirlah sembilan Muse, para dewi ilham yang menaungi puisi, musik, sejarah, dan seni lainnya. Sebagai ibu dari para Muse, Mnemosyne menempati posisi penting sebagai sumber dari segala inspirasi seni dan pengetahuan yang diwariskan turun-temurun.

Sebagai Titan ingatan, Mnemosyne melambangkan kemampuan pikiran untuk menyimpan dan mengingat kembali pengetahuan, bahasa, dan pengalaman, sebuah kekuatan yang sangat dihargai pada masa ketika tradisi lisan menjadi satu-satunya cara mewariskan sejarah dan kisah. Para penyair kuno memohon bantuannya, atau bantuan putri-putrinya para Muse, sebelum mendendangkan syair panjang, karena tanpa ingatan yang kuat, epik-epik besar seperti karya Homer tidak mungkin dihafal dan diturunkan dari generasi ke generasi. Sifatnya digambarkan agung dan bijaksana, sebagai penjaga sunyi dari seluruh sejarah lisan umat manusia dan para dewa.

Dalam Theogony karya Hesiod, Mnemosyne disebutkan secara khusus sebagai ibu para Muse yang menginspirasi penyair itu sendiri untuk menuliskan silsilah para dewa, menjadikan Mnemosyne sumber langsung dari karya sastra Yunani yang paling awal masih bertahan. Di beberapa tradisi keagamaan Yunani kuno, terutama dalam kultus Orphic, para pengikut yang telah meninggal disarankan meminum dari sungai Mnemosyne di dunia bawah, bukan sungai Lethe yang melupakan, agar jiwa mereka mempertahankan ingatan dan mencapai pencerahan. Warisan Mnemosyne bertahan hingga kini melalui kata mnemonic dalam bahasa modern, istilah yang secara langsung merujuk pada perannya sebagai dewi ingatan.''',
    storyEn: '''
Mnemosyne is one of the original Titans, a daughter of Uranus and Gaia who personifies memory in Greek mythology. She is best known for her union with Zeus, who visited her for nine consecutive nights at Pieria; from their meetings were born the nine Muses, the goddesses of inspiration who preside over poetry, music, history, and the other arts. As the mother of the Muses, Mnemosyne holds a central place as the ultimate source of artistic inspiration and inherited knowledge.

As the Titaness of memory, Mnemosyne represents the mind's ability to store and recall knowledge, language, and experience, a power held in extremely high regard at a time when oral tradition was the only means of passing down history and story. Ancient poets invoked her, or her daughters the Muses, before reciting lengthy verses, since without a powerful memory, great epics such as those of Homer could never have been memorized and transmitted across generations. She is portrayed as dignified and wise, a quiet guardian of the entire oral history of both gods and mortals.

In his Theogony, Hesiod specifically credits Mnemosyne's daughters, the Muses, with inspiring him to record the genealogy of the gods, making Mnemosyne a direct source behind one of the earliest surviving works of Greek literature. In certain ancient Greek religious traditions, particularly the Orphic mystery cults, deceased initiates were instructed to drink from the river of Mnemosyne in the underworld rather than the river Lethe, which caused forgetfulness, so that their souls would retain memory and achieve enlightenment. Mnemosyne's legacy survives today in the modern word mnemonic, a term that directly references her role as the goddess of memory.''',
    imageUrl: 'assets/images/Greek/Titans/mnemosyne.webp',
    category: 'Titan',
  ),
  God(
    id: '52',
    name: 'Atlas',
    mythology: 'Greek',
    title: 'Sang Pemikul Langit',
    titleEn: 'Bearer of the Heavens',
    symbol: '🌍',
    powers: ['Kekuatan', 'Ketahanan', 'Astronomi', 'Navigasi', 'Beban Langit'],
    powersEn: ['Strength', 'Endurance', 'Astronomy', 'Navigation', 'Bearing the Sky'],
    story: '''
Atlas adalah Titan generasi kedua, putra dari Iapetus dan Oceanid Clymene, menjadikannya saudara dari tiga Titan lain yang juga terkenal: Prometheus, Epimetheus, dan Menoetius. Ia turut berperan besar dalam Titanomachy, perang besar antara para Titan dan generasi dewa Olympian yang dipimpin Zeus, dengan memimpin pasukan Titan melawan pasukan Zeus. Kekalahan para Titan dalam perang ini membawa akibat yang sangat berat khusus bagi Atlas, berbeda dari saudara-saudaranya yang menerima hukuman lain.

Sebagai hukuman atas perannya memimpin Titan dalam peperangan melawan Zeus, Atlas dijatuhi tugas abadi untuk memikul langit di pundaknya di ujung barat dunia, dekat taman Hesperides. Kekuatan dan ketahanannya menjadi legendaris karena beban yang ia tanggung bukanlah beban biasa, melainkan seluruh kubah langit yang harus terus disangga tanpa henti agar tidak runtuh menimpa bumi. Karena posisinya yang berdiri di bawah langit berbintang, Atlas juga dikaitkan dengan astronomi dan navigasi, sebab para pelaut dan penjelajah bergantung pada pengetahuan bintang untuk menemukan arah.

Dalam kisah dua belas tugas Heracles, Atlas berperan penting saat Heracles diminta mengambil apel emas dari taman Hesperides; karena hanya seorang Titan yang dapat memasuki taman itu, Heracles menawarkan diri memikul langit sementara Atlas pergi mengambilkan apel tersebut. Atlas nyaris tidak kembali memikul bebannya, namun Heracles berhasil menipunya untuk mengambil kembali langit sejenak dengan dalih ingin memperbaiki bantalan pundaknya. Dalam versi lain yang dicatat oleh Ovid, Atlas kemudian diubah menjadi gunung batu oleh Perseus menggunakan kepala Medusa, menciptakan asal-usul mitologis dari Pegunungan Atlas di Afrika Utara, sebuah warisan yang hingga kini masih menyandang namanya.''',
    storyEn: '''
Atlas is a second-generation Titan, the son of Iapetus and the Oceanid Clymene, making him the brother of three other well-known Titans: Prometheus, Epimetheus, and Menoetius. He played a major role in the Titanomachy, the great war between the Titans and the Olympian gods led by Zeus, commanding the Titan forces against Zeus's army. The Titans' defeat in this war brought especially severe consequences for Atlas, distinct from the punishments given to his brothers.

As punishment for leading the Titans in their war against Zeus, Atlas was condemned to the eternal task of bearing the sky upon his shoulders at the western edge of the world, near the garden of the Hesperides. His strength and endurance became legendary because the burden he carried was no ordinary weight but the entire vault of the heavens, which had to be held up without rest to prevent it from crashing down upon the earth. Because of his position beneath the starry sky, Atlas also became associated with astronomy and navigation, since sailors and travelers relied on knowledge of the stars to find their way.

In the story of the twelve labors of Heracles, Atlas plays a key role when Heracles is sent to fetch the golden apples from the garden of the Hesperides; since only a Titan could enter the garden, Heracles offered to hold up the sky while Atlas went to retrieve the apples himself. Atlas nearly refused to take back his burden, but Heracles tricked him into resuming it by asking for a moment to adjust the padding on his shoulders. In another version recorded by Ovid, Atlas was later turned to stone by Perseus using the severed head of Medusa, giving rise to the mythological origin of the Atlas Mountains in North Africa, a legacy that still carries his name today.''',
    imageUrl: 'assets/images/Greek/Titans/atlas.webp',
    category: 'Titan',
  ),
  God(
    id: '53',
    name: 'Prometheus',
    mythology: 'Greek',
    title: 'Pembawa Api bagi Manusia',
    titleEn: 'Bringer of Fire to Mankind',
    symbol: '🔥',
    powers: ['Kecerdikan', 'Pandangan ke Depan', 'Api', 'Penciptaan Manusia', 'Pemberontakan'],
    powersEn: ['Cunning', 'Foresight', 'Fire', 'Creation of Man', 'Rebellion'],
    story: '''
Prometheus adalah Titan generasi kedua, putra Iapetus dan Clymene, serta saudara dari Atlas, Epimetheus, dan Menoetius. Namanya berarti pemikir ke depan dalam bahasa Yunani, sebuah sifat yang menjadi ciri utamanya sepanjang mitologi karena kecerdasan dan kemampuannya meramalkan akibat dari setiap tindakan. Berbeda dari kebanyakan Titan lain yang berperang melawan Zeus dalam Titanomachy, Prometheus memilih memihak para dewa Olympian, sebuah keputusan yang pada akhirnya tidak menyelamatkannya dari murka Zeus di kemudian hari.

Prometheus dikenal luas sebagai pencipta umat manusia, yang menurut sejumlah sumber ia bentuk dari tanah liat menurut rupa para dewa, serta sebagai pembawa api yang mencuri percikan api suci dari Olympus dan menyembunyikannya dalam batang tanaman adas untuk diberikan kepada manusia. Tindakan ini menjadikannya simbol kecerdikan, pemberontakan terhadap otoritas yang tidak adil, dan kepedulian terhadap makhluk yang lebih lemah. Ia digambarkan sebagai sosok licik namun berhati mulia, rela menanggung risiko besar demi kemajuan umat manusia yang ia ciptakan dan sayangi.

Akibat mencuri api dan menipu Zeus dalam pembagian daging kurban di Mecone, di mana Prometheus membungkus tulang dengan lemak yang menggiurkan agar Zeus memilihnya sementara manusia mendapat bagian daging yang lebih berharga, Zeus menghukumnya dengan merantainya di sebuah batu karang di Pegunungan Kaukasus. Di sana, seekor elang setiap hari memakan hatinya, yang kemudian tumbuh kembali setiap malam, sehingga siksaan itu berlangsung tanpa akhir hingga akhirnya sang pahlawan Heracles membebaskannya. Kisah Prometheus telah menjadi salah satu mitos paling berpengaruh dalam kebudayaan Barat, melambangkan pengorbanan demi ilmu pengetahuan dan kemajuan, sebagaimana tercermin dalam karya-karya besar seperti tragedi Prometheus Bound yang dikaitkan dengan Aeschylus.''',
    storyEn: '''
Prometheus is a second-generation Titan, the son of Iapetus and Clymene, and the brother of Atlas, Epimetheus, and Menoetius. His name means forethought in Greek, a trait that defines him throughout mythology because of his intelligence and his ability to foresee the consequences of every action. Unlike most of the other Titans who fought against Zeus in the Titanomachy, Prometheus chose to side with the Olympian gods, a decision that would ultimately not spare him from Zeus's wrath later on.

Prometheus is widely known as the creator of humanity, whom several sources say he shaped from clay in the likeness of the gods, and as the bringer of fire who stole a spark of the sacred flame from Olympus and hid it inside a hollow fennel stalk to give to mankind. This act made him a symbol of cunning, of rebellion against unjust authority, and of concern for weaker beings. He is portrayed as a clever yet noble-hearted figure, willing to face enormous risk for the sake of the humans he created and cherished.

After stealing fire and tricking Zeus during the division of a sacrificial bull at Mecone, where Prometheus wrapped the bones in tempting fat so that Zeus would choose that portion while leaving humans the more valuable meat, Zeus punished him by chaining him to a rock in the Caucasus Mountains. There, an eagle devoured his liver every day, only for it to regenerate each night, so that the torment continued endlessly until the hero Heracles finally freed him. The story of Prometheus has become one of the most influential myths in Western culture, symbolizing sacrifice for the sake of knowledge and progress, as reflected in major works such as the tragedy Prometheus Bound attributed to Aeschylus.''',
    imageUrl: 'assets/images/Greek/Titans/prometheus.webp',
    category: 'Titan',
  ),
  God(
    id: '54',
    name: 'Epimetheus',
    mythology: 'Greek',
    title: 'Sang Berpikir Belakangan',
    titleEn: 'The Afterthinker',
    symbol: '🏺',
    powers: ['Naluri', 'Ciptaan Hewan', 'Kesederhanaan', 'Kejujuran', 'Nasib'],
    powersEn: ['Instinct', 'Animal Creation', 'Simplicity', 'Sincerity', 'Fate'],
    story: '''
Epimetheus adalah Titan generasi kedua, putra Iapetus dan Clymene, serta saudara dari Prometheus, Atlas, dan Menoetius. Namanya berarti pemikir belakangan dalam bahasa Yunani, kebalikan langsung dari saudaranya Prometheus, dan sifat ini menjadi tema utama yang mewarnai setiap kisah tentang dirinya. Di antara para Titan, Epimetheus dikenal sebagai sosok yang lebih sederhana dan kurang berhati-hati dibandingkan saudaranya yang cerdik, sebuah perbedaan watak yang kelak membawa konsekuensi besar bagi umat manusia.

Menurut kisah yang dituturkan Plato dalam dialog Protagoras, Epimetheus diberi tugas oleh para dewa untuk membagikan berbagai kemampuan kepada setiap makhluk hidup yang baru diciptakan, seperti bulu, cakar, kecepatan, dan kekuatan. Karena sifatnya yang ceroboh dan tidak berpikir panjang, ia menghabiskan seluruh persediaan kemampuan istimewa itu untuk hewan-hewan sebelum tiba giliran manusia, sehingga Prometheus terpaksa turun tangan memberi manusia api dan kecerdasan sebagai gantinya. Epimetheus digambarkan jujur dan tulus, namun mudah terbujuk dan kurang mampu melihat bahaya di balik sesuatu yang tampak menggiurkan.

Kelemahan Epimetheus paling nyata dalam kisah Pandora, wanita pertama yang diciptakan atas perintah Zeus sebagai hukuman bagi manusia setelah pencurian api oleh Prometheus. Meski telah diperingatkan kakaknya untuk tidak pernah menerima hadiah apa pun dari Zeus, Epimetheus tetap menerima Pandora sebagai istri, dan ketika Pandora membuka guci terlarang yang dibawanya, seluruh penderitaan, penyakit, dan kejahatan pun menyebar ke dunia, menyisakan hanya harapan di dalamnya. Dari pernikahan itu lahir Pyrrha, yang bersama suaminya Deucalion, putra Prometheus, menjadi satu-satunya pasangan manusia yang selamat dari banjir besar dan kemudian menjadi leluhur seluruh umat manusia yang baru.''',
    storyEn: '''
Epimetheus is a second-generation Titan, the son of Iapetus and Clymene, and the brother of Prometheus, Atlas, and Menoetius. His name means afterthought in Greek, the direct opposite of his brother Prometheus, and this trait becomes the central theme running through every story told about him. Among the Titans, Epimetheus is known as a simpler and less cautious figure than his cunning brother, a difference in character that would eventually bring great consequences upon humanity.

According to the story told by Plato in his dialogue Protagoras, Epimetheus was given the task by the gods of distributing various abilities to each newly created living creature, such as fur, claws, speed, and strength. Because of his careless and short-sighted nature, he used up the entire supply of special gifts on the animals before it was humanity's turn, forcing Prometheus to step in and give humans fire and intelligence instead. Epimetheus is portrayed as honest and sincere, yet easily persuaded and poorly equipped to recognize danger hidden behind something tempting.

Epimetheus's weakness is most apparent in the story of Pandora, the first woman created at Zeus's command as a punishment for humanity after Prometheus's theft of fire. Although warned by his brother never to accept any gift from Zeus, Epimetheus nonetheless took Pandora as his wife, and when she opened the forbidden jar she carried with her, all manner of suffering, disease, and evil spread throughout the world, leaving only hope trapped inside. From this marriage came Pyrrha, who together with her husband Deucalion, the son of Prometheus, became the only human couple to survive the great flood and afterward the ancestors of a renewed humanity.''',
    imageUrl: 'assets/images/Greek/Titans/epimetheus.webp',
    category: 'Titan',
  ),
  God(
    id: '55',
    name: 'Menoetius',
    mythology: 'Greek',
    title: 'Titan Kemurkaan',
    titleEn: 'Titan of Violent Rage',
    symbol: '⚡',
    powers: ['Kemurkaan', 'Kekuatan Brutal', 'Kesombongan', 'Kematian Fana', 'Keberanian'],
    powersEn: ['Rage', 'Brute Force', 'Hubris', 'Mortal Death', 'Recklessness'],
    story: '''
Menoetius adalah Titan generasi kedua, putra Iapetus dan Clymene, sekaligus saudara dari Prometheus, Epimetheus, dan Atlas. Dibandingkan tiga saudaranya yang masing-masing memiliki kisah panjang dan berpengaruh dalam mitologi Yunani, Menoetius jauh lebih jarang disebutkan, dan sumber utama tentang dirinya berasal dari Theogony karya Hesiod. Kedudukannya sebagai Titan tetap menempatkannya dalam garis keturunan Iapetus yang terkenal karena sikap menantang otoritas para dewa Olympian.

Menoetius dikenal sebagai personifikasi dari kemurkaan yang meledak-ledak dan kekuatan brutal yang tidak terkendali, sifat yang menurut Hesiod membuatnya sombong dan bertindak dengan keberanian yang melampaui batas kewajaran. Berbeda dari Prometheus yang cerdik atau Epimetheus yang naif, Menoetius digambarkan sebagai sosok yang mengandalkan kekuatan fisik dan amarah dibandingkan kebijaksanaan, sebuah watak yang pada akhirnya menuntunnya pada keruntuhan. Sifat kesombongannya dianggap sebagai bentuk hubris klasik, pelanggaran batas yang di dunia mitologi Yunani selalu berujung pada hukuman dari para dewa.

Menurut Hesiod, dalam pertempuran besar Titanomachy antara para Titan dan Zeus, Menoetius dihantam oleh petir Zeus karena kesombongan dan kekerasannya yang berlebihan, lalu dilemparkan ke dalam kegelapan Erebus di dunia bawah sebagai hukuman atas kelancangannya. Nasibnya menjadi salah satu contoh paling jelas dalam mitologi Yunani tentang bagaimana kekuatan tanpa kebijaksanaan dan kerendahan hati akan berujung pada kehancuran, sebuah pesan moral yang berulang kali muncul dalam kisah-kisah tragedi Yunani. Meski kisahnya singkat, Menoetius tetap penting sebagai pelengkap keempat bersaudara Iapetus, mewakili sisi gelap dari keberanian yang tidak diimbangi akal sehat, berbeda tajam dengan kecerdikan Prometheus atau ketabahan Atlas.''',
    storyEn: '''
Menoetius is a second-generation Titan, the son of Iapetus and Clymene, and the brother of Prometheus, Epimetheus, and Atlas. Compared to his three brothers, each of whom has an extensive and influential story within Greek mythology, Menoetius is mentioned far less often, and the primary source about him comes from Hesiod's Theogony. His status as a Titan still places him within the lineage of Iapetus, a line known for its defiance of Olympian authority.

Menoetius is known as the personification of explosive rage and uncontrolled brute force, a trait that Hesiod describes as making him overweening and prone to acting with recklessness beyond reasonable limits. Unlike the cunning Prometheus or the naive Epimetheus, Menoetius is portrayed as a figure who relied on physical strength and anger rather than wisdom, a character flaw that ultimately led to his downfall. His hubris is treated as a classic case of overstepping boundaries, a transgression that in Greek mythology invariably invites punishment from the gods.

According to Hesiod, during the great Titanomachy between the Titans and Zeus, Menoetius was struck down by Zeus's thunderbolt because of his excessive arrogance and violence, and was then hurled down into the gloom of Erebus in the underworld as punishment for his insolence. His fate stands as one of the clearest examples in Greek mythology of how strength without wisdom and humility leads to ruin, a moral lesson echoed repeatedly throughout Greek tragedy. Though his story is brief, Menoetius remains significant as the fourth of the brothers of Iapetus, representing the darker side of courage unbalanced by reason, in sharp contrast to the cunning of Prometheus or the endurance of Atlas.''',
    imageUrl: 'assets/images/Greek/Titans/menoetius.webp',
    category: 'Titan',
  ),

  God(
    id: '87',
    name: 'Hestia',
    mythology: 'Greek',
    title: 'Dewi Perapian & Rumah Tangga',
    titleEn: 'Goddess of the Hearth & Home',
    symbol: '🔥',
    powers: ['Perapian', 'Rumah Tangga', 'Keluarga', 'Pengorbanan', 'Kesucian'],
    powersEn: ['Hearth', 'Home', 'Family', 'Sacrifice', 'Purity'],
    story: '''
Hestia adalah dewi Olympian, anak sulung dari Cronus dan Rhea, meski karena ditelan ayahnya sejak lahir dan dimuntahkan paling terakhir, ia juga dianggap sebagai yang termuda di antara enam bersaudara pertama generasi Olympian: Hestia, Demeter, Hera, Hades, Poseidon, dan Zeus. Kedudukan gandanya sebagai yang tertua sekaligus yang termuda memberinya penghormatan istimewa di antara para dewa, sebab ia dianggap membuka sekaligus menutup garis keturunan generasi pertama Olympian. Sebagai saudari dari Zeus, Hestia menduduki tempat terhormat di Olympus, meski ia jarang terlibat dalam konflik atau drama yang mewarnai kehidupan para dewa lainnya.

Hestia adalah dewi perapian, rumah tangga, dan keluarga, dipuja sebagai penjaga api suci yang menyala di setiap rumah, kuil, dan balai kota di Yunani kuno, melambangkan kehangatan, keamanan, dan kesatuan keluarga. Ia bersumpah untuk tetap perawan selamanya di hadapan Zeus setelah Apollo dan Poseidon sama-sama melamarnya, sebuah sumpah yang dijaganya teguh sehingga ia menjadi lambang kesucian dan pengabdian tanpa pamrih. Karena sifatnya yang tenang, rendah hati, dan tidak mencari kekuasaan atau kemuliaan, Hestia selalu mendapat bagian pertama dari setiap persembahan yang dibakar dalam upacara keagamaan, sebuah penghormatan yang menegaskan posisinya sebagai fondasi dari setiap rumah tangga dan komunitas.

Salah satu kisah paling dikenal tentang Hestia adalah keputusannya untuk menyerahkan kursi kehormatannya di antara dua belas dewa Olympian utama kepada Dionysus, demi menjaga perdamaian dan menghindari perselisihan di antara para dewa, sebuah tindakan yang menunjukkan sifatnya yang mengutamakan keharmonisan di atas kedudukan pribadi. Berbeda dari saudara-saudaranya yang terlibat dalam berbagai peperangan, perselingkuhan, dan intrik, Hestia nyaris tidak memiliki mitos konflik pribadi, karena keberadaannya justru dirayakan melalui ritual harian di setiap rumah tangga Yunani, di mana api perapian tidak pernah dibiarkan padam. Warisannya bertahan dalam tradisi Romawi sebagai Vesta, dan hingga kini konsep rumah sebagai pusat kehidupan keluarga tetap mengingatkan pada peran sentral Hestia dalam kehidupan sehari-hari masyarakat Yunani kuno.''',
    storyEn: '''
Hestia is an Olympian goddess, the eldest child of Cronus and Rhea, though because she was swallowed by her father at birth and disgorged last, she is also regarded as the youngest among the first six siblings of the Olympian generation: Hestia, Demeter, Hera, Hades, Poseidon, and Zeus. This dual status as both the eldest and the youngest gave her a unique honor among the gods, since she was seen as both opening and closing the line of the first Olympian generation. As Zeus's sister, Hestia held a place of high honor on Olympus, even though she rarely took part in the conflicts and dramas that colored the lives of the other gods.

Hestia is the goddess of the hearth, home, and family, worshipped as the keeper of the sacred fire that burned in every home, temple, and town hall across ancient Greece, symbolizing warmth, security, and family unity. She swore before Zeus to remain a virgin forever after both Apollo and Poseidon sought her hand in marriage, an oath she kept faithfully, making her a symbol of purity and selfless devotion. Because of her calm, humble nature and her lack of interest in power or glory, Hestia was always given the first portion of every offering burned in religious ceremonies, an honor that affirmed her position as the foundation of every household and community.

One of the best-known stories about Hestia is her decision to give up her seat of honor among the twelve principal Olympian gods to Dionysus in order to preserve peace and avoid discord among the gods, an act that reflects her preference for harmony over personal status. Unlike her siblings, who were embroiled in various wars, affairs, and intrigues, Hestia has almost no myths involving personal conflict, since her presence was instead celebrated through the daily rituals of every Greek household, where the hearth fire was never allowed to go out. Her legacy survives in the Roman tradition as Vesta, and even today the concept of home as the center of family life continues to recall Hestia's central role in the everyday life of ancient Greek society.''',
    imageUrl: 'assets/images/Greek/Olympians/hestia.webp',
    category: 'Olympian',
  ),

  God(
    id: '88',
    name: 'Chaos',
    mythology: 'Greek',
    title: 'Kekosongan Awal',
    titleEn: 'The Primordial Void',
    symbol: '🌌',
    powers: ['Asal Mula', 'Kekosongan', 'Penciptaan', 'Ketiadaan', 'Potensi'],
    powersEn: ['Origin', 'Void', 'Creation', 'Nothingness', 'Potential'],
    story: '''
Chaos, menurut Theogony karya Hesiod, adalah entitas pertama yang muncul dalam alam semesta, mendahului bahkan para dewa dan Titan yang lahir kemudian. Berbeda dari kekacauan dalam pengertian modern, Chaos dalam mitologi Yunani lebih tepat dipahami sebagai kekosongan atau celah yang menganga luas, ruang hampa dari mana segala sesuatu yang ada akhirnya bermula. Dari Chaos inilah lahir empat entitas primordial pertama tanpa perlu pasangan: Gaia (Bumi), Tartarus (Jurang Dunia Bawah), Eros (Cinta Primordial), dan Erebus bersama Nyx (Kegelapan dan Malam).

Sebagai kekosongan awal, Chaos melambangkan potensi murni yang belum berbentuk, sebuah keadaan sebelum keteraturan, sebelum ruang dan waktu memiliki batas yang jelas. Ia bukanlah dewa dengan kepribadian atau bentuk fisik seperti dewa-dewa lain, melainkan lebih merupakan kondisi kosmis, prinsip abstrak yang menjadi wadah bagi kelahiran seluruh ciptaan. Karena sifatnya yang berada di luar konsep waktu dan ruang biasa, Chaos tidak memiliki mitos petualangan atau kisah personal seperti para dewa yang lahir setelahnya, namun keberadaannya tetap menjadi fondasi mutlak bagi seluruh kosmologi Yunani.

Dalam susunan silsilah Hesiod, kemunculan Chaos menandai titik nol dari seluruh mitologi Yunani, tempat dari mana Bumi, Langit, Laut, dan seluruh generasi dewa berikutnya akhirnya bercabang. Konsep Chaos ini kemudian memengaruhi banyak pemikiran filsafat Yunani kuno tentang asal usul alam semesta, termasuk gagasan-gagasan awal kosmogoni yang mencoba menjelaskan bagaimana keteraturan bisa muncul dari ketiadaan. Warisan kata chaos sendiri bertahan hingga bahasa modern, meski maknanya telah bergeser dari celah kosong primordial menjadi kekacauan dalam pengertian sehari-hari, sebuah pergeseran makna yang menarik dari akar mitologisnya yang jauh lebih tenang dan mendasar.''',
    storyEn: '''
According to Hesiod's Theogony, Chaos is the very first entity to come into being in the universe, preceding even the gods and Titans who were born afterward. Unlike the modern sense of the word, Chaos in Greek mythology is more accurately understood as a vast yawning void or gap, an empty space from which everything that exists ultimately originated. From Chaos alone, without need of a partner, emerged the first four primordial beings: Gaia (Earth), Tartarus (the Abyss of the Underworld), Eros (Primordial Love), and Erebus together with Nyx (Darkness and Night).

As the primordial void, Chaos represents pure, unformed potential, a state that existed before order, before space and time had any clear boundaries. It is not a god with a personality or physical form like the deities that followed, but rather a cosmic condition, an abstract principle that served as the vessel from which all creation was born. Because it exists outside ordinary concepts of time and space, Chaos has no myths of adventure or personal story like the gods born after it, yet its existence remains the absolute foundation of the entire Greek cosmology.

In Hesiod's genealogical framework, the emergence of Chaos marks the zero point of all Greek mythology, the source from which Earth, Sky, Sea, and every subsequent generation of gods eventually branched out. This concept of Chaos went on to influence much of ancient Greek philosophical thought about the origin of the universe, including early cosmogonic ideas that attempted to explain how order could arise from nothingness. The legacy of the word chaos itself survives into modern language, though its meaning has shifted from a primordial empty gap to disorder in everyday usage, an interesting shift from its far calmer and more foundational mythological root.''',
    imageUrl: 'assets/images/Greek/Primordial/chaos.webp',
    category: 'Primordial',
  ),
  God(
    id: '89',
    name: 'Gaia',
    mythology: 'Greek',
    title: 'Ibu Bumi',
    titleEn: 'Mother Earth',
    symbol: '🌍',
    powers: ['Bumi', 'Kesuburan', 'Penciptaan', 'Alam', 'Keibuan'],
    powersEn: ['Earth', 'Fertility', 'Creation', 'Nature', 'Motherhood'],
    story: '''
Gaia adalah salah satu dari empat entitas primordial pertama yang muncul dari Chaos, dan sering dipandang sebagai personifikasi Bumi itu sendiri dalam mitologi Yunani. Tanpa memerlukan pasangan, Gaia melahirkan Uranus (Langit), Pontus (Laut), dan Ourea (Pegunungan) secara mandiri, sebelum kemudian bersatu dengan Uranus, putranya sendiri, untuk melahirkan generasi Titan, para Cyclops bermata satu, dan Hecatoncheires bertangan seratus. Sebagai leluhur hampir seluruh dewa dan makhluk dalam mitologi Yunani, Gaia menempati posisi sebagai ibu purba dari segala kehidupan.

Sebagai Ibu Bumi, Gaia melambangkan kesuburan, penciptaan, dan kekuatan alam yang menopang seluruh kehidupan di dunia, dipuja sebagai sumber dari tanah, tumbuhan, dan segala yang tumbuh di permukaan bumi. Ia digambarkan sebagai sosok keibuan yang penuh kasih namun juga tegas, tidak segan bertindak ketika anak-anaknya diperlakukan tidak adil, sebuah sifat yang berulang kali muncul dalam berbagai mitos tentang campur tangannya dalam urusan para dewa. Karena perannya sebagai fondasi fisik dunia, Gaia sering dianggap hadir di mana-mana, tidak terikat pada satu wilayah tertentu, melainkan menjadi bumi itu sendiri dalam wujud personifikasinya.

Salah satu kisah paling penting tentang Gaia adalah perannya dalam penggulingan Uranus, ketika suaminya sendiri mengurung anak-anak mereka, para Cyclops dan Hecatoncheires, jauh di dalam tubuhnya karena rasa jijik dan takut akan kekuatan mereka; Gaia yang murka kemudian menciptakan sabit adamantine dan membujuk putranya Cronus untuk mengebiri ayahnya sebagai balas dendam. Dari darah Uranus yang tertumpah lahirlah para Erinyes, Giants, dan Meliae, sementara dari alat kelaminnya yang jatuh ke laut lahirlah Aphrodite. Di kemudian hari, Gaia juga berperan melawan Zeus dengan melahirkan Typhon dan mendukung para Giant dalam Gigantomachy, menjadikannya kekuatan primordial yang terus memengaruhi jalannya sejarah para dewa Olympian, sekaligus figur yang hingga kini dikenang sebagai simbol universal Ibu Pertiwi.''',
    storyEn: '''
Gaia is one of the first four primordial beings to emerge from Chaos, and she is widely regarded as the personification of the Earth itself in Greek mythology. Without need of a partner, Gaia gave birth to Uranus (Sky), Pontus (Sea), and Ourea (the Mountains) on her own, before later uniting with Uranus, her own son, to produce the generation of Titans, the one-eyed Cyclopes, and the hundred-handed Hecatoncheires. As the ancestor of nearly every god and creature in Greek mythology, Gaia occupies the position of the primeval mother of all life.

As Mother Earth, Gaia represents fertility, creation, and the natural forces that sustain all life in the world, worshipped as the source of soil, plants, and everything that grows upon the earth's surface. She is portrayed as a loving maternal figure who is nonetheless firm and unafraid to act when her children are treated unjustly, a trait that appears repeatedly throughout the many myths describing her intervention in the affairs of the gods. Because of her role as the physical foundation of the world, Gaia is often regarded as omnipresent, not confined to any single region, but existing as the earth itself in personified form.

One of the most important stories about Gaia concerns her role in the overthrow of Uranus, when her own husband imprisoned their children, the Cyclopes and Hecatoncheires, deep within her body out of disgust and fear of their power; the furious Gaia then fashioned an adamantine sickle and persuaded her son Cronus to castrate his father in revenge. From the blood spilled by Uranus arose the Erinyes, the Giants, and the Meliae, while from his severed genitals cast into the sea arose Aphrodite. Later, Gaia also turned against Zeus by giving birth to Typhon and supporting the Giants in the Gigantomachy, making her a primordial force that continued to shape the course of Olympian history, and a figure still remembered today as a universal symbol of Mother Earth.''',
    imageUrl: 'assets/images/Greek/Primordial/gaia.webp',
    category: 'Primordial',
  ),
  God(
    id: '90',
    name: 'Uranus',
    mythology: 'Greek',
    title: 'Langit Purba',
    titleEn: 'The Primordial Sky',
    symbol: '☁️',
    powers: ['Langit', 'Surga', 'Penciptaan', 'Kekuasaan', 'Bintang'],
    powersEn: ['Sky', 'Heavens', 'Creation', 'Dominion', 'Stars'],
    story: '''
Uranus adalah personifikasi Langit dalam mitologi Yunani, salah satu entitas primordial yang lahir dari Gaia, Bumi, tanpa memerlukan ayah. Setelah lahir, Uranus menyelimuti Gaia dari segala penjuru, menjadikan dirinya sekaligus suami dan putranya sendiri, sebuah pola hubungan yang umum ditemukan di antara para dewa purba dalam kosmologi Yunani. Bersama Gaia, Uranus menjadi ayah dari dua belas Titan, tiga Cyclops bermata satu, dan tiga Hecatoncheires bertangan seratus, menjadikannya leluhur langsung dari hampir seluruh generasi dewa yang muncul setelahnya.

Sebagai penguasa langit purba, Uranus melambangkan kekuasaan tertinggi atas alam semesta pada masa awal penciptaan, memerintah bersama Gaia sebelum ada satu pun generasi dewa lain yang menantang otoritas mereka. Ia digambarkan sebagai sosok yang penuh kecurigaan dan ketakutan terhadap kekuatan anak-anaknya sendiri, terutama para Cyclops dan Hecatoncheires yang memiliki wujud mengerikan dan kekuatan luar biasa. Sifat tirani dan rasa takutnya terhadap keturunannya sendiri inilah yang menjadi penyebab langsung dari kejatuhannya, menjadikan Uranus figur peringatan tentang bahaya kekuasaan yang dijalankan dengan rasa takut dan penindasan.

Karena takut digulingkan, Uranus memenjarakan anak-anaknya yang dianggapnya menjijikkan, para Cyclops dan Hecatoncheires, jauh di dalam tubuh Gaia, tindakan yang membuat Gaia sangat murka dan mendorongnya untuk membuat sabit adamantine dan meminta bantuan anak-anaknya menggulingkan sang ayah. Hanya Cronus, Titan bungsu, yang berani menerima tugas itu; ia menyergap Uranus dan mengebirinya dengan sabit tersebut, memisahkan Langit dari Bumi untuk selamanya dan mengakhiri masa kekuasaan Uranus. Dari darahnya yang tertumpah ke bumi lahirlah para Erinyes, Giants, dan Meliae, sementara dari alat kelaminnya yang terlempar ke laut muncul Aphrodite, menjadikan kejatuhan Uranus salah satu peristiwa paling menentukan dalam seluruh kosmologi Yunani karena membuka jalan bagi era kekuasaan Cronus dan para Titan.''',
    storyEn: '''
Uranus is the personification of the Sky in Greek mythology, one of the primordial beings born from Gaia, the Earth, without need of a father. After his birth, Uranus enveloped Gaia from every direction, making himself both her husband and her son, a pattern of relationship commonly found among the primeval deities of Greek cosmology. Together with Gaia, Uranus fathered the twelve Titans, the three one-eyed Cyclopes, and the three hundred-handed Hecatoncheires, making him the direct ancestor of nearly every generation of gods that followed.

As the primordial ruler of the sky, Uranus represents supreme authority over the universe in the earliest age of creation, reigning alongside Gaia before any other generation of gods rose to challenge their authority. He is portrayed as a figure consumed by suspicion and fear of his own children's power, especially the Cyclopes and Hecatoncheires, whose terrifying forms and extraordinary strength unsettled him. This tyrannical nature and fear of his own offspring became the direct cause of his downfall, making Uranus a cautionary figure about the dangers of power exercised through fear and oppression.

Fearing he would be overthrown, Uranus imprisoned the children he found repulsive, the Cyclopes and Hecatoncheires, deep within Gaia's body, an act that enraged Gaia so greatly that she fashioned an adamantine sickle and asked her children to help her overthrow their father. Only Cronus, the youngest Titan, dared accept the task; he ambushed Uranus and castrated him with the sickle, separating Sky from Earth forever and ending Uranus's reign. From the blood that spilled onto the earth arose the Erinyes, the Giants, and the Meliae, while from his severed genitals cast into the sea arose Aphrodite, making the fall of Uranus one of the most decisive events in all of Greek cosmology, since it opened the way for the age of Cronus and the Titans.''',
    imageUrl: 'assets/images/Greek/Primordial/uranus.webp',
    category: 'Primordial',
  ),
  God(
    id: '91',
    name: 'Tartarus',
    mythology: 'Greek',
    title: 'Jurang Dunia Bawah',
    titleEn: 'The Abyss of the Underworld',
    symbol: '⚫',
    powers: ['Jurang', 'Hukuman', 'Kegelapan', 'Pemenjaraan', 'Kedalaman'],
    powersEn: ['Abyss', 'Punishment', 'Darkness', 'Imprisonment', 'Depth'],
    story: '''
Tartarus adalah salah satu dari empat entitas primordial pertama yang muncul langsung dari Chaos, sejajar kelahirannya dengan Gaia, Eros, serta Erebus dan Nyx. Ia adalah personifikasi sekaligus tempat itu sendiri, sebuah jurang yang letaknya jauh di bawah dunia bawah tanah, bahkan lebih dalam dari kerajaan Hades, sehingga menurut Hesiod, sebuah landasan perunggu yang dijatuhkan dari langit membutuhkan sembilan hari sembilan malam untuk mencapai dasarnya. Dalam beberapa tradisi, Tartarus juga digambarkan bersatu dengan Gaia untuk melahirkan Typhon, monster paling mengerikan dalam mitologi Yunani.

Sebagai personifikasi jurang dan kegelapan paling dalam, Tartarus melambangkan hukuman dan pemenjaraan bagi mereka yang telah melakukan pelanggaran besar terhadap tatanan kosmis, menjadikannya tempat yang dijauhi dan ditakuti bahkan oleh para dewa. Kedalamannya yang tak terbayangkan dan kegelapannya yang pekat menjadikan Tartarus berbeda dari Hades, yang lebih merupakan tempat tinggal umum bagi jiwa orang mati, sementara Tartarus dikhususkan sebagai penjara bagi entitas paling berbahaya dan bersalah. Karena sifatnya yang menakutkan dan tak tertembus, Tartarus dijaga ketat, dikelilingi tembok perunggu dan gerbang besi, menjadikannya benar-benar mustahil untuk melarikan diri.

Setelah kemenangan Zeus dalam Titanomachy, Tartarus menjadi penjara bagi Cronus dan sebagian besar Titan yang kalah perang, yang kemudian dijaga ketat oleh para Hecatoncheires atas perintah Zeus agar mereka tidak pernah bisa kembali menantang kekuasaan Olympian. Di kemudian hari, Tartarus juga menjadi tempat hukuman bagi para pendosa besar dalam mitologi seperti Sisyphus, Tantalus, dan Ixion, yang masing-masing menjalani siksaan abadi sebagai balasan atas pelanggaran mereka terhadap para dewa. Sebagai simbol hukuman kosmis yang paling ekstrem, Tartarus tetap menjadi rujukan penting dalam kebudayaan Barat hingga kini, sering digunakan sebagai sinonim untuk neraka atau tempat siksaan abadi dalam berbagai karya sastra dan seni.''',
    storyEn: '''
Tartarus is one of the first four primordial beings to emerge directly from Chaos, born alongside Gaia, Eros, and Erebus together with Nyx. He is both a personification and an actual place, an abyss located far below the underworld itself, deeper even than the realm of Hades, so deep that according to Hesiod a bronze anvil dropped from the sky would take nine days and nine nights to reach its bottom. In some traditions, Tartarus is also described as uniting with Gaia to produce Typhon, the most fearsome monster in Greek mythology.

As the personification of the deepest abyss and darkness, Tartarus represents punishment and imprisonment for those who have committed grave offenses against cosmic order, making it a place avoided and feared even by the gods themselves. Its unimaginable depth and impenetrable darkness set it apart from Hades, which functions more as the general resting place for the souls of the dead, while Tartarus is reserved specifically as a prison for the most dangerous and guilty beings. Because of its terrifying and inescapable nature, Tartarus is guarded closely, surrounded by bronze walls and iron gates, making escape from it truly impossible.

After Zeus's victory in the Titanomachy, Tartarus became the prison for Cronus and most of the defeated Titans, who were then guarded closely by the Hecatoncheires on Zeus's orders so that they could never again rise to challenge Olympian rule. Later, Tartarus also became the site of punishment for great sinners of mythology such as Sisyphus, Tantalus, and Ixion, each of whom endured eternal torment as retribution for their offenses against the gods. As the ultimate symbol of cosmic punishment, Tartarus remains an important reference point in Western culture to this day, frequently used as a synonym for hell or a place of eternal torment in countless works of literature and art.''',
    imageUrl: 'assets/images/Greek/Primordial/tartarus.webp',
    category: 'Primordial',
  ),
  God(
    id: '92',
    name: 'Eros',
    mythology: 'Greek',
    title: 'Dewa Cinta Primordial',
    titleEn: 'Primordial God of Love',
    symbol: '💘',
    powers: ['Cinta', 'Hasrat', 'Daya Cipta', 'Ketertarikan', 'Penyatuan'],
    powersEn: ['Love', 'Desire', 'Creative Force', 'Attraction', 'Union'],
    story: '''
Eros, dalam tradisi tertua mitologi Yunani menurut Theogony karya Hesiod, adalah salah satu dari empat entitas primordial pertama yang muncul dari Chaos, lahir bersama Gaia, Tartarus, serta Erebus dan Nyx, jauh sebelum generasi Titan maupun Olympian ada. Ini berbeda dari tradisi yang lebih dikenal luas di kemudian hari, yang menggambarkan Eros sebagai putra Aphrodite dan Ares, dewa cinta kecil bersayap yang membawa panah asmara; kedua versi ini hidup berdampingan dalam mitologi Yunani sebagai lapisan tradisi yang berbeda usianya. Sebagai entitas primordial, Eros yang dimaksud oleh Hesiod jauh lebih purba dan mendasar dibandingkan citra Eros yang populer di kemudian hari.

Sebagai dewa cinta primordial, Eros melambangkan kekuatan hasrat dan daya tarik yang mendorong penyatuan, sebuah kekuatan kosmis yang diperlukan agar entitas-entitas primordial lain dapat saling bersatu dan melahirkan generasi dewa berikutnya. Tanpa Eros, menurut pemahaman kosmogoni Yunani awal, tidak akan ada dorongan untuk penciptaan lebih lanjut, karena hasratlah yang menggerakkan Gaia dan Uranus, serta pasangan-pasangan primordial lainnya, untuk saling bersatu dan berkembang biak. Eros digambarkan sebagai kekuatan yang tak tertahankan, mampu melemahkan pikiran dan tekad bahkan makhluk paling kuat sekalipun, sebuah tema yang terus berulang dalam berbagai kisah cinta di mitologi Yunani.

Peran Eros sebagai kekuatan pemersatu kosmis dijelaskan langsung oleh Hesiod sebagai salah satu dari empat kekuatan pertama yang membentuk alam semesta, menjadikannya elemen esensial dalam proses penciptaan itu sendiri, bukan sekadar dewa asmara semata. Seiring waktu, tradisi mitologi mulai menggabungkan sosok primordial ini dengan Eros yang lebih muda, putra Aphrodite, yang tampil dalam kisah-kisah populer seperti asmara Eros dengan Psyche yang dicatat oleh Apuleius. Warisan ganda Eros ini, sebagai kekuatan kosmis purba sekaligus dewa asmara individu, menjadikannya salah satu figur mitologi Yunani yang paling kaya lapisan makna, memengaruhi konsep cinta dalam filsafat Yunani, termasuk gagasan eros dalam pemikiran Plato tentang cinta ideal.''',
    storyEn: '''
In the oldest tradition of Greek mythology, as recorded in Hesiod's Theogony, Eros is one of the first four primordial beings to emerge from Chaos, born alongside Gaia, Tartarus, and Erebus together with Nyx, long before the generations of Titans or Olympians existed. This differs from the more widely known later tradition that portrays Eros as the son of Aphrodite and Ares, the small winged god of love who carries arrows of desire; both versions coexist within Greek mythology as layers of tradition from different eras. As a primordial being, the Eros described by Hesiod is far more ancient and fundamental than the more popular later image of Eros.

As the primordial god of love, Eros represents the force of desire and attraction that drives union, a cosmic power necessary for other primordial beings to unite with one another and give rise to the next generation of gods. Without Eros, according to early Greek cosmogony, there would be no impulse toward further creation, since it was desire that moved Gaia and Uranus, along with other primordial pairs, to unite and multiply. Eros is portrayed as an irresistible force, capable of weakening the mind and resolve of even the strongest beings, a theme that recurs throughout countless love stories in Greek mythology.

Eros's role as a cosmic unifying force is described directly by Hesiod as one of the four first powers that shaped the universe, making him an essential element of the creative process itself rather than merely a god of romance. Over time, mythological tradition began merging this primordial figure with the younger Eros, son of Aphrodite, who appears in popular stories such as the romance between Eros and Psyche recorded by Apuleius. This dual legacy of Eros, as both an ancient cosmic force and an individual god of romantic love, makes him one of the most richly layered figures in Greek mythology, influencing the concept of love within Greek philosophy, including the notion of eros in Plato's thought on ideal love.''',
    imageUrl: 'assets/images/Greek/Primordial/eros.webp',
    category: 'Primordial',
  ),
  God(
    id: '93',
    name: 'Nyx',
    mythology: 'Greek',
    title: 'Dewi Malam',
    titleEn: 'Goddess of the Night',
    symbol: '🌑',
    powers: ['Malam', 'Kegelapan', 'Misteri', 'Ramalan', 'Kekuatan Purba'],
    powersEn: ['Night', 'Darkness', 'Mystery', 'Prophecy', 'Primal Power'],
    story: '''
Nyx adalah personifikasi Malam, salah satu entitas primordial paling awal yang lahir dari Chaos, sering disebut lahir bersama saudaranya Erebus, personifikasi Kegelapan. Bersama Erebus, Nyx melahirkan Aether (Udara Atas yang cerah) dan Hemera (Siang), sepasang anak yang secara simbolis mewakili kebalikan dari sifat orang tua mereka sendiri. Selain itu, menurut Hesiod, Nyx juga melahirkan banyak entitas penting secara mandiri, termasuk Thanatos (Kematian), Hypnos (Tidur), para Moirai (Takdir), Nemesis (Pembalasan), dan Eris (Perselisihan), menjadikannya salah satu leluhur personifikasi paling produktif dalam mitologi Yunani.

Sebagai dewi malam, Nyx melambangkan kegelapan, misteri, dan kekuatan purba yang mendahului bahkan kekuasaan para dewa Olympian, dan meski jarang tampil langsung dalam kisah-kisah utama, kekuatannya digambarkan sangat besar dan disegani. Dalam Iliad karya Homer, bahkan Zeus sendiri digambarkan enggan membuat marah Nyx, saat ia menahan amarahnya terhadap Hypnos yang telah menipunya, semata-mata karena tidak ingin menyinggung sang dewi malam. Nyx sering dibayangkan mengendarai kereta melintasi langit setiap malam, membawa jubah kegelapan yang menyelimuti dunia, sosok yang agung, misterius, dan hampir tidak tersentuh oleh kekuatan dewa lain.

Kisah dalam Iliad Buku XIV menjadi salah satu bukti paling jelas tentang kekuatan luar biasa Nyx, ketika Hera meminta bantuan Hypnos, putra Nyx, untuk menidurkan Zeus, dan setelah tertangkap basah, Zeus yang murka memilih menahan amarahnya karena Hypnos melarikan diri ke pangkuan ibunya dan Zeus segan bertindak lancang terhadap Nyx bahkan dalam keadaan marah sekalipun. Kekuatan Nyx yang ditakuti bahkan oleh raja para dewa ini menegaskan statusnya sebagai salah satu kekuatan primordial paling dihormati dalam seluruh kosmologi Yunani. Warisannya bertahan melalui banyak anak keturunannya yang menjadi personifikasi konsep-konsep universal seperti kematian, tidur, dan takdir, menjadikan Nyx figur sentral yang mengikat berbagai aspek pengalaman manusia yang paling mendasar dengan asal mula alam semesta itu sendiri.''',
    storyEn: '''
Nyx is the personification of Night, one of the earliest primordial beings born from Chaos, often described as being born alongside her brother Erebus, the personification of Darkness. Together with Erebus, Nyx gave birth to Aether (the bright Upper Air) and Hemera (Day), a pair of children who symbolically represent the opposite of their own parents' nature. In addition, according to Hesiod, Nyx also produced many important entities on her own, including Thanatos (Death), Hypnos (Sleep), the Moirai (Fates), Nemesis (Retribution), and Eris (Strife), making her one of the most prolific ancestral personifications in Greek mythology.

As the goddess of night, Nyx represents darkness, mystery, and a primal power that predates even the authority of the Olympian gods, and although she rarely appears directly in the major myths, her power is described as immense and deeply respected. In Homer's Iliad, even Zeus himself is portrayed as reluctant to anger Nyx, restraining his fury toward Hypnos, who had deceived him, purely to avoid offending the goddess of night. Nyx is often imagined riding a chariot across the sky each night, trailing a cloak of darkness that envelops the world, a figure of majesty, mystery, and one almost untouchable by the power of other gods.

The episode in Book XIV of the Iliad stands as one of the clearest pieces of evidence for Nyx's extraordinary power, when Hera enlisted the help of Hypnos, Nyx's son, to lull Zeus to sleep, and upon discovering the deception, the furious Zeus chose to hold back his wrath because Hypnos fled to his mother's embrace, and Zeus was reluctant to act rashly against Nyx even in his anger. This power, feared even by the king of the gods, confirms Nyx's status as one of the most respected primordial forces in the entire Greek cosmology. Her legacy endures through her many offspring, who personify universal concepts such as death, sleep, and fate, making Nyx a central figure who binds the most fundamental aspects of human experience to the very origin of the universe.''',
    imageUrl: 'assets/images/Greek/Primordial/nyx.webp',
    category: 'Primordial',
  ),
  God(
    id: '94',
    name: 'Erebus',
    mythology: 'Greek',
    title: 'Dewa Kegelapan',
    titleEn: 'God of Darkness',
    symbol: '⬛',
    powers: ['Kegelapan', 'Bayangan', 'Dunia Bawah', 'Kabut', 'Misteri'],
    powersEn: ['Darkness', 'Shadow', 'Underworld', 'Mist', 'Mystery'],
    story: '''
Erebus adalah personifikasi Kegelapan primordial, lahir langsung dari Chaos bersama tiga entitas primordial lainnya: Gaia, Tartarus, dan Eros. Ia sering dipasangkan dengan saudarinya, Nyx, personifikasi Malam, dan dari persatuan mereka lahirlah Aether, personifikasi udara cerah di langit atas, serta Hemera, personifikasi Siang, dua anak yang secara simbolis merupakan kebalikan langsung dari sifat kedua orang tua mereka. Sebagai salah satu dari empat kekuatan pertama alam semesta, Erebus menempati posisi mendasar dalam struktur kosmologi Yunani purba.

Sebagai dewa kegelapan, Erebus melambangkan bayangan primordial dan kabut tebal yang menyelimuti dunia sebelum adanya cahaya, sering dikaitkan pula dengan kegelapan yang menyelubungi kedalaman dunia bawah. Namanya sendiri, Erebos, juga digunakan orang Yunani kuno untuk menyebut sebuah wilayah gelap di dunia bawah yang harus dilalui jiwa orang mati sebelum mencapai kerajaan Hades, menjadikan Erebus baik personifikasi dewa maupun nama tempat sekaligus. Ia digambarkan sebagai figur yang nyaris tidak berwujud, lebih merupakan kualitas kegelapan itu sendiri dibandingkan sosok dewa dengan kepribadian yang jelas, sehingga jarang muncul dalam kisah-kisah naratif yang melibatkan dialog atau tindakan langsung.

Karena sifatnya yang begitu abstrak, Erebus jarang menjadi tokoh utama dalam mitos naratif, namun perannya sebagai ayah dari Aether dan Hemera bersama Nyx menempatkannya dalam posisi penting sebagai leluhur dari konsep cahaya dan siang, sebuah ironi yang menarik karena kegelapan justru melahirkan cahaya. Beberapa penulis kuno, termasuk Hyginus, turut mencatatnya sebagai ayah dari sejumlah entitas lain seperti Charon, pengangkut jiwa di sungai Styx, meski catatan silsilah ini bervariasi antar sumber. Warisan nama Erebus bertahan hingga sekarang, digunakan secara luas dalam sastra dan budaya populer sebagai istilah untuk menggambarkan kegelapan total atau wilayah paling gelap dari dunia bawah, mengukuhkan posisinya sebagai simbol abadi dari misteri dan bayangan primordial.''',
    storyEn: '''
Erebus is the personification of primordial Darkness, born directly from Chaos alongside three other primordial beings: Gaia, Tartarus, and Eros. He is often paired with his sister Nyx, the personification of Night, and from their union came Aether, the personification of the bright upper air, and Hemera, the personification of Day, two children who symbolically represent the direct opposite of their parents' nature. As one of the first four powers of the universe, Erebus occupies a foundational position within the structure of ancient Greek cosmology.

As the god of darkness, Erebus represents the primordial shadow and thick mist that shrouded the world before the existence of light, and he is also often associated with the darkness that envelops the depths of the underworld. His very name, Erebos, was used by the ancient Greeks to refer to a dark region of the underworld that the souls of the dead had to pass through before reaching the realm of Hades, making Erebus both a personified god and a place name at once. He is portrayed as an almost formless figure, more a quality of darkness itself than a god with a clearly defined personality, and so he rarely appears in narrative myths involving dialogue or direct action.

Because of his highly abstract nature, Erebus is rarely a central character in narrative myth, yet his role as the father of Aether and Hemera together with Nyx places him in an important position as the ancestor of the concepts of light and day, an intriguing irony given that darkness gave rise to light. Some ancient writers, including Hyginus, also record him as the father of several other entities, such as Charon, the ferryman of souls across the river Styx, though these genealogical records vary between sources. The legacy of the name Erebus survives today, widely used in literature and popular culture as a term describing total darkness or the darkest region of the underworld, cementing his position as an enduring symbol of mystery and primordial shadow.''',
    imageUrl: 'assets/images/Greek/Primordial/erebus.webp',
    category: 'Primordial',
  ),

  God(
    id: '95',
    name: 'Helios',
    mythology: 'Greek',
    title: 'Dewa Matahari',
    titleEn: 'God of the Sun',
    symbol: '☀️',
    powers: ['Matahari', 'Cahaya', 'Penglihatan', 'Kereta Surya', 'Waktu'],
    powersEn: ['Sun', 'Light', 'All-Seeing', 'Sun Chariot', 'Time'],
    story: '''
Helios adalah Titan generasi kedua, putra dari Hyperion dan Theia, serta saudara dari Selene, dewi Bulan, dan Eos, dewi Fajar. Sebagai salah satu dari tiga dewa langit yang lahir dari pasangan Titan cahaya ini, Helios mewarisi tugas paling penting: menerangi dunia setiap hari dengan menunggangi kereta matahari melintasi langit dari timur ke barat. Kedudukannya sebagai dewa yang mengendalikan siklus siang menjadikannya salah satu Titan yang tetap aktif dan dihormati bahkan setelah generasi Olympian mengambil alih kekuasaan dari para Titan lainnya.

Setiap hari, Helios digambarkan mengendarai kereta emasnya yang ditarik empat kuda berapi melintasi langit, memancarkan cahaya matahari yang menerangi seluruh dunia, sebelum turun ke barat dan berlayar kembali ke timur melalui lautan mengelilingi bumi sepanjang malam menggunakan sebuah cangkir emas raksasa. Karena posisinya yang tinggi di langit, Helios dijuluki yang melihat segalanya, sebab dari kereta emasnya ia dapat menyaksikan segala peristiwa yang terjadi di bumi maupun di antara para dewa, menjadikannya saksi penting dalam berbagai mitos. Sifatnya digambarkan teliti dan jujur, seorang dewa yang setia menjalankan tugasnya tanpa henti setiap hari sepanjang masa.

Karena kemampuannya melihat segala sesuatu, Helios berperan penting dalam beberapa mitos terkenal: ia adalah saksi yang memberi tahu Demeter tentang penculikan putrinya, Persephone, oleh Hades, dan ia pula yang mengungkap kepada Hephaestus perselingkuhan istrinya, Aphrodite, dengan Ares. Salah satu kisah paling tragis melibatkan putranya, Phaethon, yang memohon untuk mengendarai kereta matahari sang ayah selama sehari namun kehilangan kendali, hampir membakar bumi hingga akhirnya Zeus terpaksa menyambarnya dengan petir untuk menghentikan bencana tersebut. Helios juga menjadi ayah dari Circe dan Aeetes, raja Colchis dalam kisah Jason dan Argonaut, serta kelak mengalami penggabungan sebagian sifat dengan Apollo pada masa Yunani klasik dan Helenistik, meski keduanya awalnya adalah dewa yang berbeda dan terpisah dalam mitologi tertua.''',
    storyEn: '''
Helios is a second-generation Titan, the son of Hyperion and Theia, and the brother of Selene, goddess of the Moon, and Eos, goddess of the Dawn. As one of three sky deities born from this pair of light-bearing Titans, Helios inherited the most vital task of all: illuminating the world each day by driving the sun chariot across the sky from east to west. His role as the deity governing the cycle of daylight kept him active and honored even after the Olympian generation took power from most of the other Titans.

Each day, Helios is depicted driving his golden chariot, drawn by four fiery horses, across the sky, radiating sunlight that illuminates the entire world, before descending in the west and sailing back to the east through the ocean encircling the earth each night in a giant golden cup. Because of his elevated position in the sky, Helios earned the epithet all-seeing, since from his golden chariot he could witness every event occurring on earth and among the gods, making him an important witness in numerous myths. He is portrayed as meticulous and honest, a god faithfully carrying out his duty without fail, day after day, throughout all time.

Because of his ability to see everything, Helios plays a crucial role in several famous myths: he was the witness who informed Demeter of the abduction of her daughter Persephone by Hades, and he was also the one who revealed to Hephaestus the affair between his wife, Aphrodite, and Ares. One of the most tragic stories involves his son Phaethon, who begged to drive his father's sun chariot for a single day but lost control of it, nearly setting the earth ablaze, until Zeus was forced to strike him down with a thunderbolt to stop the disaster. Helios also fathered Circe and Aeetes, the king of Colchis in the story of Jason and the Argonauts, and in later Classical and Hellenistic Greece he came to be partly merged in character with Apollo, although the two were originally distinct and separate gods in the oldest mythology.''',
    imageUrl: 'assets/images/Greek/Titans/helios.webp',
    category: 'Titan',
  ),
  God(
    id: '96',
    name: 'Selene',
    mythology: 'Greek',
    title: 'Dewi Bulan',
    titleEn: 'Goddess of the Moon',
    symbol: '🌙',
    powers: ['Bulan', 'Cahaya Malam', 'Kereta Bulan', 'Siklus', 'Mimpi'],
    powersEn: ['Moon', 'Night Light', 'Moon Chariot', 'Cycles', 'Dreams'],
    story: '''
Selene adalah Titan generasi kedua, putri dari Hyperion dan Theia, serta saudari dari Helios, dewa Matahari, dan Eos, dewi Fajar. Sebagai salah satu dari tiga dewa langit bercahaya ini, Selene mewarisi tugas menerangi dunia pada malam hari, melengkapi peran saudaranya Helios yang menguasai siang. Bersama saudara-saudaranya, Selene menempati posisi penting sebagai penguasa siklus cahaya alami yang mengatur kehidupan sehari-hari manusia di dunia purba.

Setiap malam, Selene digambarkan mengendarai kereta peraknya yang ditarik oleh dua ekor kuda putih atau kadang lembu jantan bertanduk perak, melintasi langit malam dan menyinari dunia dengan cahaya bulan yang lembut. Cahaya bulan yang ia bawa dikaitkan erat dengan siklus dan ritme alam, termasuk pasang surut air laut dan perhitungan waktu berdasarkan penanggalan bulan yang digunakan masyarakat Yunani kuno. Selene juga dikaitkan dengan dunia mimpi, karena malam yang diterangi cahayanya dianggap sebagai waktu ketika batas antara dunia nyata dan dunia mimpi menjadi tipis, sebuah sifat yang menjadikannya sosok yang lembut namun penuh misteri.

Kisah paling terkenal tentang Selene adalah cintanya kepada Endymion, seorang pemuda gembala fana yang kecantikannya begitu memikat sehingga Selene meminta Zeus mengaruniakannya tidur abadi agar ia tetap muda selamanya dan Selene dapat terus mengunjungi serta memandanginya setiap malam tanpa harus kehilangan dirinya pada kematian. Menurut beberapa versi mitos, dari pertemuan-pertemuan itu Selene melahirkan lima puluh putri, yang dipahami sebagai personifikasi dari lima puluh bulan yang berlalu di antara setiap penyelenggaraan Pesta Olimpiade kuno. Kisah cinta Selene dan Endymion menjadi salah satu metafora paling abadi dalam sastra dan seni Barat tentang cinta yang melampaui batas kematian, sementara Selene sendiri tetap menjadi simbol keindahan bulan yang tenang dan penuh kerinduan.''',
    storyEn: '''
Selene is a second-generation Titan, the daughter of Hyperion and Theia, and the sister of Helios, god of the Sun, and Eos, goddess of the Dawn. As one of three luminous sky deities, Selene inherited the task of illuminating the world at night, complementing her brother Helios's rule over the day. Together with her siblings, Selene occupies an important position as ruler of the natural cycles of light that governed daily life for people in the ancient world.

Each night, Selene is depicted driving her silver chariot, drawn by two white horses or sometimes by silver-horned oxen, across the night sky, bathing the world in the soft glow of moonlight. The moonlight she carries is closely linked to the cycles and rhythms of nature, including the ebb and flow of the tides and the calculation of time through the lunar calendar used by the ancient Greeks. Selene is also associated with the realm of dreams, since the night illuminated by her light was considered a time when the boundary between the waking world and the dream world grew thin, a quality that made her a gentle yet deeply mysterious figure.

The most famous story involving Selene is her love for Endymion, a mortal shepherd whose beauty so captivated her that she asked Zeus to grant him eternal sleep so that he would remain forever young, allowing Selene to visit and gaze upon him every night without ever losing him to death. According to some versions of the myth, from these nightly visits Selene bore fifty daughters, understood as personifications of the fifty months that passed between each celebration of the ancient Olympic Games. The love story of Selene and Endymion has become one of the most enduring metaphors in Western literature and art for a love that transcends the boundary of death, while Selene herself remains a lasting symbol of the moon's quiet and yearning beauty.''',
    imageUrl: 'assets/images/Greek/Titans/selene.webp',
    category: 'Titan',
  ),

  God(
    id: '97',
    name: 'Persephone',
    mythology: 'Greek',
    title: 'Ratu Dunia Bawah',
    titleEn: 'Queen of the Underworld',
    symbol: '🌸',
    powers: ['Musim Semi', 'Dunia Bawah', 'Pertumbuhan', 'Kematian & Kelahiran', 'Kekuasaan'],
    powersEn: ['Spring', 'Underworld', 'Growth', 'Death & Rebirth', 'Sovereignty'],
    story: '''
Persephone adalah putri dari Zeus, raja para dewa Olympian, dan Demeter, dewi pertanian dan kesuburan, menjadikannya salah satu dewi generasi ketiga yang lahir dari perkawinan dua kekuatan besar Olympus. Masa mudanya dihabiskan sebagai gadis ceria yang dikenal dengan nama Kore, sang gadis, sebelum peristiwa besar mengubah nasibnya selamanya dan mengangkatnya menjadi Ratu Dunia Bawah. Kedudukan ganda Persephone, sebagai putri dewi kesuburan sekaligus permaisuri penguasa dunia bawah, menjadikannya salah satu figur paling kompleks dalam mitologi Yunani.

Sebagai Ratu Dunia Bawah, Persephone melambangkan siklus abadi antara kematian dan kelahiran kembali, kekuasaan yang tercermin dalam pergantian musim setiap tahun; kehadirannya di dunia atas membawa musim semi dan pertumbuhan, sementara kepergiannya ke dunia bawah membawa musim gugur dan musim dingin yang tandus. Ia sering digambarkan membawa bulir gandum dan buah delima, simbol pertumbuhan sekaligus ikatannya dengan dunia bawah, mencerminkan dua sisi kepribadiannya, lembut dan penuh kasih sebagai dewi kesuburan, namun juga tegas dan berwibawa sebagai penguasa alam kematian. Persephone memerintah dunia bawah berdampingan dengan suaminya Hades, memegang kekuasaan penuh atas nasib jiwa-jiwa yang telah meninggal.

Mitos paling terkenal tentang Persephone, yang tercatat dalam Homeric Hymn to Demeter, menceritakan penculikannya oleh Hades saat ia sedang memetik bunga narsisus di padang rumput; Demeter yang berduka kemudian membuat seluruh bumi menjadi tandus dan gagal panen sampai Zeus turun tangan memerintahkan Hades untuk mengembalikannya. Namun karena Persephone telah memakan beberapa biji delima di dunia bawah, sebuah ikatan yang tidak dapat dibatalkan sepenuhnya, disepakati bahwa ia harus menghabiskan sepertiga tahun bersama Hades di dunia bawah dan sisanya bersama ibunya di dunia atas, sebuah kompromi yang menjadi penjelasan mitologis bagi pergantian musim. Kisah Persephone kemudian menjadi dasar bagi Misteri Eleusinian, salah satu ritual keagamaan paling dihormati di Yunani kuno, yang menjanjikan pengikutnya pemahaman tentang kehidupan setelah kematian melalui pemahaman siklus abadi Persephone sendiri.''',
    storyEn: '''
Persephone is the daughter of Zeus, king of the Olympian gods, and Demeter, goddess of agriculture and fertility, making her one of the third-generation goddesses born from the union of two great powers of Olympus. She spent her youth as a joyful young girl known as Kore, the maiden, before a momentous event forever altered her fate and elevated her to become Queen of the Underworld. Persephone's dual status, as both the daughter of the goddess of fertility and the consort of the ruler of the underworld, makes her one of the most complex figures in Greek mythology.

As Queen of the Underworld, Persephone represents the eternal cycle of death and rebirth, a power reflected in the yearly turning of the seasons; her presence in the world above brings spring and growth, while her descent into the underworld brings autumn and the barren cold of winter. She is often depicted holding stalks of grain and a pomegranate, symbols of both growth and her binding tie to the underworld, reflecting the two sides of her character, gentle and nurturing as a goddess of fertility, yet firm and authoritative as ruler of the realm of the dead. Persephone governs the underworld alongside her husband Hades, holding full authority over the fate of the souls of the deceased.

The most famous myth involving Persephone, recorded in the Homeric Hymn to Demeter, tells of her abduction by Hades while she was gathering narcissus flowers in a meadow; the grieving Demeter then caused the entire earth to become barren and crops to fail until Zeus intervened and ordered Hades to return her. However, because Persephone had already eaten several pomegranate seeds in the underworld, a bond that could not be fully undone, it was agreed that she would spend a third of the year with Hades in the underworld and the rest with her mother in the world above, a compromise that became the mythological explanation for the changing seasons. Persephone's story later became the foundation for the Eleusinian Mysteries, one of the most revered religious rites of ancient Greece, which promised its initiates understanding of the afterlife through insight into Persephone's own eternal cycle.''',
    imageUrl: 'assets/images/Greek/Underworld/persephone.webp',
    category: 'Underworld',
  ),
  God(
    id: '98',
    name: 'Thanatos',
    mythology: 'Greek',
    title: 'Personifikasi Kematian',
    titleEn: 'Personification of Death',
    symbol: '⚰️',
    powers: ['Kematian', 'Ajal', 'Ketenangan', 'Takdir', 'Perpisahan'],
    powersEn: ['Death', 'Mortality', 'Peace', 'Fate', 'Passing'],
    story: '''
Thanatos adalah personifikasi Kematian dalam mitologi Yunani, putra dari Nyx, dewi Malam, lahir tanpa memerlukan ayah menurut catatan Hesiod, meski beberapa sumber lain menyebutkan Erebus sebagai ayahnya. Ia adalah saudara kembar dari Hypnos, dewa Tidur, sebuah hubungan yang sangat simbolis karena tidur dan kematian sering dipandang sebagai dua keadaan yang serupa namun berbeda tingkat keabadiannya. Sebagai salah satu dari banyak anak Nyx yang mempersonifikasikan konsep-konsep universal, Thanatos menempati posisi penting sebagai kekuatan yang tidak dapat dihindari oleh makhluk fana mana pun.

Thanatos melambangkan kematian yang tenang dan wajar, berbeda dari para Keres, roh-roh kematian kejam yang mempersonifikasikan kematian penuh kekerasan di medan perang atau akibat penyakit mendadak. Ia digambarkan sebagai sosok yang tidak kejam maupun jahat, melainkan pembawa kedamaian yang tak terelakkan, menjalankan tugasnya membawa jiwa fana ke dunia bawah dengan adil tanpa memihak kepada siapa pun, baik raja maupun rakyat jelata. Karena sifatnya yang netral dan pasti, Thanatos sering dianggap sebagai simbol dari takdir kematian itu sendiri, sebuah kekuatan yang bahkan para dewa hormati sebagai bagian tak terpisahkan dari tatanan kosmis.

Salah satu mitos paling terkenal tentang Thanatos melibatkan Sisyphus, raja licik yang berhasil menipu dan membelenggu Thanatos dengan rantainya sendiri, sehingga untuk sementara waktu tidak ada satu pun makhluk di bumi yang bisa mati, sampai akhirnya Ares turun tangan membebaskan Thanatos karena kekacauan yang ditimbulkan mengganggu jalannya peperangan. Dalam drama Alcestis karya Euripides, Thanatos juga datang untuk menjemput Alcestis, seorang ratu yang rela mengorbankan nyawanya menggantikan suaminya, namun ia dikalahkan dalam pergulatan oleh Heracles yang berhasil merebut kembali nyawa sang ratu dari cengkeramannya. Melalui kisah-kisah ini, Thanatos menjadi representasi abadi dari kematian sebagai kekuatan yang pasti namun dapat ditunda sesaat oleh kecerdikan atau keberanian luar biasa, sebuah gagasan yang terus menginspirasi karya sastra dan seni hingga zaman modern.''',
    storyEn: '''
Thanatos is the personification of Death in Greek mythology, a son of Nyx, goddess of Night, born without need of a father according to Hesiod's account, though some other sources name Erebus as his father. He is the twin brother of Hypnos, god of Sleep, a deeply symbolic relationship since sleep and death were often regarded as two similar states differing only in their degree of permanence. As one of the many children of Nyx who personify universal concepts, Thanatos occupies an essential position as a force no mortal being can ever escape.

Thanatos represents death that is calm and natural, distinct from the Keres, the fierce spirits of death who personify violent death on the battlefield or from sudden illness. He is portrayed as neither cruel nor malicious, but as the bearer of an inevitable peace, carrying out his duty of leading mortal souls to the underworld fairly and without favoring anyone, whether king or commoner. Because of his neutral and certain nature, Thanatos is often regarded as a symbol of the fate of death itself, a force respected even by the gods as an inseparable part of the cosmic order.

One of the most famous myths involving Thanatos concerns Sisyphus, the cunning king who managed to trick and bind Thanatos in his own chains, so that for a time no creature on earth could die, until Ares finally intervened and freed Thanatos because the resulting chaos was disrupting the course of war. In Euripides's tragedy Alcestis, Thanatos also comes to claim Alcestis, a queen who willingly sacrificed her own life in place of her husband's, but he is overcome in a physical struggle by Heracles, who wrestles the queen's life back from his grasp. Through these stories, Thanatos becomes an enduring representation of death as a certain force that can nonetheless be delayed momentarily by extraordinary cunning or courage, an idea that continues to inspire literature and art into the modern era.''',
    imageUrl: 'assets/images/Greek/Underworld/thanatos.webp',
    category: 'Underworld',
  ),
  God(
    id: '99',
    name: 'Hypnos',
    mythology: 'Greek',
    title: 'Dewa Tidur',
    titleEn: 'God of Sleep',
    symbol: '😴',
    powers: ['Tidur', 'Mimpi', 'Ketenangan', 'Istirahat', 'Pelupaan'],
    powersEn: ['Sleep', 'Dreams', 'Calm', 'Rest', 'Oblivion'],
    story: '''
Hypnos adalah personifikasi Tidur dalam mitologi Yunani, putra dari Nyx, dewi Malam, dan saudara kembar dari Thanatos, dewa Kematian, sebuah hubungan kekerabatan yang mencerminkan kedekatan simbolis antara tidur dan kematian dalam pemikiran Yunani kuno. Ia tinggal di sebuah gua yang tenang dan gelap di dunia bawah, dekat aliran sungai Lethe yang airnya membawa lupa, sebuah tempat yang menurut Ovid dikelilingi tanaman opium sehingga suasana kantuk senantiasa menyelimuti wilayah tersebut. Sebagai ayah dari para Oneiroi, roh-roh mimpi termasuk Morpheus yang mampu meniru wujud manusia dalam mimpi, Hypnos menempati posisi penting dalam mengatur dunia bawah sadar makhluk yang tertidur.

Hypnos melambangkan ketenangan dan istirahat yang mutlak diperlukan oleh setiap makhluk hidup, membawa kelegaan dari rasa lelah dan penderitaan sehari-hari melalui kekuatan tidurnya yang menenangkan siapa pun, bahkan para dewa sekalipun. Ia digambarkan sebagai sosok lembut dan tanpa kekerasan, sering muncul membawa sepasang sayap di pelipisnya dan sebatang tanduk berisi cairan penyebab kantuk atau setangkai bunga opium, simbol dari kemampuannya membuat siapa pun terlelap seketika. Karena kekuatannya mampu melumpuhkan bahkan makhluk paling perkasa tanpa perlawanan, Hypnos dipandang sebagai salah satu kekuatan paling halus namun tak tertahankan dalam mitologi Yunani, mampu menaklukkan lewat kelembutan dibandingkan kekerasan.

Kisah paling terkenal tentang Hypnos tercatat dalam Buku XIV Iliad karya Homer, ketika Hera membujuknya untuk menidurkan Zeus agar Poseidon dapat leluasa membantu pasukan Yunani dalam Perang Troya tanpa sepengetahuan sang raja para dewa; Hypnos awalnya enggan karena pernah nyaris dihukum berat oleh Zeus akibat trik serupa yang ia lakukan terhadap Heracles, namun akhirnya setuju setelah Hera menjanjikan salah satu dari para Charites, Pasithea, sebagai istrinya. Setelah berhasil menidurkan Zeus, Hypnos segera melarikan diri ke pangkuan ibunya, Nyx, mengetahui bahwa bahkan raja para dewa pun tidak berani membuat marah sang dewi malam. Warisan Hypnos bertahan hingga kini melalui berbagai istilah medis modern seperti hipnosis dan hypnotic, yang secara langsung berasal dari namanya, menegaskan pengaruh abadi sang dewa tidur dalam bahasa dan pemahaman manusia tentang dunia bawah sadar.''',
    storyEn: '''
Hypnos is the personification of Sleep in Greek mythology, a son of Nyx, goddess of Night, and the twin brother of Thanatos, god of Death, a kinship that reflects the symbolic closeness between sleep and death in ancient Greek thought. He dwells in a quiet, dark cave in the underworld, near the flow of the river Lethe, whose waters bring forgetfulness, a place that Ovid describes as surrounded by poppies, so that an atmosphere of drowsiness perpetually blankets the region. As the father of the Oneiroi, the spirits of dreams, including Morpheus, who could take on human form within dreams, Hypnos holds an important position governing the subconscious realm of sleeping beings.

Hypnos represents the calm and rest that every living being absolutely requires, bringing relief from daily exhaustion and suffering through the soothing power of his sleep, which can overcome anyone, even the gods themselves. He is portrayed as a gentle, nonviolent figure, often shown with a pair of wings at his temples and carrying a horn filled with a sleep-inducing liquid or a sprig of poppy flowers, symbols of his ability to make anyone fall asleep instantly. Because his power can subdue even the mightiest beings without resistance, Hypnos is regarded as one of the most subtle yet irresistible forces in Greek mythology, able to conquer through gentleness rather than violence.

The most famous story involving Hypnos appears in Book XIV of Homer's Iliad, when Hera persuades him to lull Zeus to sleep so that Poseidon could freely assist the Greek forces in the Trojan War without the king of the gods' knowledge; Hypnos was initially reluctant, having nearly faced severe punishment from Zeus for a similar trick he once played involving Heracles, but he finally agreed after Hera promised him one of the Charites, Pasithea, as his wife. After successfully putting Zeus to sleep, Hypnos immediately fled to the embrace of his mother, Nyx, knowing that even the king of the gods dared not provoke the goddess of night's anger. Hypnos's legacy survives today through modern medical terms such as hypnosis and hypnotic, which derive directly from his name, affirming the enduring influence of the god of sleep on human language and understanding of the subconscious mind.''',
    imageUrl: 'assets/images/Greek/Underworld/hypnos.webp',
    category: 'Underworld',
  ),
  God(
    id: '100',
    name: 'Charon',
    mythology: 'Greek',
    title: 'Pengantar Arwah Sungai Styx',
    titleEn: 'Ferryman of the River Styx',
    symbol: '⛴️',
    powers: ['Penyeberangan', 'Dunia Bawah', 'Pemandu Arwah', 'Perbatasan', 'Tugas Abadi'],
    powersEn: ['Ferrying', 'Underworld', 'Soul-Guiding', 'Boundary', 'Eternal Duty'],
    story: '''
Charon adalah sosok pengantar arwah yang telah ada sejak generasi tertua para dewa, umumnya digambarkan sebagai putra Erebus (kegelapan purba) dan Nyx (malam), dua dewa primordial yang lahir dari Chaos. Sebagai keturunan langsung kekuatan-kekuatan purba alam semesta, Charon menempati posisi unik di ambang antara dunia manusia dan dunia arwah, tidak sepenuhnya menjadi dewa Olympian namun tetap memegang peran yang sangat penting dalam tatanan kosmis Yunani kuno. Ia telah menjalankan tugasnya sebagai pengantar arwah sejak dunia bawah tanah, yang diperintah oleh Hades, mulai menampung jiwa-jiwa orang mati.

Tugas utama Charon adalah mengangkut arwah orang yang telah meninggal menyeberangi Sungai Styx atau Acheron menuju alam Hades, menggunakan sebuah perahu tua yang didayungnya sendiri. Ia hanya mengizinkan arwah menyeberang apabila jenazah mereka telah dikuburkan dengan layak dan sebuah koin, biasanya obolus, diletakkan di mulut atau di atas mata jenazah sebagai bayaran ongkos penyeberangan; mereka yang tidak memiliki koin atau tidak dikuburkan dengan benar dipaksa mengembara tanpa tujuan di tepi sungai selama seratus tahun. Sosoknya sering digambarkan sebagai lelaki tua yang muram, berjubah compang-camping, dengan wajah keras dan mata menyala, melambangkan sifat tugasnya yang abadi, tanpa belas kasihan, namun adil bagi siapa pun tanpa memandang status.

Salah satu kisah paling terkenal mengenai Charon adalah keterlibatannya dalam labor kedua belas Heracles, ketika sang pahlawan turun ke dunia bawah untuk menangkap Cerberus; Charon mengizinkan Heracles menyeberang meski ia masih hidup, dan sebagai hukuman atas pelanggaran itu Hades merantainya selama satu tahun penuh. Charon juga muncul dalam kisah Orpheus, yang memikatnya dengan musik kecapinya sehingga diizinkan menyeberang untuk mencari istrinya, Eurydice, serta dalam mitos Psyche yang harus membawa dua keping koin agar dapat menyeberang pulang-pergi. Melalui karya-karya sastra seperti Aeneid karya Virgil dan kemudian Divine Comedy karya Dante, citra Charon sebagai pengantar arwah yang tak kenal ampun terus diwariskan dan menjadi salah satu simbol kematian yang paling abadi dalam budaya Barat.''',
    storyEn: '''
Charon is one of the most ancient figures in Greek mythology, traditionally described as the son of Erebus, the primordial embodiment of darkness, and Nyx, the goddess of night, both born directly from Chaos at the dawn of creation. As a descendant of these primeval cosmic forces, Charon occupies a liminal position between the world of the living and the realm of the dead, never counted among the Olympian gods yet indispensable to the cosmic order the Greeks envisioned. He has carried out his duty since the underworld, ruled by Hades, first began receiving the souls of the deceased.

Charon's principal task is to ferry the souls of the dead across the river Styx or Acheron into the realm of Hades, rowing an old boat that he alone commands. He permits passage only to those whose bodies have received proper burial rites and whose mouths or eyes have been placed with a coin, usually an obolus, as payment for the crossing; those lacking this fare or proper burial are condemned to wander the near shore aimlessly for a hundred years. He is typically portrayed as a grim, elderly boatman in tattered robes, with a stern face and burning eyes, embodying the eternal, merciless, yet impartial nature of his duty, one that spares no soul regardless of rank in life.

One of the most celebrated episodes involving Charon occurs during Heracles' twelfth labor, when the hero descended to the underworld to capture Cerberus; Charon ferried him across despite his being alive, and for this transgression Hades bound him in chains for a full year. Charon also appears in the myth of Orpheus, who charmed him with the music of his lyre and was allowed to cross in search of his wife Eurydice, and in the tale of Psyche, who carried two coins so that she could pay for both the journey there and back. Through later literary works such as Virgil's Aeneid and Dante's Divine Comedy, the image of Charon as the unforgiving ferryman of souls has endured, making him one of the most lasting symbols of death and its passage in Western culture.''',
    imageUrl: 'assets/images/Greek/Underworld/charon.webp',
    category: 'Underworld',
  ),
  God(
    id: '101',
    name: 'Cerberus',
    mythology: 'Greek',
    title: 'Anjing Penjaga Dunia Bawah',
    titleEn: 'Guard Dog of the Underworld',
    symbol: '🐕',
    powers: ['Penjagaan', 'Tiga Kepala', 'Ketakutan', 'Kesetiaan', 'Kekuatan'],
    powersEn: ['Guardianship', 'Three Heads', 'Terror', 'Loyalty', 'Strength'],
    story: '''
Cerberus lahir dari pasangan dua monster purba, Typhon dan Echidna, menjadikannya saudara dari sejumlah makhluk buas terkenal lain dalam mitologi Yunani seperti Hydra dari Lerna, Chimera, dan Sphinx dari Thebes. Sebagai keturunan kekuatan-kekuatan chthonic yang paling menakutkan, Cerberus ditempatkan oleh para dewa di gerbang dunia bawah, tempat ia mengabdi langsung di bawah perintah Hades, penguasa alam kematian, sejak awal keberadaannya. Kelahirannya yang berasal dari garis monster purba menjelaskan wujudnya yang jauh dari manusiawi maupun hewan biasa.

Cerberus digambarkan sebagai anjing raksasa berkepala tiga dengan ular-ular yang menjulur dari punggung dan ekornya yang berupa seekor ular berbisa, sosok yang dirancang untuk membangkitkan rasa takut sekaligus rasa hormat. Tugasnya adalah menjaga gerbang dunia bawah agar arwah yang telah masuk tidak dapat kembali ke dunia orang hidup, sekaligus mencegah makhluk hidup memasuki wilayah kematian tanpa izin; ia menyambut jiwa yang baru tiba dengan tenang namun akan menyerang siapa pun yang mencoba keluar. Kesetiaannya yang mutlak kepada Hades dan kekuatannya yang luar biasa menjadikannya simbol dari batas yang tidak dapat dilanggar antara kehidupan dan kematian.

Kisah paling terkenal tentang Cerberus adalah labor kedua belas dan terakhir yang dibebankan kepada Heracles, yang diperintahkan untuk membawa Cerberus dari dunia bawah ke dunia atas tanpa menggunakan senjata; dengan izin Hades, Heracles berhasil menaklukkan Cerberus dengan tangan kosong, memperlihatkannya kepada Raja Eurystheus yang ketakutan, lalu mengembalikannya ke tempat asalnya. Orpheus pernah pula meredakan amarah Cerberus dengan alunan musik kecapinya agar dapat melewati gerbang dunia bawah untuk mencari Eurydice, sementara dalam Aeneid karya Virgil, Sibyl dari Cumae membiusnya dengan kue madu agar Aeneas dapat lewat dengan selamat. Hingga kini, Cerberus tetap menjadi salah satu representasi paling ikonik dari penjaga dunia bawah dalam budaya Barat, sering dirujuk sebagai lambang penjagaan yang mustahil ditembus.''',
    storyEn: '''
Cerberus was born to the union of two primordial monsters, Typhon and Echidna, making him sibling to several of the most infamous creatures in Greek mythology, including the Lernaean Hydra, the Chimera, and the Sphinx of Thebes. As offspring of these fearsome chthonic powers, he was placed by the gods at the gate of the underworld, serving directly under Hades, ruler of the realm of the dead, from the earliest stages of his existence. His descent from this lineage of primordial monsters accounts for a form that belongs to neither the world of ordinary animals nor that of men.

Cerberus is depicted as a monstrous three-headed hound with serpents writhing from his back and a tail formed of a venomous snake, an appearance designed to inspire both terror and reverence. His task is to guard the gate of the underworld so that souls who have entered can never return to the world of the living, while also preventing the living from trespassing into the realm of death uninvited; he greets newly arrived souls calmly but attacks anyone attempting to leave. His absolute loyalty to Hades and his tremendous strength make him a lasting symbol of the boundary that cannot be crossed between life and death.

The most famous story involving Cerberus is Heracles' twelfth and final labor, in which he was ordered to bring Cerberus up from the underworld without using any weapon; with Hades' permission, Heracles subdued the hound with his bare hands, displayed him before the terrified King Eurystheus, and then returned him to his post. Orpheus once calmed Cerberus's fury with the music of his lyre in order to pass through the gate of the underworld in search of Eurydice, while in Virgil's Aeneid the Sibyl of Cumae drugs him with a honeyed cake so that Aeneas may pass safely. To this day, Cerberus remains one of the most iconic representations of an impenetrable guardian in Western culture, frequently invoked as a symbol of unbreachable vigilance.''',
    imageUrl: 'assets/images/Greek/Underworld/cerberus.webp',
    category: 'Underworld',
  ),

  God(
    id: '102',
    name: 'Amphitrite',
    mythology: 'Greek',
    title: 'Ratu Lautan',
    titleEn: 'Queen of the Sea',
    symbol: '🐚',
    powers: ['Laut', 'Ombak', 'Kehidupan Laut', 'Ketenangan', 'Kekuasaan'],
    powersEn: ['Sea', 'Waves', 'Sea Life', 'Calm', 'Sovereignty'],
    story: '''
Amphitrite adalah salah satu dari lima puluh Nereid, para putri Nereus, sesepuh laut yang bijaksana, dan istrinya Doris, seorang Oceanid; dalam beberapa versi mitos yang lebih tua ia bahkan disebut sebagai salah satu Oceanid itu sendiri. Sebagai anggota generasi dewa laut yang lebih tua dibandingkan Poseidon, kelahirannya mencerminkan kedalaman dan usia laut itu sendiri sebagai salah satu unsur tertua dalam kosmos Yunani. Kedudukannya kelak berubah drastis ketika Poseidon, penguasa baru lautan setelah pembagian kekuasaan tiga bersaudara anak Cronus, memilihnya sebagai permaisuri.

Sebagai Ratu Lautan, Amphitrite memerintah bersama Poseidon atas seluruh perairan dan makhluk di dalamnya, mengendalikan ombak, arus, serta kehidupan laut dengan wibawa yang menenangkan, berbeda dari sifat suaminya yang cenderung meledak-ledak dan penuh amarah. Ia sering digambarkan duduk di atas kereta yang ditarik oleh makhluk-makhluk laut atau lumba-lumba, dikelilingi oleh para Nereid dan Triton, dengan mahkota yang melambangkan kedaulatannya atas seluruh samudra. Lumba-lumba menjadi hewan yang secara khusus disucikan baginya, mengingat perannya yang menentukan dalam kisah pernikahannya.

Ketika Poseidon pertama kali melamarnya, Amphitrite menolak dan melarikan diri ke pegunungan Atlas untuk bersembunyi dari sang dewa laut; Poseidon kemudian mengirim utusan-utusannya, termasuk seekor lumba-lumba, untuk mencarinya, dan lumba-lumba itulah yang berhasil membujuknya agar kembali dan menerima pinangan Poseidon. Sebagai balas jasa, Poseidon mengangkat lumba-lumba tersebut ke langit sebagai rasi bintang Delphinus. Dari pernikahannya dengan Poseidon, Amphitrite melahirkan Triton, sang utusan laut, serta beberapa putri seperti Rhode dan Benthesikyme, menjadikannya leluhur penting bagi banyak tokoh dan tempat yang berkaitan dengan laut dalam mitologi Yunani.''',
    storyEn: '''
Amphitrite was one of the fifty Nereids, daughters of Nereus, the wise old man of the sea, and his wife Doris, an Oceanid; in some older accounts she is instead named as an Oceanid herself. As a member of a generation of sea deities older than Poseidon, her origin reflects the depth and antiquity of the sea itself as one of the oldest elements in the Greek cosmos. Her standing changed decisively when Poseidon, the new ruler of the seas following the division of power among the three sons of Cronus, chose her as his consort.

As Queen of the Sea, Amphitrite reigns alongside Poseidon over all waters and the creatures within them, governing waves, currents, and marine life with a calming authority that contrasts with her husband's volatile and often stormy temperament. She is commonly depicted seated on a chariot drawn by sea creatures or dolphins, surrounded by Nereids and Tritons, wearing a crown that signifies her sovereignty over the entire ocean. The dolphin holds special sanctity in her honor, owing to the decisive role it played in the story of her marriage.

When Poseidon first proposed to her, Amphitrite refused and fled to the Atlas mountains to hide from the sea god; Poseidon then sent out messengers, including a dolphin, to search for her, and it was this dolphin that succeeded in persuading her to return and accept his proposal. In gratitude, Poseidon placed the dolphin among the stars as the constellation Delphinus. From her marriage to Poseidon, Amphitrite bore Triton, the herald of the sea, along with daughters such as Rhode and Benthesikyme, making her an important ancestral figure for many beings and places associated with the sea in Greek mythology.''',
    imageUrl: 'assets/images/Greek/SeaGods/amphitrite.webp',
    category: 'Sea',
  ),
  God(
    id: '103',
    name: 'Triton',
    mythology: 'Greek',
    title: 'Utusan Lautan',
    titleEn: 'Messenger of the Sea',
    symbol: '🔱',
    powers: ['Laut', 'Terompet Kerang', 'Ombak', 'Pemandu', 'Kekuatan Laut'],
    powersEn: ['Sea', 'Conch Trumpet', 'Waves', 'Guiding', 'Sea Power'],
    story: '''
Triton adalah putra tunggal dari pasangan penguasa laut, Poseidon dan Amphitrite, lahir dan dibesarkan di istana megah keemasan mereka yang terletak jauh di dasar laut. Sebagai putra dari dua dewa laut paling berkuasa, Triton mewarisi kekuasaan atas perairan sekaligus menempati posisi sebagai perantara utama antara istana kerajaan laut dan dunia luar. Ia digambarkan sebagai makhluk berwujud setengah manusia dan setengah ikan, dengan tubuh bagian atas menyerupai manusia berotot dan bagian bawah berupa ekor ikan besar, wujud yang kelak menjadi cetak biru bagi gambaran para triton dan duyung dalam budaya kemudian.

Peran utama Triton adalah sebagai utusan dan juru bicara lautan, tugas yang dijalankannya dengan meniup sangkakala berupa cangkang kerang besar yang suaranya mampu menggemuruh menenangkan atau membangkitkan ombak sesuai kehendak ayahnya, Poseidon. Ketika sangkakala kerangnya dibunyikan, gelombang laut yang mengamuk dapat mereda seketika, atau sebaliknya, laut yang tenang dapat bergolak menuruti perintah yang dibawanya. Cangkang kerang ini menjadi lambang khasnya, mewakili kekuasaannya untuk mengendalikan suasana hati samudra atas nama orang tuanya.

Dalam kisah Argonautica karya Apollonius dari Rhodes, Triton berperan penting membantu Jason dan para Argonaut yang terjebak di Danau Tritonis di Libya, menunjukkan jalan keluar menuju laut lepas serta memberikan segumpal tanah suci kepada Euphemus, yang kelak menurut mitos menjadi cikal bakal berdirinya koloni Kirene. Ia juga sering digambarkan mendampingi arak-arakan Poseidon dan Amphitrite, meniup terompetnya untuk mengumumkan kedatangan mereka di antara para dewa laut lainnya. Nama Triton kemudian diwariskan secara luas dalam budaya sebagai istilah umum untuk para pengiring lautan berwujud setengah manusia setengah ikan yang menemani Poseidon.''',
    storyEn: '''
Triton is the only son of the sea's ruling pair, Poseidon and Amphitrite, born and raised in their magnificent golden palace situated deep on the ocean floor. As the son of the two most powerful sea deities, Triton inherited dominion over the waters while also occupying the role of chief intermediary between the royal undersea court and the world beyond it. He is depicted as a creature half human and half fish, with a muscular human upper body and the great tail of a fish below, a form that would later become the template for depictions of mermen and mermaids in later culture.

Triton's principal role is that of herald and messenger of the sea, a duty he carries out by blowing a great conch shell whose booming call can either calm or rouse the waves at his father Poseidon's command. When his conch trumpet sounds, raging seas can subside in an instant, or conversely, calm waters can be stirred into turmoil in accordance with the message he carries. This conch shell has become his defining emblem, representing his power to govern the ocean's temper on behalf of his parents.

In Apollonius of Rhodes' Argonautica, Triton plays a crucial part in aiding Jason and the Argonauts after they become stranded in Lake Tritonis in Libya, showing them the passage out to the open sea and presenting Euphemus with a clod of sacred earth that mythology credits as the origin of the colony of Cyrene. He is also frequently depicted accompanying the processions of Poseidon and Amphitrite, sounding his trumpet to announce their arrival among the other sea deities. The name Triton has since been widely adopted in culture as a general term for the half-human, half-fish attendants of the sea who accompany Poseidon.''',
    imageUrl: 'assets/images/Greek/SeaGods/triton.webp',
    category: 'Sea',
  ),
  God(
    id: '104',
    name: 'Nereus',
    mythology: 'Greek',
    title: 'Sesepuh Laut yang Bijaksana',
    titleEn: 'The Wise Old Man of the Sea',
    symbol: '🌊',
    powers: ['Laut', 'Kebijaksanaan', 'Ramalan', 'Perubahan Wujud', 'Kejujuran'],
    powersEn: ['Sea', 'Wisdom', 'Prophecy', 'Shape-shifting', 'Truth'],
    story: '''
Nereus adalah putra sulung Pontus, personifikasi laut purba, dan Gaia, sang Bumi, menjadikannya salah satu dewa laut generasi paling awal, jauh lebih tua daripada Poseidon yang kelak mengambil alih kekuasaan atas samudra setelah masa para Titan. Dari pernikahannya dengan Doris, seorang Oceanid, Nereus menjadi ayah dari lima puluh putri yang dikenal sebagai para Nereid, termasuk Amphitrite dan Thetis, ibu dari Achilles. Karena usianya yang sangat tua dan kebijaksanaannya, ia dijuluki sebagai sesepuh laut yang dihormati oleh dewa-dewa lain maupun manusia.

Nereus dikenal sebagai dewa yang jujur, adil, dan bijaksana, sifat-sifat yang jarang dikaitkan dengan dewa laut lain yang cenderung lebih liar dan penuh gejolak seperti Poseidon. Ia memiliki kemampuan meramal masa depan dengan akurat serta kekuatan untuk mengubah wujudnya menjadi berbagai bentuk, mulai dari air, api, hingga binatang buas, sebuah kemampuan yang sering digunakannya untuk menghindari siapa pun yang berusaha memaksanya berbicara. Karena kejujurannya yang tak tergoyahkan, ia dipercaya selalu memberikan ramalan yang benar kepada siapa pun yang berhasil menangkapnya.

Kisah paling terkenal mengenai Nereus adalah keterlibatannya dalam labor kesebelas Heracles, saat sang pahlawan perlu mengetahui lokasi Taman Hesperides; Heracles berhasil menemukan dan menangkap Nereus saat sedang tidur, lalu memegangnya erat-erat meski sang dewa berulang kali berubah wujud menjadi api, air, singa, dan ular untuk melepaskan diri, hingga akhirnya Nereus menyerah dan memberikan petunjuk yang dibutuhkan. Sebagai ayah dari Thetis, Nereus juga secara tidak langsung menjadi kakek dari Achilles, pahlawan terbesar Perang Troya. Sosok Nereus kemudian banyak menginspirasi penggambaran dewa laut bijaksana yang sulit ditangkap dalam berbagai tradisi mitologi di kemudian hari.''',
    storyEn: '''
Nereus is the eldest son of Pontus, the primordial personification of the sea, and Gaia, the Earth, making him one of the earliest generation of sea deities, far older than Poseidon, who would later assume rule over the ocean following the age of the Titans. Through his marriage to Doris, an Oceanid, Nereus fathered fifty daughters known as the Nereids, among them Amphitrite and Thetis, the mother of Achilles. Owing to his great age and wisdom, he earned the title of the venerable elder of the sea, respected by gods and mortals alike.

Nereus is renowned as an honest, just, and wise deity, qualities rarely associated with other sea gods, who tend to be wilder and more volatile, such as Poseidon. He possesses the gift of accurate prophecy as well as the power to transform himself into countless shapes, from water and fire to wild beasts, an ability he frequently uses to evade anyone attempting to force him to speak. Because of his unwavering honesty, he is believed always to deliver a true prophecy to anyone who manages to hold him fast.

The most famous story concerning Nereus involves Heracles' eleventh labor, when the hero needed to learn the location of the Garden of the Hesperides; Heracles found and seized Nereus while he slept, gripping him tightly even as the god shifted through fire, water, a lion, and a serpent to break free, until Nereus finally relented and gave him the guidance he sought. As the father of Thetis, Nereus is also, indirectly, the grandfather of Achilles, the greatest hero of the Trojan War. The figure of Nereus went on to inspire many later depictions of the wise, elusive sea god found across various mythological traditions.''',
    imageUrl: 'assets/images/Greek/SeaGods/nereus.webp',
    category: 'Sea',
  ),

  God(
    id: '105',
    name: 'Heracles',
    mythology: 'Greek',
    title: 'Pahlawan Terkuat',
    titleEn: 'The Greatest Hero',
    symbol: '🦁',
    powers: ['Kekuatan Super', 'Keberanian', 'Ketahanan', 'Pertarungan', 'Ketabahan'],
    powersEn: ['Superhuman Strength', 'Courage', 'Endurance', 'Combat', 'Perseverance'],
    story: '''
Heracles adalah putra Zeus, raja para dewa, dan Alcmene, seorang wanita fana keturunan Perseus, hasil dari tipu daya Zeus yang menyamar sebagai suami Alcmene, Amphitryon, agar dapat bersatu dengannya. Kelahirannya yang setengah dewa membuatnya menjadi sasaran kebencian Hera, istri Zeus, yang cemburu atas perselingkuhan suaminya dan berusaha membinasakan Heracles bahkan sejak ia masih bayi dengan mengirimkan dua ekor ular berbisa ke buaiannya, yang berhasil dicekik oleh Heracles kecil dengan tangan kosongnya. Sebagai keturunan langsung Zeus, Heracles ditakdirkan menjadi manusia terkuat yang pernah hidup, sekaligus pahlawan yang paling dipuja di seluruh dunia Yunani kuno.

Heracles dikenal luas atas kekuatan fisiknya yang luar biasa, keberaniannya yang tanpa tanding, serta daya tahannya menghadapi penderitaan dan cobaan yang bertubi-tubi sepanjang hidupnya. Ia biasa digambarkan mengenakan kulit Singa Nemea yang tidak dapat ditembus senjata apa pun sebagai jubah pelindung tubuhnya, serta membawa gada kayu zaitun besar sebagai senjata utamanya, dua atribut yang menjadi identitasnya yang paling dikenali dalam seni dan sastra Yunani. Ketabahannya dalam menanggung tugas-tugas mustahil menjadikannya lambang universal dari kekuatan yang ditundukkan oleh kerja keras dan ketekunan, bukan sekadar kekuatan mentah semata.

Kisah paling terkenal tentang Heracles adalah Dua Belas Labor yang harus ia jalani sebagai penebusan dosa setelah dalam kegilaan yang dikirimkan Hera ia membunuh istri dan anak-anaknya sendiri; tugas-tugas ini, yang diperintahkan oleh Raja Eurystheus, meliputi membunuh Singa Nemea, memenggal Hydra Lerna berkepala banyak, menangkap Rusa Ceryneia, menaklukkan Babi Hutan Erymanthos, membersihkan kandang Augeas, mengusir Burung Stymphalos, menangkap Banteng Kreta, menjinakkan Kuda Diomedes, merebut ikat pinggang Hippolyta, menggiring ternak Geryon, memetik apel emas Hesperides, dan akhirnya menangkap Cerberus dari dunia bawah. Setelah kematiannya akibat racun tanpa sengaja dari darah Nessus yang dioleskan Deianira, istrinya, pada jubahnya, Heracles diangkat ke Gunung Olympus dan dianugerahi keabadian, menikahi Hebe, dewi masa muda. Warisannya sebagai pahlawan sekaligus dewa yang disembah menjadikannya salah satu figur mitologi paling berpengaruh dalam seluruh sejarah kebudayaan Barat.''',
    storyEn: '''
Heracles is the son of Zeus, king of the gods, and Alcmene, a mortal woman descended from Perseus, conceived when Zeus disguised himself as Alcmene's husband, Amphitryon, in order to lie with her. His half-divine birth made him a target of Hera's hatred, as Zeus's wife, enraged by her husband's infidelity, sought to destroy Heracles even in infancy by sending two venomous serpents into his cradle, both of which the infant strangled with his bare hands. As a direct descendant of Zeus, Heracles was destined to become the strongest man who ever lived, as well as the most widely venerated hero throughout the ancient Greek world.

Heracles is renowned for his extraordinary physical strength, unmatched courage, and endurance in facing the relentless trials and suffering that marked his life. He is typically depicted wearing the impenetrable pelt of the Nemean Lion as a protective cloak and carrying a great olive-wood club as his primary weapon, two attributes that became his most recognizable identifiers in Greek art and literature. His fortitude in enduring seemingly impossible tasks made him a universal symbol of strength tempered by hard labor and perseverance, rather than raw power alone.

The most famous story of Heracles concerns the Twelve Labors he was compelled to perform as atonement after, driven mad by Hera, he killed his own wife and children; these tasks, assigned by King Eurystheus, included slaying the Nemean Lion, destroying the many-headed Lernaean Hydra, capturing the Ceryneian Hind, subduing the Erymanthian Boar, cleaning the Augean stables, driving off the Stymphalian Birds, capturing the Cretan Bull, taming the Mares of Diomedes, seizing the belt of Hippolyta, herding the cattle of Geryon, retrieving the golden apples of the Hesperides, and finally capturing Cerberus from the underworld. After his death from the poisoned blood of Nessus, unwittingly applied to his cloak by his wife Deianira, Heracles was raised to Mount Olympus and granted immortality, marrying Hebe, goddess of youth. His legacy as both hero and worshipped god makes him one of the most influential figures in the entire history of Western culture.''',
    imageUrl: 'assets/images/Greek/Heroes/heracles.webp',
    category: 'Hero',
  ),
  God(
    id: '106',
    name: 'Perseus',
    mythology: 'Greek',
    title: 'Pembunuh Medusa',
    titleEn: 'Slayer of Medusa',
    symbol: '🗡️',
    powers: ['Keberanian', 'Kecerdikan', 'Pertarungan', 'Bantuan Ilahi', 'Kepahlawanan'],
    powersEn: ['Courage', 'Cunning', 'Combat', 'Divine Aid', 'Heroism'],
    story: '''
Perseus adalah putra Zeus dan Danaë, seorang putri dari Argos yang dikurung ayahnya sendiri, Raja Acrisius, di sebuah ruangan bawah tanah berlapis perunggu setelah sebuah ramalan menyatakan bahwa cucunya kelak akan membunuhnya. Zeus, yang terpikat oleh Danaë, mendatanginya dalam wujud hujan emas yang menembus ruangan tersebut, dan dari pertemuan itu lahirlah Perseus. Karena takut akan ramalan tersebut, Acrisius kemudian membuang Danaë dan bayinya ke laut dalam sebuah peti kayu, yang akhirnya terdampar di pulau Seriphos dan diselamatkan oleh seorang nelayan bernama Diktys.

Perseus tumbuh menjadi pahlawan yang dikenal atas keberanian dan kecerdikannya, terutama dalam misinya membunuh Medusa, satu-satunya Gorgon yang fana namun tatapannya mampu mengubah siapa pun menjadi batu. Untuk menyelesaikan tugas berbahaya ini, ia menerima bantuan ilahi berupa sepasang sandal bersayap dari Hermes, perisai mengilap seperti cermin dari Athena, topi tembus pandang milik Hades, serta sebuah kantung ajaib dan pedang sabit dari para nimfa, seluruh perlengkapan ini menjadikannya simbol pahlawan yang mengandalkan bantuan para dewa selain kecerdikannya sendiri. Perisai Athena menjadi kunci keberhasilannya, karena melalui pantulannya Perseus dapat melihat Medusa tanpa harus menatapnya secara langsung.

Setelah berhasil memenggal kepala Medusa saat sang Gorgon tertidur, Perseus dalam perjalanan pulang menyelamatkan Andromeda, seorang putri Ethiopia yang dirantai di tepi laut sebagai persembahan bagi monster laut Cetus, dan kemudian menikahinya. Ia juga menggunakan kepala Medusa yang masih memiliki kekuatan membatukan untuk mengalahkan Polydectes, raja Seriphos yang berusaha memaksa ibunya menikah dengannya, dengan mengubahnya beserta para pengikutnya menjadi batu. Perseus kemudian secara tidak sengaja memenuhi ramalan lama dengan membunuh kakeknya, Acrisius, saat lempar cakram meleset dalam sebuah kompetisi, dan ia kelak dikenal sebagai pendiri kota Mycenae serta leluhur dari dinasti yang melahirkan Heracles.''',
    storyEn: '''
Perseus is the son of Zeus and Danaë, a princess of Argos who was imprisoned by her own father, King Acrisius, in an underground chamber of bronze after an oracle warned that her son would one day kill him. Zeus, captivated by Danaë, came to her in the form of a golden shower that penetrated the chamber, and from their union Perseus was born. Fearing the prophecy, Acrisius then cast Danaë and her infant son adrift at sea in a wooden chest, which eventually washed ashore on the island of Seriphos, where they were rescued by a fisherman named Dictys.

Perseus grew into a hero renowned for his courage and cunning, most notably in his mission to slay Medusa, the sole mortal Gorgon whose gaze could turn any living creature to stone. To accomplish this perilous task, he received divine assistance in the form of winged sandals from Hermes, a mirror-bright polished shield from Athena, the cap of invisibility belonging to Hades, and a magical pouch along with a curved sword from the nymphs, all of which established him as a hero who relied on divine favor as much as his own ingenuity. Athena's shield proved decisive, allowing Perseus to view Medusa's reflection and avoid meeting her petrifying gaze directly.

After beheading Medusa as she slept, Perseus rescued Andromeda on his journey home, an Ethiopian princess chained to a seaside rock as an offering to the sea monster Cetus, and subsequently married her. He also used Medusa's severed head, which retained its petrifying power, to defeat Polydectes, the king of Seriphos who had tried to force his mother into marriage, turning him and his followers to stone. Perseus later unwittingly fulfilled the old prophecy by killing his grandfather Acrisius when a discus he threw during a competition went astray, and he would go on to be remembered as the founder of the city of Mycenae and the ancestor of the line that would eventually produce Heracles.''',
    imageUrl: 'assets/images/Greek/Heroes/perseus.webp',
    category: 'Hero',
  ),
  God(
    id: '107',
    name: 'Theseus',
    mythology: 'Greek',
    title: 'Pembunuh Minotaur',
    titleEn: 'Slayer of the Minotaur',
    symbol: '🧵',
    powers: ['Keberanian', 'Kecerdasan', 'Kepemimpinan', 'Pertarungan', 'Kepahlawanan'],
    powersEn: ['Courage', 'Intelligence', 'Leadership', 'Combat', 'Heroism'],
    story: '''
Theseus adalah putra Aegeus, raja Athena, dan Aethra, putri dari Troizen, meski dalam sejumlah versi mitos ia juga dianggap sebagai putra Poseidon karena Aethra dipercaya bersatu dengan dewa laut itu pada malam yang sama ketika ia bersama Aegeus. Sebelum meninggalkan Troizen, Aegeus menyembunyikan sebuah pedang dan sepasang sandal di bawah batu besar, berpesan agar Aethra mengirim putranya ke Athena hanya jika kelak ia cukup kuat mengangkat batu tersebut dan mengambil benda-benda pusaka itu sebagai bukti identitasnya. Setelah dewasa, Theseus berhasil mengangkat batu itu dan memulai perjalanannya menuju Athena untuk menemui ayahnya.

Dalam perjalanan darat menuju Athena, Theseus menunjukkan keberanian dan kecerdasannya dengan mengalahkan serangkaian penjahat dan monster yang meneror jalan, termasuk Procrustes yang memaksa tamunya tidur di ranjang besi dan memotong atau meregangkan tubuh mereka agar sesuai ukurannya, serta Sinis si perusak pohon pinus. Sebagai pemimpin yang berani sekaligus bijaksana, Theseus kelak dikenang bukan hanya sebagai pahlawan petarung, melainkan juga sebagai raja yang menyatukan wilayah-wilayah kecil di Attica menjadi satu negara-kota Athena yang bersatu, sebuah proses yang dikenal sebagai sinoikismos.

Kisah paling terkenal tentang Theseus adalah keberaniannya menjadi salah satu dari empat belas pemuda-pemudi Athena yang dikirim sebagai persembahan kepada Minotaur di Kreta; dengan bantuan seutas benang yang diberikan oleh Ariadne, putri Raja Minos yang jatuh cinta padanya, Theseus berhasil menavigasi Labirin karya Daedalus, membunuh Minotaur, dan menuntun rombongannya keluar dengan selamat. Namun dalam perjalanan pulang ia lupa mengganti layar hitam kapalnya dengan layar putih seperti yang telah disepakati sebagai tanda keselamatan, sehingga Aegeus yang menyaksikan layar hitam dari tebing mengira putranya telah tewas dan menjatuhkan dirinya ke laut yang sejak itu dinamai Laut Aegea untuk mengenangnya.''',
    storyEn: '''
Theseus is the son of Aegeus, king of Athens, and Aethra, a princess of Troezen, though in several versions of the myth he is also considered the son of Poseidon, since Aethra was believed to have lain with the sea god on the same night she was with Aegeus. Before leaving Troezen, Aegeus hid a sword and a pair of sandals beneath a great boulder, instructing that Aethra should send their son to Athens only once he grew strong enough to lift the stone and claim these tokens as proof of his identity. Once he came of age, Theseus successfully lifted the boulder and set out on his journey to Athens to meet his father.

On his overland journey to Athens, Theseus demonstrated his courage and intelligence by defeating a series of bandits and monsters terrorizing the road, including Procrustes, who forced travelers to sleep on an iron bed and mutilated or stretched their bodies to fit it, and Sinis, the pine-bender. As a leader who combined boldness with wisdom, Theseus would later be remembered not merely as a warrior hero but also as the king who unified the scattered communities of Attica into a single city-state of Athens, a process known as synoikismos.

The most famous story of Theseus is his courage in volunteering as one of fourteen Athenian youths sent as tribute to the Minotaur in Crete; with the aid of a ball of thread given to him by Ariadne, daughter of King Minos, who had fallen in love with him, Theseus successfully navigated Daedalus's Labyrinth, slew the Minotaur, and led his companions safely back out. On the voyage home, however, he forgot to replace his ship's black sails with white ones as previously agreed to signal his survival, so that Aegeus, watching from a cliff and seeing the black sails, believed his son had perished and threw himself into the sea, which has since been named the Aegean Sea in his memory.''',
    imageUrl: 'assets/images/Greek/Heroes/theseus.webp',
    category: 'Hero',
  ),
  God(
    id: '108',
    name: 'Achilles',
    mythology: 'Greek',
    title: 'Pahlawan Perang Troya',
    titleEn: 'Hero of the Trojan War',
    symbol: '🛡️',
    powers: ['Pertarungan Tak Terkalahkan', 'Kecepatan', 'Keberanian', 'Kehormatan', 'Kekebalan'],
    powersEn: ['Invincible Combat', 'Speed', 'Courage', 'Honor', 'Near-Invulnerability'],
    story: '''
Achilles adalah putra Peleus, raja fana dari Phthia, dan Thetis, seorang Nereid yang begitu dihormati sehingga Zeus dan Poseidon sendiri pernah bersaing memperebutkan cintanya, sebelum sebuah ramalan menyatakan bahwa putra Thetis kelak akan menjadi lebih hebat dari ayahnya sehingga kedua dewa itu mengurungkan niat dan menikahkannya dengan Peleus, seorang manusia. Berusaha melindungi putranya dari kematian, Thetis mencelupkan Achilles bayi ke dalam Sungai Styx sambil memegangi tumitnya, sehingga seluruh tubuhnya menjadi kebal senjata kecuali bagian tumit yang tidak tersentuh air sungai tersebut, kelemahan yang kelak dikenal secara luas sebagai "tumit Achilles". Sebagai keturunan dewi laut dan raja fana, Achilles tumbuh menjadi prajurit dengan darah setengah ilahi yang tiada tandingannya di medan perang.

Achilles dikenal sebagai pemimpin pasukan Myrmidon dan prajurit terhebat dalam Perang Troya, dengan kecepatan, kekuatan, dan keberanian yang jauh melampaui prajurit fana lainnya, sehingga banyak dianggap hampir tak terkalahkan dalam pertempuran satu lawan satu. Ia amat menjunjung tinggi kehormatan dan kemuliaan (kleos), nilai yang menjadi pendorong utama seluruh tindakannya sepanjang kisah Iliad karya Homer, bahkan ketika ia harus memilih antara hidup panjang tanpa nama atau hidup singkat namun dikenang selamanya. Kombinasi antara kekuatan tempurnya yang luar biasa dan kerentanannya yang tunggal di bagian tumit menjadikannya lambang abadi dari kepahlawanan yang tetap rapuh di balik kekuatan yang tampak sempurna.

Kisah paling terkenal tentang Achilles berpusat pada murkanya, tema utama Iliad, yang bermula ketika Agamemnon merampas Briseis, tawanan perangnya, sehingga Achilles menarik diri dari pertempuran dan membiarkan pasukan Yunani terdesak oleh Troya. Ia baru kembali bertempur setelah sahabat karibnya, Patroclus, yang mengenakan baju zirahnya, tewas di tangan Hector, pangeran Troya; dilanda amarah dan duka, Achilles membunuh Hector dalam duel dan menyeret jasadnya mengelilingi tembok Troya sebagai balas dendam, sebelum akhirnya mengembalikan jasad itu kepada Raja Priam atas permohonannya. Achilles sendiri akhirnya tewas oleh anak panah Paris, yang diarahkan oleh Apollo tepat ke tumitnya, kisah yang hingga kini tetap menjadi salah satu narasi kepahlawanan dan tragedi paling berpengaruh dalam sastra dunia.''',
    storyEn: '''
Achilles is the son of Peleus, mortal king of Phthia, and Thetis, a Nereid so revered that both Zeus and Poseidon once vied for her affection, until a prophecy warned that Thetis's son would surpass his father in greatness, prompting both gods to withdraw their pursuit and marry her instead to Peleus, a mortal man. Seeking to protect her infant son from death, Thetis dipped Achilles into the river Styx while holding him by the heel, rendering his entire body invulnerable to weapons except for the heel left untouched by the river's water, a vulnerability that has since become universally known as the Achilles heel. As the offspring of a sea goddess and a mortal king, Achilles grew into a warrior of near-divine blood, unmatched on the field of battle.

Achilles is known as the leader of the Myrmidons and the greatest warrior of the Trojan War, possessing speed, strength, and courage far surpassing any other mortal soldier, so much so that he was widely considered nearly unbeatable in single combat. He held honor and glory, or kleos, in the highest regard, a value that drives his every action throughout Homer's Iliad, even as he must choose between a long, unremembered life and a short one immortalized in memory forever. The combination of his extraordinary combat prowess and his single point of vulnerability at the heel has made him an enduring symbol of heroism that remains fragile beneath an appearance of invincibility.

The most famous story of Achilles centers on his wrath, the central theme of the Iliad, which begins when Agamemnon seizes Briseis, his war captive, causing Achilles to withdraw from battle and allow the Greek forces to be driven back by Troy. He returns to combat only after his closest companion, Patroclus, wearing his armor, is killed by Hector, prince of Troy; consumed by grief and rage, Achilles kills Hector in single combat and drags his body around the walls of Troy in vengeance, before finally returning the body to King Priam at his plea. Achilles himself is ultimately killed by an arrow from Paris, guided by Apollo directly to his heel, a story that remains to this day one of the most influential narratives of heroism and tragedy in world literature.''',
    imageUrl: 'assets/images/Greek/Heroes/archilles.webp',
    category: 'Hero',
  ),
  God(
    id: '109',
    name: 'Odysseus',
    mythology: 'Greek',
    title: 'Sang Pengembara Cerdik',
    titleEn: 'The Cunning Wanderer',
    symbol: '🏹',
    powers: ['Kecerdikan', 'Strategi', 'Ketahanan', 'Kefasihan', 'Kepemimpinan'],
    powersEn: ['Cunning', 'Strategy', 'Endurance', 'Eloquence', 'Leadership'],
    story: '''
Odysseus adalah putra Laertes dan Anticlea, raja Ithaca yang dikenal bukan karena kekuatan fisiknya, melainkan karena kecerdasan dan kelicikannya yang luar biasa, sifat yang menurut tradisi diwarisinya dari kakeknya, Autolycus, seorang penipu ulung yang konon merupakan putra Hermes. Sebagai suami dari Penelope dan ayah dari Telemachus, Odysseus meninggalkan kerajaannya di Ithaca untuk bergabung dalam Perang Troya, awalnya berusaha menghindari kewajiban itu dengan berpura-pura gila, sebuah tipu muslihat yang akhirnya terbongkar dan memaksanya turut berperang. Kedudukannya dalam mitologi Yunani unik karena ia dipuja bukan atas kekuatan tempur semata, melainkan atas kecerdikan strategisnya yang menentukan jalannya sejarah.

Odysseus terkenal atas kecerdikan, kefasihan berbicara, dan kemampuannya merancang strategi yang jauh lebih unggul dibandingkan kekuatan fisik semata, kualitas yang bangsa Yunani sebut sebagai metis. Ia juga dikenal atas daya tahannya menghadapi penderitaan bertahun-tahun serta kesetiaannya yang teguh pada tujuan akhir, yakni kembali ke rumah dan keluarganya di Ithaca, meskipun harus melalui rintangan demi rintangan yang datang silih berganti. Kepemimpinannya atas pasukan dan awak kapalnya, meski sering berujung tragis bagi anak buahnya, tetap menjadikannya arketipe pahlawan yang mengandalkan akal daripada otot.

Sumbangan paling terkenal Odysseus bagi kemenangan Yunani adalah gagasan Kuda Troya, tipu muslihat yang memungkinkan pasukan Yunani menyusup ke dalam kota Troya yang selama sepuluh tahun tak tertembus dan akhirnya menaklukkannya. Perjalanan pulangnya yang berlangsung sepuluh tahun, sebagaimana dikisahkan dalam Odyssey karya Homer, dipenuhi petualangan berbahaya, termasuk menyilaukan mata Cyclops Polyphemus dengan tipu daya nama "Bukan Siapa-siapa", melewati godaan nyanyian para Siren dengan mengikat dirinya di tiang kapal, serta ditahan tujuh tahun oleh nimfa Calypso, sebelum akhirnya tiba kembali di Ithaca dan menyingkirkan para pelamar yang mengganggu istrinya, Penelope, melalui sebuah kontes memanah yang hanya dapat dimenangkan olehnya sendiri.''',
    storyEn: '''
Odysseus is the son of Laertes and Anticlea, king of Ithaca, renowned not for physical might but for his extraordinary intelligence and cunning, a trait tradition attributes to his grandfather Autolycus, a master trickster said to be a son of Hermes. As the husband of Penelope and father of Telemachus, Odysseus left his kingdom of Ithaca to join the Trojan War, initially attempting to avoid the obligation by feigning madness, a ruse that was ultimately uncovered and forced him to take part in the conflict. His place in Greek mythology is unique in that he is celebrated not for martial strength alone but for a strategic cleverness that decisively shaped the course of history.

Odysseus is famed for his cunning, eloquence, and capacity for devising strategies that far outweigh mere physical strength, a quality the Greeks called metis. He is likewise known for his endurance through years of suffering and his unshakeable devotion to a single goal, returning home to his family in Ithaca, despite facing one obstacle after another along the way. His leadership of his soldiers and crew, though it often ends tragically for his men, still establishes him as the archetypal hero who relies on wit rather than brawn.

Odysseus's most celebrated contribution to the Greek victory was the idea of the Trojan Horse, the ruse that allowed Greek soldiers to infiltrate the city of Troy after ten years of failed siege and finally conquer it. His ten-year journey home, recounted in Homer's Odyssey, is filled with perilous adventures, including blinding the Cyclops Polyphemus through the trick of calling himself Nobody, resisting the Sirens' song by having himself bound to the mast, and being held captive for seven years by the nymph Calypso, before finally arriving back in Ithaca and disposing of the suitors harassing his wife Penelope through an archery contest that only he could win.''',
    imageUrl: 'assets/images/Greek/Heroes/odysseus.webp',
    category: 'Hero',
  ),

  God(
    id: '110',
    name: 'Medusa',
    mythology: 'Greek',
    title: 'Gorgon Berambut Ular',
    titleEn: 'The Snake-Haired Gorgon',
    symbol: '🐍',
    powers: ['Tatapan Membatukan', 'Rambut Ular', 'Teror', 'Perlindungan', 'Kutukan'],
    powersEn: ['Petrifying Gaze', 'Serpent Hair', 'Terror', 'Protection', 'Curse'],
    story: '''
Medusa adalah salah satu dari tiga bersaudara Gorgon, bersama Stheno dan Euryale, putri dari dewa laut purba Phorcys dan Ceto; berbeda dari kedua saudarinya yang abadi, Medusa terlahir sebagai satu-satunya Gorgon yang fana. Menurut versi mitos yang lebih tua sebagaimana dicatat Hesiod, Medusa memang terlahir sebagai monster sejak awal, namun versi yang lebih dikenal luas, yang dituliskan Ovid dalam Metamorphoses, menceritakan bahwa ia mulanya adalah seorang perawan cantik yang mengabdi sebagai pendeta di kuil Athena. Ketika Poseidon memperkosanya di dalam kuil suci tersebut, Athena yang murka menghukum Medusa, bukan Poseidon, dengan mengubah rambutnya menjadi ular-ular berbisa dan mengutuk tatapannya agar dapat membatukan siapa pun yang menatap matanya secara langsung.

Sebagai Gorgon, Medusa memiliki wajah yang mengerikan dengan rambut berupa ular-ular hidup yang mendesis, taring tajam, serta kulit bersisik, namun ciri paling menakutkannya adalah tatapan matanya yang mampu mengubah makhluk hidup apa pun menjadi batu seketika. Meski umumnya dipandang sebagai monster yang menakutkan, kepalanya yang terpenggal kelak dijadikan Athena sebagai hiasan pada aegis atau perisainya, sebuah simbol Gorgoneion yang berfungsi sebagai jimat pelindung untuk mengusir kejahatan, menjadikan Medusa figur ganda yang sekaligus melambangkan teror dan perlindungan. Kisahnya juga sering dibaca sebagai representasi seorang korban yang dihukum secara tidak adil atas kejahatan yang menimpanya.

Kisah paling terkenal tentang Medusa adalah kematiannya di tangan Perseus, yang dengan bantuan perisai mengilap dari Athena berhasil memenggal kepalanya tanpa harus menatapnya secara langsung, memanfaatkan pantulan sebagai perisai dari kutukannya. Dari darah yang tumpah saat kepalanya dipenggal, lahirlah Pegasus, kuda bersayap, dan Chrysaor, keduanya merupakan anak dari hubungannya dengan Poseidon yang selama ini tersembunyi di dalam tubuhnya. Kepala Medusa yang tetap memiliki kekuatan membatukan setelah kematiannya kemudian digunakan Perseus dalam beberapa peristiwa penting lain, termasuk mengalahkan Polydectes, sebelum akhirnya diserahkan kepada Athena dan dipasang secara permanen pada perisainya.''',
    storyEn: '''
Medusa is one of three Gorgon sisters, alongside Stheno and Euryale, daughters of the primordial sea deities Phorcys and Ceto; unlike her two immortal sisters, Medusa was born as the sole mortal Gorgon. According to the older account recorded by Hesiod, Medusa was born a monster from the start, but the more widely known version, written by Ovid in the Metamorphoses, tells that she was originally a beautiful maiden serving as a priestess in the temple of Athena. When Poseidon violated her within that sacred temple, an enraged Athena punished Medusa rather than Poseidon, transforming her hair into venomous serpents and cursing her gaze so that it would turn anyone who looked directly into her eyes to stone.

As a Gorgon, Medusa possesses a terrifying visage with hissing living serpents for hair, sharp fangs, and scaled skin, but her most fearsome feature is her gaze, which can instantly turn any living creature to stone. Though generally regarded as a fearsome monster, her severed head was later placed by Athena upon her aegis, or shield, as the Gorgoneion, an apotropaic symbol meant to ward off evil, making Medusa a dual figure representing both terror and protection at once. Her story is also frequently read as a representation of a victim unjustly punished for a crime committed against her.

The most famous story of Medusa is her death at the hands of Perseus, who, aided by Athena's polished shield, beheaded her without ever looking directly at her, using the reflection as a shield against her curse. From the blood spilled as her head was severed sprang Pegasus, the winged horse, and Chrysaor, both offspring of her earlier union with Poseidon that had remained hidden within her body. Medusa's severed head, which retained its petrifying power even after her death, was subsequently used by Perseus in several other significant events, including his defeat of Polydectes, before finally being given to Athena and mounted permanently upon her shield.''',
    imageUrl: 'assets/images/Greek/Monsters/medusa.webp',
    category: 'Monster',
  ),
  God(
    id: '111',
    name: 'Minotaur',
    mythology: 'Greek',
    title: 'Monster Berkepala Banteng',
    titleEn: 'The Bull-Headed Monster',
    symbol: '🐂',
    powers: ['Kekuatan Buas', 'Labirin', 'Teror', 'Kebrutalan', 'Ketahanan'],
    powersEn: ['Savage Strength', 'Labyrinth', 'Terror', 'Brutality', 'Endurance'],
    story: '''
Minotaur, yang bernama asli Asterion, lahir dari perkawinan tidak wajar antara Pasiphaë, istri Raja Minos dari Kreta, dan seekor banteng putih megah yang dikirim oleh Poseidon. Banteng itu semula dimaksudkan Minos untuk dikorbankan kepada Poseidon, namun karena keindahannya Minos justru menyimpannya dan mengorbankan banteng lain sebagai gantinya, tindakan yang membuat Poseidon murka dan menghukum Minos dengan mengutuk Pasiphaë agar jatuh cinta secara tidak wajar kepada banteng tersebut. Dengan bantuan Daedalus, seorang penemu jenius, yang membangunkan sebuah patung sapi kayu berongga agar Pasiphaë dapat bersatu dengan banteng itu, lahirlah Minotaur, makhluk berkepala banteng dan bertubuh manusia.

Karena wujudnya yang mengerikan dan sifatnya yang buas, Minotaur ditempatkan oleh Minos di dalam Labirin, sebuah bangunan raksasa penuh lorong yang membingungkan yang dirancang khusus oleh Daedalus agar siapa pun yang masuk ke dalamnya tidak dapat menemukan jalan keluar. Minotaur memakan daging manusia yang dikorbankan kepadanya secara berkala, menjadikannya lambang kebrutalan murni yang lahir dari pelanggaran terhadap kehendak para dewa dan hukuman yang menimpa keturunan yang tidak bersalah atas dosa orang tuanya. Keberadaannya di dalam Labirin yang nyaris mustahil ditembus menjadikan monster ini simbol dari bahaya yang tersembunyi dan sulit diatasi tanpa bantuan luar.

Setelah putra Minos, Androgeus, tewas di Athena, Minos mewajibkan kota itu mengirimkan tujuh pemuda dan tujuh pemudi setiap beberapa tahun sebagai persembahan bagi Minotaur di dalam Labirin. Theseus, pangeran Athena, secara sukarela bergabung dalam salah satu rombongan persembahan itu dengan tekad membunuh Minotaur, dan berhasil menemukan jalan keluar dari Labirin berkat bantuan seutas benang yang diberikan oleh Ariadne, putri Minos yang jatuh cinta padanya. Kemenangan Theseus atas Minotaur mengakhiri tradisi persembahan manusia yang mengerikan itu dan menjadi salah satu kisah kepahlawanan paling terkenal dalam mitologi Yunani, sering dijadikan simbol kemenangan akal dan keberanian atas kekuatan buas yang tak terkendali.''',
    storyEn: '''
The Minotaur, whose true name was Asterion, was born from the unnatural union between Pasiphaë, wife of King Minos of Crete, and a magnificent white bull sent by Poseidon. The bull had originally been intended by Minos as a sacrifice to Poseidon, but because of its beauty Minos kept it for himself and sacrificed a different bull instead, an act that enraged Poseidon and led him to punish Minos by cursing Pasiphaë with an unnatural desire for the animal. With the help of Daedalus, a brilliant inventor, who built a hollow wooden cow so that Pasiphaë could unite with the bull, the Minotaur was born, a creature with the head of a bull and the body of a man.

Because of his terrifying appearance and savage nature, the Minotaur was confined by Minos within the Labyrinth, a vast structure of bewildering passages specially designed by Daedalus so that anyone who entered could never find their way back out. The Minotaur consumed human flesh offered to him periodically, making him a symbol of pure brutality born from a transgression against the will of the gods and a punishment inflicted upon innocent offspring for the sins of their parents. His confinement within the nearly impenetrable Labyrinth made this monster a symbol of hidden danger, one that could scarcely be overcome without outside help.

After Minos's son Androgeus died in Athens, Minos compelled the city to send seven young men and seven young women every few years as tribute to the Minotaur within the Labyrinth. Theseus, prince of Athens, volunteered to join one such group of tributes with the determination to kill the Minotaur, and succeeded in finding his way out of the Labyrinth thanks to a ball of thread given to him by Ariadne, Minos's daughter, who had fallen in love with him. Theseus's victory over the Minotaur ended that terrible tradition of human sacrifice and became one of the most famous heroic tales in Greek mythology, frequently held up as a symbol of reason and courage triumphing over uncontrolled savage power.''',
    imageUrl: 'assets/images/Greek/Monsters/minotaur.webp',
    category: 'Monster',
  ),
  God(
    id: '112',
    name: 'Chimera',
    mythology: 'Greek',
    title: 'Monster Gabungan Bernafas Api',
    titleEn: 'The Fire-Breathing Hybrid',
    symbol: '🔥',
    powers: ['Nafas Api', 'Tiga Wujud', 'Teror', 'Kekuatan', 'Kehancuran'],
    powersEn: ['Fire Breath', 'Triple Form', 'Terror', 'Strength', 'Destruction'],
    story: '''
Chimera lahir dari pasangan dua monster purba paling ditakuti dalam mitologi Yunani, Typhon dan Echidna, menjadikannya saudara dari sejumlah makhluk buas terkenal lain seperti Cerberus, Hydra dari Lerna, dan Sphinx dari Thebes. Sebagai keturunan kekuatan chthonic yang mewakili kekacauan dan kehancuran, Chimera mewarisi sifat gabungan dari berbagai binatang buas sekaligus, menjadikannya salah satu monster paling anomali dan menakutkan dalam seluruh mitologi Yunani. Ia dikatakan berkeliaran dan meneror wilayah Lycia di Asia Kecil sebelum akhirnya dikalahkan oleh seorang pahlawan.

Chimera digambarkan sebagai makhluk hibrida dengan tubuh utama menyerupai singa, kepala kambing yang menonjol dari punggungnya, dan ekor berupa ular atau naga, serta kemampuan menyemburkan api dari mulutnya yang menjadikannya ancaman mematikan bagi siapa pun yang mendekat. Wujud tiga rupanya sekaligus menjadikannya lambang dari kekacauan alam yang melampaui batas-batas normal makhluk hidup, sebuah monster yang keberadaannya sendiri menantang tatanan dunia yang teratur. Karena kombinasi wujud yang tidak wajar inilah nama "chimera" kemudian diserap ke dalam bahasa modern untuk menyebut sesuatu yang merupakan gabungan tidak wajar dari berbagai unsur berbeda, atau sesuatu yang mustahil.

Kisah paling terkenal tentang Chimera adalah kekalahannya di tangan Bellerophon, seorang pahlawan yang dikirim oleh Raja Iobates dari Lycia dengan harapan diam-diam agar ia tewas dalam misi tersebut. Dengan bantuan Pegasus, kuda bersayap yang berhasil dijinakkannya berkat kekang emas pemberian Athena, Bellerophon menyerang Chimera dari udara, jauh dari jangkauan api dan cakarnya, lalu menancapkan tombak berujung timah ke dalam mulutnya yang menyemburkan api; panas api itu melelehkan timah tersebut hingga menyumbat tenggorokan monster itu dan membunuhnya dari dalam. Kemenangan ini menjadikan Bellerophon salah satu pahlawan besar Yunani, dan kisah Chimera terus diwariskan sebagai contoh klasik monster hibrida yang hanya dapat dikalahkan melalui kecerdikan, bukan kekuatan semata.''',
    storyEn: '''
The Chimera was born to two of the most feared primordial monsters in Greek mythology, Typhon and Echidna, making it sibling to several other renowned monstrous creatures such as Cerberus, the Lernaean Hydra, and the Sphinx of Thebes. As offspring of chthonic powers representing chaos and destruction, the Chimera inherited a combined nature drawn from multiple wild beasts at once, making it one of the most anomalous and terrifying monsters in all of Greek mythology. It is said to have roamed and terrorized the region of Lycia in Asia Minor before finally being defeated by a hero.

The Chimera is depicted as a hybrid creature with the main body of a lion, a goat's head protruding from its back, and a tail formed of a serpent or dragon, along with the ability to breathe fire from its mouth, making it a lethal threat to anyone who came near. Its triple form makes it a symbol of natural chaos exceeding the ordinary boundaries of living creatures, a monster whose very existence challenges the orderly structure of the world. Because of this unnatural combination of forms, the name chimera has since entered modern language to describe any unnatural fusion of disparate elements, or something considered impossible.

The most famous story of the Chimera is its defeat at the hands of Bellerophon, a hero sent by King Iobates of Lycia in the secret hope that he would perish on the mission. With the aid of Pegasus, the winged horse he managed to tame using a golden bridle given by Athena, Bellerophon attacked the Chimera from the air, beyond the reach of its fire and claws, and thrust a lead-tipped spear into its fire-breathing mouth; the heat of the flames melted the lead, choking the monster's throat and killing it from within. This victory established Bellerophon as one of the great heroes of Greece, and the story of the Chimera continues to be passed down as a classic example of a hybrid monster that could only be overcome through cunning rather than strength alone.''',
    imageUrl: 'assets/images/Greek/Monsters/chimera.webp',
    category: 'Monster',
  ),
  God(
    id: '113',
    name: 'Hydra',
    mythology: 'Greek',
    title: 'Ular Berkepala Banyak',
    titleEn: 'The Many-Headed Serpent',
    symbol: '🐉',
    powers: ['Regenerasi', 'Racun', 'Banyak Kepala', 'Ketahanan', 'Teror'],
    powersEn: ['Regeneration', 'Venom', 'Many Heads', 'Endurance', 'Terror'],
    story: '''
Hydra, yang lebih dikenal sebagai Hydra dari Lerna, lahir dari pasangan Typhon dan Echidna, menjadikannya salah satu dari sekian banyak monster mengerikan yang lahir dari kedua orang tua purba tersebut, bersaudara dengan Cerberus, Chimera, dan Sphinx. Ia tinggal di rawa-rawa di dekat kota Lerna, sebuah wilayah yang dalam mitologi juga dipercaya menyimpan salah satu pintu masuk menuju dunia bawah. Kelahirannya dari garis keturunan monster chthonic ini menjadikan Hydra representasi dari kekacauan alam yang harus ditaklukkan oleh kekuatan tatanan yang dibawa para pahlawan.

Hydra digambarkan sebagai ular raksasa berkepala banyak dengan napas dan darah yang sangat beracun, sedemikian mematikan hingga bahkan aromanya saja dapat membunuh. Keunikan paling menakutkan dari Hydra adalah kemampuan regenerasinya, sebab setiap kali salah satu kepalanya dipenggal, dua kepala baru akan tumbuh menggantikannya, sementara satu di antara seluruh kepalanya bersifat abadi dan tidak dapat dibunuh dengan cara biasa. Sifat regeneratifnya ini menjadikan Hydra simbol dari ancaman yang terus berlipat ganda apabila ditangani dengan cara yang salah, sebuah monster yang hanya dapat dikalahkan melalui strategi, bukan sekadar kekuatan.

Kisah paling terkenal tentang Hydra adalah kekalahannya dalam labor kedua Heracles, yang pada awalnya kesulitan karena setiap kepala yang ia penggal justru digantikan oleh dua kepala baru; dengan bantuan keponakannya, Iolaus, yang membakar setiap luka leher dengan obor segera setelah kepalanya dipenggal untuk mencegah pertumbuhan kembali, Heracles akhirnya berhasil menaklukkan Hydra dan mengubur kepalanya yang abadi di bawah batu besar. Setelah kemenangan itu, Heracles mencelupkan ujung anak panahnya ke dalam darah Hydra yang sangat beracun, menjadikan senjatanya mematikan sepanjang sisa hidupnya, senjata yang kelak secara tidak sengaja menjadi penyebab kematiannya sendiri melalui racun yang sama pada darah centaur Nessus.''',
    storyEn: '''
The Hydra, more properly known as the Lernaean Hydra, was born to Typhon and Echidna, making it one of many fearsome monsters produced by that primordial pair, sibling to Cerberus, the Chimera, and the Sphinx. It dwelled in the marshes near the city of Lerna, a region also believed in mythology to contain one of the entrances to the underworld. Its descent from this chthonic monstrous lineage makes the Hydra a representation of natural chaos that must be subdued by the ordering power heroes bring to the world.

The Hydra is depicted as a giant many-headed serpent whose breath and blood are so venomous that even its scent alone could kill. The Hydra's most terrifying trait is its regenerative ability, for whenever one of its heads was severed, two new heads would grow in its place, while one head among them all was immortal and could not be destroyed by ordinary means. This regenerative nature makes the Hydra a symbol of a threat that only multiplies when handled incorrectly, a monster that could be overcome only through strategy rather than strength alone.

The most famous story of the Hydra is its defeat during Heracles' second labor, which initially proved difficult because every head he severed was replaced by two new ones; with the help of his nephew Iolaus, who cauterized each neck wound with a torch immediately after a head was cut off to prevent regrowth, Heracles finally subdued the Hydra and buried its immortal head beneath a massive boulder. After this victory, Heracles dipped the tips of his arrows into the Hydra's highly venomous blood, making his weapons lethal for the rest of his life, a weapon that would later, through the same poison carried in the blood of the centaur Nessus, unwittingly cause his own death.''',
    imageUrl: 'assets/images/Greek/Monsters/hydra.webp',
    category: 'Monster',
  ),
  God(
    id: '114',
    name: 'Sphinx',
    mythology: 'Greek',
    title: 'Penanya Teka-Teki Maut',
    titleEn: 'The Riddler of Death',
    symbol: '🦁',
    powers: ['Teka-teki', 'Sayap', 'Kecerdasan', 'Teror', 'Penjagaan'],
    powersEn: ['Riddles', 'Wings', 'Intelligence', 'Terror', 'Guardianship'],
    story: '''
Sphinx dalam mitologi Yunani, khususnya versi Thebes yang paling terkenal, umumnya dianggap sebagai putri dari Echidna dan Typhon, atau dalam versi lain sebagai keturunan Orthrus, anjing berkepala dua, menjadikannya bagian dari keluarga besar monster chthonic yang sama dengan Hydra, Chimera, dan Cerberus. Ia dikirim oleh Hera atau Ares ke kota Thebes sebagai hukuman atas suatu pelanggaran yang dilakukan raja atau warga kota tersebut, kemudian menetap di sebuah bukit batu di luar gerbang kota untuk mengganggu siapa pun yang hendak melintas.

Sphinx digambarkan sebagai makhluk hibrida dengan kepala dan wajah perempuan, tubuh singa, sayap burung elang, dan terkadang ekor berupa ular, wujud yang menggabungkan kecerdasan manusia dengan kekuatan dan teror binatang buas. Ia dikenal luas karena kebiasaannya menghadang para musafir yang melewati Thebes dan mengajukan sebuah teka-teki yang harus dijawab dengan benar; siapa pun yang gagal menjawab akan dicekik dan dimakannya di tempat. Kombinasi antara kecerdasan dan kekuatan mematikan inilah yang menjadikan Sphinx sebagai simbol penjaga misterius yang menguji kebijaksanaan sebelum mengizinkan seseorang melewati batas wilayahnya.

Teka-teki paling terkenal yang diajukan Sphinx berbunyi, "Makhluk apakah yang berjalan dengan empat kaki di pagi hari, dua kaki di siang hari, dan tiga kaki di sore hari?" sebuah pertanyaan yang telah menewaskan banyak warga Thebes sebelum akhirnya dijawab dengan benar oleh Oedipus, yang menjawab bahwa jawabannya adalah manusia, yang merangkak dengan empat anggota tubuh sebagai bayi, berjalan tegak dengan dua kaki di masa dewasa, dan menggunakan tongkat sebagai kaki ketiga di usia tua. Kekalahan ini membuat Sphinx menjatuhkan dirinya dari bukit batu hingga tewas, sementara Oedipus dianugerahi takhta Thebes dan menikahi sang janda ratu, Jocasta, yang tanpa disadarinya adalah ibu kandungnya sendiri, sebuah rangkaian peristiwa yang kelak menjadi inti tragedi besar Oedipus Rex karya Sophocles.''',
    storyEn: '''
The Sphinx of Greek mythology, particularly the well-known Theban version, is generally regarded as the daughter of Echidna and Typhon, or in other accounts as a descendant of Orthrus, the two-headed hound, placing her within the same great family of chthonic monsters as the Hydra, the Chimera, and Cerberus. She was sent by Hera or Ares to the city of Thebes as punishment for some transgression committed by its king or its people, and settled upon a rocky hill outside the city gates to torment anyone attempting to pass.

The Sphinx is depicted as a hybrid creature with the head and face of a woman, the body of a lion, the wings of an eagle, and sometimes the tail of a serpent, a form combining human intelligence with the strength and terror of a wild beast. She was widely known for waylaying travelers passing through Thebes and posing a riddle that had to be answered correctly; anyone who failed was strangled and devoured on the spot. This combination of intelligence and lethal power made the Sphinx a symbol of the mysterious guardian who tests wisdom before permitting anyone to cross the boundary she watches.

The Sphinx's most famous riddle asks, what creature walks on four legs in the morning, two legs at noon, and three legs in the evening, a question that claimed many lives among the people of Thebes before it was finally answered correctly by Oedipus, who explained that the answer was man, who crawls on four limbs as an infant, walks upright on two legs in adulthood, and uses a cane as a third leg in old age. This defeat caused the Sphinx to hurl herself from the rocky hill to her death, while Oedipus was rewarded with the throne of Thebes and married the widowed queen Jocasta, who, unbeknownst to him, was his own mother, a chain of events that would become the core of Sophocles' great tragedy Oedipus Rex.''',
    imageUrl: 'assets/images/Greek/Monsters/sphinx.webp',
    category: 'Monster',
  ),
  God(
    id: '115',
    name: 'Sirens',
    mythology: 'Greek',
    title: 'Penggoda Pelaut dengan Nyanyian',
    titleEn: 'The Sea Enchantresses',
    symbol: '🎶',
    powers: ['Nyanyian Memikat', 'Godaan', 'Tipu Daya', 'Suara', 'Kematian'],
    powersEn: ['Enchanting Song', 'Seduction', 'Deception', 'Voice', 'Death'],
    story: '''
Para Siren dalam mitologi Yunani umumnya dianggap sebagai putri dari dewa sungai Achelous dan salah satu dari sembilan Muse, meski identitas ibunya berbeda-beda tergantung sumber, ada yang menyebut Melpomene, Terpsichore, atau Calliope. Sebagai keturunan dewa sungai dan Muse, para Siren mewarisi suara yang memesona namun juga sifat berbahaya, dan dalam sejumlah versi mitos mereka dahulu adalah pengiring Persephone yang diubah menjadi makhluk setengah burung sebagai hukuman atau permintaan sendiri setelah gagal mencegah penculikan Persephone oleh Hades.

Dalam seni dan sastra Yunani klasik, para Siren digambarkan sebagai makhluk berwujud setengah wanita setengah burung, tinggal di sebuah pulau berbatu yang dikelilingi tulang belulang para pelaut yang menjadi korbannya. Kekuatan utama mereka terletak pada nyanyian mereka yang begitu memesona sehingga siapa pun yang mendengarnya akan tergoda untuk mendekat, mengarahkan kapalnya ke batu karang, dan akhirnya binasa. Nyanyian para Siren melambangkan godaan yang tampak indah namun membawa kehancuran, sebuah peringatan klasik tentang bahaya yang tersembunyi di balik keindahan yang memikat.

Kisah paling terkenal tentang para Siren muncul dalam Odyssey karya Homer, ketika Odysseus, yang ingin mendengar nyanyian mereka tanpa binasa, memerintahkan awak kapalnya untuk menyumpal telinga mereka dengan lilin lebah sementara dirinya sendiri diikat erat pada tiang kapal, dengan pesan agar tidak dilepaskan apa pun yang terjadi meski ia memohon. Dalam kisah Argonautica, para Argonaut yang melewati pulau para Siren diselamatkan oleh Orpheus, yang memainkan musik kecapinya sendiri dengan begitu indah sehingga mengalahkan dan meredam nyanyian para Siren. Kedua kisah ini menjadikan Siren simbol abadi dari godaan yang harus dilawan dengan kedisiplinan, akal, atau seni yang lebih unggul.''',
    storyEn: '''
The Sirens in Greek mythology are generally regarded as daughters of the river god Achelous and one of the nine Muses, though the identity of their mother varies by source, with some naming Melpomene, Terpsichore, or Calliope. As offspring of a river god and a Muse, the Sirens inherited voices of enchanting beauty alongside a dangerous nature, and in some versions of the myth they were once attendants of Persephone, transformed into half-bird creatures either as punishment or by their own request after failing to prevent her abduction by Hades.

In classical Greek art and literature, the Sirens are depicted as creatures half woman and half bird, dwelling on a rocky island surrounded by the bones of the sailors they had claimed. Their principal power lies in their song, so enchanting that anyone who hears it is compelled to draw near, steering their ship toward the rocks, and ultimately perishing. The Sirens' song symbolizes temptation that appears beautiful yet leads to destruction, a classic warning about danger concealed beneath alluring beauty.

The most famous story of the Sirens appears in Homer's Odyssey, when Odysseus, wishing to hear their song without perishing, orders his crew to plug their ears with beeswax while he himself is bound tightly to the ship's mast, instructing them not to release him no matter how he might beg. In the Argonautica, the Argonauts sailing past the Sirens' island are saved by Orpheus, who plays his own lyre so beautifully that it overpowers and drowns out the Sirens' song. Both stories have made the Sirens an enduring symbol of temptation that must be resisted through discipline, reason, or an even greater art.''',
    imageUrl: 'assets/images/Greek/Monsters/sirens.webp',
    category: 'Monster',
  ),
  God(
    id: '116',
    name: 'Cyclops',
    mythology: 'Greek',
    title: 'Raksasa Bermata Satu',
    titleEn: 'The One-Eyed Giant',
    symbol: '👁️',
    powers: ['Kekuatan Raksasa', 'Pandai Besi', 'Ketahanan', 'Kebrutalan', 'Keahlian'],
    powersEn: ['Giant Strength', 'Smithing', 'Endurance', 'Brutality', 'Craftsmanship'],
    story: '''
Istilah Cyclops sesungguhnya mencakup dua kelompok berbeda dalam mitologi Yunani. Kelompok pertama adalah tiga Cyclops purba, Brontes, Steropes, dan Arges, putra-putra Uranus dan Gaia yang dipenjara oleh ayah mereka sendiri di kedalaman Tartarus sebelum akhirnya dibebaskan oleh Zeus untuk membantunya dalam pertempuran melawan para Titan. Kelompok kedua adalah para Cyclops kemudian, keturunan Poseidon seperti Polyphemus, yang hidup sebagai penggembala liar tanpa hukum maupun tatanan masyarakat di sebuah pulau terpencil, sebagaimana dikisahkan dalam Odyssey karya Homer.

Ciri khas semua Cyclops adalah tubuh raksasa mereka dengan satu mata besar di tengah dahi, sumber nama mereka yang berarti "mata bundar" dalam bahasa Yunani. Ketiga Cyclops purba dikenal sebagai pandai besi ulung dengan keahlian luar biasa dalam menempa senjata-senjata paling kuat di dunia, sementara para Cyclops kemudian seperti Polyphemus lebih dikenal karena kekuatan fisik brutal dan sifat liar mereka yang jauh dari peradaban. Kombinasi antara kekuatan raksasa dan keterampilan menempa inilah yang menjadikan sosok Cyclops beragam, sekaligus simbol kekuatan mentah alam dan keahlian tangan yang luar biasa.

Sebagai balas jasa atas kebebasan yang diberikan Zeus, ketiga Cyclops purba menempa petir dan halilintar untuk Zeus, trisula untuk Poseidon, serta topi tembus pandang untuk Hades, tiga senjata yang menjadi kekuatan menentukan bagi kemenangan para dewa Olympian atas para Titan dalam Titanomachy. Kisah Cyclops yang paling terkenal, bagaimanapun, adalah pertemuan Odysseus dengan Polyphemus, yang memerangkap Odysseus beserta anak buahnya di dalam guanya dan memakan beberapa dari mereka, sebelum akhirnya dibutakan oleh Odysseus menggunakan sebatang kayu yang diruncingkan dan dipanaskan, setelah sebelumnya ditipu dengan nama palsu "Bukan Siapa-siapa" agar Cyclops lain tidak datang membantunya.''',
    storyEn: '''
The term Cyclops actually encompasses two distinct groups in Greek mythology. The first are the three primordial Cyclopes, Brontes, Steropes, and Arges, sons of Uranus and Gaia who were imprisoned by their own father in the depths of Tartarus before eventually being freed by Zeus to aid him in his war against the Titans. The second are the later Cyclopes, descendants of Poseidon such as Polyphemus, who lived as lawless shepherds without any social order on a remote island, as recounted in Homer's Odyssey.

The defining trait of all Cyclopes is their gigantic body with a single large eye set in the middle of the forehead, the source of their name, which means round-eyed in Greek. The three primordial Cyclopes were renowned as master smiths with extraordinary skill in forging the most powerful weapons in the world, while the later Cyclopes, such as Polyphemus, were known instead for their brutal physical strength and wild nature, far removed from civilization. This combination of gigantic strength and forging skill makes the figure of the Cyclops a varied one, symbolizing both the raw power of nature and extraordinary craftsmanship.

In gratitude for the freedom Zeus granted them, the three primordial Cyclopes forged the thunder and lightning bolt for Zeus, the trident for Poseidon, and the cap of invisibility for Hades, three weapons that proved decisive in the Olympian gods' victory over the Titans in the Titanomachy. The most famous Cyclops story, however, is Odysseus's encounter with Polyphemus, who trapped Odysseus and his men inside his cave and devoured several of them, before finally being blinded by Odysseus with a sharpened, heated wooden stake, after having first been deceived by the false name Nobody so that the other Cyclopes would not come to his aid.''',
    imageUrl: 'assets/images/Greek/Monsters/cyclops.webp',
    category: 'Monster',
  ),

  God(
    id: '117',
    name: 'Mount Olympus',
    mythology: 'Greek',
    title: 'Kediaman Para Dewa',
    titleEn: 'Home of the Gods',
    symbol: '🏔️',
    powers: ['Keilahian', 'Tempat Suci', 'Kekuasaan', 'Keabadian', 'Keagungan'],
    powersEn: ['Divinity', 'Sacred Realm', 'Dominion', 'Immortality', 'Majesty'],
    story: '''
Gunung Olympus adalah gunung tertinggi di Yunani, terletak di perbatasan wilayah Thessaly dan Macedonia, dan dalam mitologi Yunani dipandang sebagai kediaman tertinggi para dewa, tempat suci yang menjulang melampaui awan dan memisahkan alam para dewa dari dunia manusia di bawahnya. Kedudukannya sebagai pusat kosmis para dewa terbentuk setelah Zeus dan saudara-saudaranya berhasil menggulingkan para Titan dalam Titanomachy, sebuah perang besar yang menentukan tatanan kekuasaan baru di alam semesta, dan sejak saat itu generasi dewa yang menang dikenal sebagai para dewa Olympian, dinamai sesuai kediaman mereka yang baru.

Gunung Olympus digambarkan sebagai istana megah tempat dua belas dewa Olympian utama, dipimpin oleh Zeus, bertakhta dan mengadakan pertemuan untuk membahas urusan dunia dan nasib manusia. Di sana para dewa menyantap nektar dan ambrosia, makanan dan minuman keabadian yang tidak boleh dikonsumsi manusia fana, sementara istana-istana megah dibangun oleh Hephaestus, dewa pandai besi, untuk masing-masing penghuni Olympus. Sebagai lambang keilahian dan keagungan tertinggi, Gunung Olympus melambangkan tatanan kosmis yang teratur, berbeda dari kekacauan yang mewarnai masa kekuasaan para Titan sebelumnya.

Selain menjadi latar Titanomachy, Gunung Olympus juga menjadi arena Gigantomachy, pertempuran besar antara para dewa Olympian melawan para Giant yang berusaha merebut kembali kekuasaan atas kosmos, sebuah kemenangan lain yang mengukuhkan kedudukan para dewa Olympian sebagai penguasa sah alam semesta. Nama "Olympian" yang melekat pada para dewa utama Yunani hingga kini terus digunakan secara luas dalam budaya, sastra, dan bahasa modern sebagai rujukan bagi sesuatu yang megah, agung, atau melampaui batas kemampuan manusia biasa, sebuah warisan langsung dari kedudukan gunung ini sebagai kediaman para dewa dalam mitologi Yunani kuno.''',
    storyEn: '''
Mount Olympus is the highest mountain in Greece, situated on the border between the regions of Thessaly and Macedonia, and in Greek mythology it is regarded as the supreme dwelling place of the gods, a sacred realm rising above the clouds and separating the world of the gods from the world of mortals below. Its status as the cosmic center of the gods was established after Zeus and his siblings overthrew the Titans in the Titanomachy, a great war that determined the new order of power in the universe, and from that point on the victorious generation of gods became known as the Olympians, named after their new home.

Mount Olympus is described as a magnificent palace where the twelve principal Olympian gods, led by Zeus, hold their thrones and convene to deliberate on the affairs of the world and the fate of humankind. There the gods feast on nectar and ambrosia, the food and drink of immortality forbidden to mortal beings, while grand palaces were constructed by Hephaestus, the god of the forge, for each resident of Olympus. As a symbol of the highest divinity and majesty, Mount Olympus represents an ordered cosmic structure, standing in contrast to the chaos that characterized the earlier reign of the Titans.

In addition to serving as the setting for the Titanomachy, Mount Olympus was also the site of the Gigantomachy, the great battle between the Olympian gods and the Giants, who sought to seize control of the cosmos, another victory that cemented the Olympian gods' position as the rightful rulers of the universe. The name Olympian, attached to the principal gods of Greece, continues to this day to be used widely in culture, literature, and modern language to describe something magnificent, majestic, or beyond ordinary human capability, a direct legacy of this mountain's standing as the dwelling place of the gods in ancient Greek mythology.''',
    imageUrl: 'assets/images/Greek/Cosmology/mount.webp',
    category: 'Cosmology',
  ),
  God(
    id: '118',
    name: 'Underworld',
    mythology: 'Greek',
    title: 'Dunia Bawah Hades',
    titleEn: 'The Underworld of Hades',
    symbol: '💀',
    powers: ['Alam Kematian', 'Penghakiman', 'Jiwa-jiwa', 'Kegelapan', 'Keabadian'],
    powersEn: ['Realm of the Dead', 'Judgment', 'Souls', 'Darkness', 'Eternity'],
    story: '''
Dunia Bawah dalam mitologi Yunani adalah alam kematian yang terletak jauh di bawah permukaan bumi, diperintah oleh Hades, salah satu dari tiga putra Cronus, bersama istrinya Persephone, yang menjadi ratu alam itu setelah diculik oleh Hades dari dunia atas. Sebagai wilayah kosmis yang terpisah dari dunia manusia dan kediaman para dewa di Gunung Olympus, Dunia Bawah menempati posisi penting dalam struktur alam semesta Yunani kuno sebagai tujuan akhir setiap jiwa manusia setelah kematian, tanpa memandang status maupun perbuatan mereka semasa hidup.

Dunia Bawah dilintasi oleh lima sungai yang masing-masing memiliki makna simbolis tersendiri, yaitu Styx, sungai sumpah suci; Acheron, sungai kesedihan; Cocytus, sungai ratapan; Phlegethon, sungai api; dan Lethe, sungai pelupaan. Wilayah ini terbagi menjadi beberapa bagian, termasuk Padang Asphodel bagi jiwa-jiwa biasa, Elysium bagi para pahlawan dan orang-orang saleh, serta Tartarus, jurang paling dalam yang menjadi tempat hukuman bagi jiwa-jiwa jahat dan penjara bagi para Titan yang dikalahkan. Tiga hakim, Minos, Rhadamanthus, dan Aeacus, bertugas menimbang perbuatan setiap jiwa untuk menentukan ke bagian mana mereka akan dikirim, sementara Cerberus menjaga gerbangnya agar tidak ada yang keluar tanpa izin.

Sejumlah pahlawan tercatat berhasil memasuki dan kembali dari Dunia Bawah dalam keadaan hidup, sebuah pencapaian langka yang dikenal sebagai katabasis, termasuk Orpheus yang turun untuk membawa kembali istrinya, Eurydice, Heracles yang menangkap Cerberus sebagai labor terakhirnya, serta Odysseus yang mengunjunginya untuk berkonsultasi dengan arwah peramal Tiresias sebagaimana dikisahkan dalam Odyssey. Mitos penculikan Persephone oleh Hades, yang kemudian memaksanya menghabiskan sepertiga tahun di Dunia Bawah, juga menjadi penjelasan mitologis bagi pergantian musim, menjadikan Dunia Bawah bukan sekadar alam kematian, melainkan juga bagian tak terpisahkan dari siklus kehidupan di dunia atas.''',
    storyEn: '''
The Underworld in Greek mythology is the realm of the dead located deep beneath the surface of the earth, ruled by Hades, one of the three sons of Cronus, together with his wife Persephone, who became queen of that realm after being abducted by Hades from the world above. As a cosmic region separate from the world of mortals and the dwelling of the gods on Mount Olympus, the Underworld occupies a crucial position in the structure of the ancient Greek universe as the final destination of every human soul after death, regardless of their status or deeds in life.

The Underworld is crossed by five rivers, each carrying its own symbolic meaning: the Styx, river of sacred oaths; the Acheron, river of woe; the Cocytus, river of wailing; the Phlegethon, river of fire; and the Lethe, river of forgetfulness. The realm is divided into several regions, including the Asphodel Meadows for ordinary souls, Elysium for heroes and the righteous, and Tartarus, the deepest abyss, which serves as a place of punishment for wicked souls and a prison for the defeated Titans. Three judges, Minos, Rhadamanthus, and Aeacus, weigh the deeds of each soul to determine which region they will be sent to, while Cerberus guards the gate to ensure no one leaves without permission.

Several heroes are recorded as having entered and returned from the Underworld while still alive, a rare feat known as a catabasis, including Orpheus, who descended to bring back his wife Eurydice, Heracles, who captured Cerberus as his final labor, and Odysseus, who visited it to consult the prophetic spirit of Tiresias, as recounted in the Odyssey. The myth of Persephone's abduction by Hades, which subsequently compels her to spend a third of each year in the Underworld, also serves as the mythological explanation for the changing of the seasons, making the Underworld not merely a realm of death but an inseparable part of the cycle of life in the world above.''',
    imageUrl: 'assets/images/Greek/Cosmology/underworld.webp',
    category: 'Cosmology',
  ),
  God(
    id: '119',
    name: 'River Styx',
    mythology: 'Greek',
    title: 'Sungai Pembatas Dunia Bawah',
    titleEn: 'The River of the Underworld',
    symbol: '🌊',
    powers: ['Sumpah Suci', 'Perbatasan', 'Kekuatan Gaib', 'Perlindungan', 'Perpisahan'],
    powersEn: ['Sacred Oaths', 'Boundary', 'Mystic Power', 'Protection', 'Passage'],
    story: '''
Sungai Styx adalah salah satu sungai purba dalam mitologi Yunani yang mengalir mengelilingi Dunia Bawah, dipersonifikasikan sebagai seorang dewi, putri sulung dari pasangan Titan Oceanus dan Tethys. Sebagai sungai yang memisahkan dunia orang hidup dari alam kematian yang diperintah Hades, Styx menempati posisi unik dalam geografi kosmis Yunani, bukan sekadar batas fisik, melainkan juga kekuatan spiritual yang mengikat bahkan para dewa sekalipun pada janji-janji mereka.

Menurut Hesiod dalam Theogony, Styx menikah dengan Titan Pallas dan melahirkan empat anak, yaitu Nike (kemenangan), Kratos (kekuatan), Bia (kekerasan), dan Zelus (semangat berkompetisi), yang seluruhnya memihak Zeus dalam Titanomachy sehingga Zeus menganugerahkan kehormatan istimewa kepada Styx sebagai penjamin sumpah paling suci bagi para dewa. Sumpah yang diucapkan atas nama Sungai Styx dianggap mutlak tidak dapat dilanggar; dewa mana pun yang berani mengingkarinya akan dihukum kehilangan kesadaran selama satu tahun penuh dan diasingkan dari Gunung Olympus selama sembilan tahun berikutnya. Kekuatan gaib airnya juga dipercaya mampu memberikan kekebalan luar biasa bagi siapa pun yang tercelup di dalamnya.

Kisah paling terkenal terkait Sungai Styx adalah saat Thetis mencelupkan putranya, Achilles, ke dalam airnya sambil memegangi tumitnya agar tubuhnya kebal terhadap senjata, meninggalkan tumit yang tidak tersentuh air sebagai satu-satunya titik lemahnya, sebuah kisah yang melahirkan ungkapan "tumit Achilles" yang masih digunakan hingga kini. Charon, sang pengantar arwah, secara tradisional membawa jiwa-jiwa orang mati menyeberangi sungai ini menuju Dunia Bawah, menjadikan Styx sebagai gerbang terakhir yang harus dilewati sebelum memasuki alam kematian sepenuhnya. Warisan Sungai Styx sebagai simbol sumpah yang tak dapat diingkari dan batas antara kehidupan dan kematian terus bertahan dalam berbagai karya sastra dan budaya populer hingga saat ini.''',
    storyEn: '''
The river Styx is one of the primordial rivers in Greek mythology that encircles the Underworld, personified as a goddess, the eldest daughter of the Titans Oceanus and Tethys. As the river separating the world of the living from the realm of death ruled by Hades, the Styx occupies a unique place in Greek cosmic geography, functioning not merely as a physical boundary but also as a spiritual force that binds even the gods themselves to their promises.

According to Hesiod's Theogony, Styx married the Titan Pallas and bore four children, Nike, meaning victory, Kratos, meaning strength, Bia, meaning force, and Zelus, meaning rivalry, all of whom sided with Zeus in the Titanomachy, prompting Zeus to grant Styx the special honor of serving as the guarantor of the gods' most sacred oaths. An oath sworn upon the river Styx was considered absolutely unbreakable; any god who dared violate it would be punished with a year of unconsciousness followed by nine years of exile from Mount Olympus. Its waters were also believed to possess a mystic power capable of granting extraordinary invulnerability to anyone submerged in them.

The most famous story associated with the river Styx is when Thetis dipped her son Achilles into its waters while holding him by the heel to render his body invulnerable to weapons, leaving the untouched heel as his single point of weakness, a tale that gave rise to the expression Achilles heel still used today. Charon, the ferryman of souls, traditionally carries the spirits of the dead across this river into the Underworld, making the Styx the final gate that must be crossed before fully entering the realm of death. The legacy of the river Styx as a symbol of an unbreakable oath and the boundary between life and death endures across countless works of literature and popular culture to this day.''',
    imageUrl: 'assets/images/Greek/Cosmology/styx.webp',
    category: 'Cosmology',
  ),

  God(
    id: '172',
    name: 'Hecate',
    mythology: 'Greek',
    title: 'Dewi Sihir & Persimpangan Jalan',
    titleEn: 'Goddess of Magic & Crossroads',
    symbol: '🔮',
    powers: ['Sihir', 'Persimpangan Jalan', 'Dunia Bawah', 'Malam', 'Nekromansi'],
    powersEn: ['Magic', 'Crossroads', 'Underworld', 'Night', 'Necromancy'],
    story: '''
Hecate adalah putri dari dua Titan, Perses dan Asteria, sehingga secara silsilah ia bukan berasal dari generasi Olympian melainkan dari garis keturunan Titan yang lebih tua. Menurut Hesiod dalam Theogony, Zeus sangat menghormati Hecate hingga tetap mengizinkannya mempertahankan kekuasaannya atas langit, bumi, dan laut sekaligus, sebuah keistimewaan langka yang tidak diberikan kepada dewi lain mana pun setelah kemenangan para Olympian atas para Titan. Karena itu Hecate menempati posisi unik dalam mitologi Yunani, dihormati sejak masa Hesiod sebagai pemberi berkah bagi nelayan, pemburu, peternak, dan siapa pun yang memohon pertolongannya, jauh sebelum citranya kelak bergeser menjadi sosok yang lebih gelap dan misterius.

Sebagai dewi sihir, ilmu gaib, dan persimpangan jalan, Hecate dipuja di tempat-tempat perbatasan seperti pertigaan jalan, pintu rumah, dan batas antara dunia yang dikenal dan tidak dikenal, wilayah yang dianggap sarat kekuatan magis dan berbahaya. Ia sering digambarkan dalam wujud tiga tubuh yang saling membelakangi (Hecate triformis), memungkinkannya mengawasi tiga arah sekaligus di setiap persimpangan, dengan obor di tangan untuk menerangi kegelapan dan anjing hitam sebagai pendampingnya yang setia. Kepribadiannya digambarkan misterius dan berkuasa penuh atas hal-hal liminal, menjadikannya pelindung para penyihir dan siapa pun yang berurusan dengan dunia roh, namun juga dihormati sebagai pembawa perlindungan bagi rumah tangga yang meletakkan sesajen di depan pintu untuknya setiap bulan.

Kisah paling terkenal tentang Hecate muncul dalam Himne Homerik untuk Demeter, ketika ia menjadi satu-satunya saksi yang mendengar jeritan Persephone saat diculik Hades ke dunia bawah; Hecate kemudian membantu Demeter mencari putrinya dengan membawa obor menyusuri kegelapan, dan setelah Persephone ditemukan, Hecate menjadi pendamping setianya yang menyertainya bolak-balik antara dunia atas dan dunia bawah setiap pergantian musim. Melalui perannya ini Hecate menjadi penghubung erat antara Demeter, Persephone, dan Hades, sekaligus dikenal luas sebagai pelindung penyihir seperti Medea dan Circe dalam berbagai mitos. Warisannya bertahan hingga kini sebagai salah satu simbol paling ikonik dari sihir, dunia gaib, dan kekuatan feminin misterius dalam budaya populer Barat.''',
    storyEn: '''
Hecate is the daughter of two Titans, Perses and Asteria, making her genealogically part of the older Titan lineage rather than the Olympian generation. According to Hesiod's Theogony, Zeus honored Hecate so greatly that he allowed her to retain her share of power over the sky, the earth, and the sea alike, a rare privilege granted to no other goddess after the Olympians' victory over the Titans. Because of this, Hecate occupies a unique position in Greek mythology, revered since Hesiod's time as a giver of blessings to fishermen, hunters, herdsmen, and anyone who called upon her, long before her image later shifted toward something darker and more mysterious.

As goddess of magic, sorcery, and crossroads, Hecate was worshipped at liminal places such as three-way road junctions, doorways, and the boundary between the known and unknown world, locations believed to be charged with magical and dangerous power. She is often depicted with three bodies facing outward (Hecate triformis), allowing her to watch all three directions of a crossroads at once, carrying torches to light the darkness and accompanied by black dogs as her faithful companions. Her character is portrayed as mysterious and fully sovereign over liminal things, making her the patroness of witches and anyone dealing with the spirit world, while also being honored as a protector of households, which left offerings for her at their doorsteps each month.

The most famous myth involving Hecate appears in the Homeric Hymn to Demeter, where she is the only witness to hear Persephone's cries as Hades drags her into the underworld; Hecate then helps Demeter search for her daughter by carrying torches through the darkness, and once Persephone is found, Hecate becomes her devoted companion, accompanying her back and forth between the upper and lower worlds with each turning season. Through this role Hecate becomes closely linked to Demeter, Persephone, and Hades, and she is also widely known as the patron of sorceresses such as Medea and Circe in various myths. Her legacy endures today as one of the most iconic symbols of magic, the occult, and mysterious feminine power in Western popular culture.''',
    imageUrl: 'assets/images/Greek/Underworld/hecate.webp',
    category: 'Underworld',
  ),
  God(
    id: '173',
    name: 'Erinyes (Furies)',
    mythology: 'Greek',
    title: 'Dewi Pembalasan dan Kutukan Darah',
    titleEn: 'Goddesses of Vengeance and Blood Curses',
    symbol: '🐍',
    powers: ['Pembalasan Dendam', 'Kutukan Darah', 'Keadilan Purba', 'Pengejaran Tanpa Henti', 'Penyiksaan Jiwa'],
    powersEn: ['Vengeance', 'Blood Curses', 'Ancient Justice', 'Relentless Pursuit', 'Torment of the Guilty'],
    story: '''
Erinyes, tiga dewi bernama Alecto, Megaera, dan Tisiphone, lahir dari tetesan darah Uranus yang jatuh ke tubuh Gaia saat putranya, Cronus, mengebiri sang ayah langit dengan sabit, meski beberapa sumber lain, termasuk sebagian tradisi Orphik, menyebut mereka lahir dari Nyx, dewi malam purba. Karena asal-usulnya yang tercipta dari kekerasan primordial ini, para Erinyes tergolong dewi chthonic tertua, hidup jauh di dalam Tartarus atau di celah-celah dunia bawah sejak sebelum tatanan Olympian terbentuk. Ketiganya dianggap lebih tua dan dalam banyak hal lebih ditakuti daripada para Olympian sendiri, karena kekuasaan mereka bersumber langsung dari hukum kosmis purba yang bahkan Zeus pun enggan melanggarnya.

Sebagai dewi pembalasan, para Erinyes bertugas memburu dan menghukum siapa pun yang melanggar tatanan alami dan sumpah suci, terutama pelaku pembunuhan sesama kerabat (kin-murder), pengkhianatan terhadap tamu, dan pelanggaran terhadap orang tua. Mereka digambarkan sebagai sosok mengerikan dengan rambut berupa ular yang berdesis, sayap kelelawar, mata yang mengucurkan darah, dan cambuk perunggu di tangan, penampilan yang mencerminkan kemurkaan tanpa ampun terhadap dosa darah. Kepribadian mereka digambarkan tidak kenal kompromi dan tidak dapat disuap maupun dibujuk, mengejar korban buruannya hingga menjadi gila sebelum akhirnya merenggut nyawanya, menjadikan mereka personifikasi hati nurani yang bersalah sekaligus keadilan purba yang tak terelakkan.

Kisah paling terkenal tentang para Erinyes adalah pengejaran mereka terhadap Orestes, putra Agamemnon, setelah ia membunuh ibunya sendiri, Clytemnestra, untuk membalas kematian ayahnya; kisah ini menjadi inti trilogi Oresteia karya Aeschylus, khususnya dalam babak terakhir berjudul Eumenides. Orestes yang dikejar hingga gila akhirnya diadili di pengadilan Areopagus di Athena, dengan Athena sendiri turun tangan memberikan suara penentu yang membebaskannya, sementara para Erinyes yang murka akhirnya dibujuk untuk menerima peran baru sebagai Eumenides, "Para Dewi yang Baik Hati", dan diberikan tempat pemujaan permanen di bawah kota Athena. Melalui mitos ini para Erinyes menjadi simbol transisi dari hukum balas dendam kesukuan menuju sistem peradilan formal, warisan yang menjadikan mereka salah satu figur paling penting dalam pemahaman Yunani kuno tentang keadilan dan hukum.''',
    storyEn: '''
The Erinyes, three goddesses named Alecto, Megaera, and Tisiphone, were born from the drops of blood that fell upon Gaia when her son Cronus castrated his father, the sky god Uranus, with a sickle, though other sources, including some Orphic traditions, describe them instead as daughters of Nyx, the primordial goddess of night. Because of this origin rooted in primordial violence, the Erinyes rank among the oldest chthonic deities, dwelling deep within Tartarus or the fissures of the underworld since long before the Olympian order was established. All three are considered older, and in many respects more feared, than the Olympians themselves, since their authority derives directly from ancient cosmic law that even Zeus is reluctant to violate.

As goddesses of retribution, the Erinyes hunt down and punish anyone who violates the natural order and sacred oaths, especially those who commit kin-murder, betray guests, or wrong their parents. They are depicted as terrifying figures with hissing serpents for hair, bat-like wings, blood-weeping eyes, and bronze whips in hand, an appearance that reflects their merciless fury toward crimes of blood. Their character is portrayed as utterly uncompromising and immune to bribery or persuasion, pursuing their prey to the brink of madness before finally claiming their life, making them the personification of guilty conscience as much as inescapable primordial justice.

The most famous myth involving the Erinyes is their pursuit of Orestes, son of Agamemnon, after he killed his own mother, Clytemnestra, to avenge his father's murder; this story forms the heart of Aeschylus's Oresteia trilogy, particularly its final part, the Eumenides. Orestes, driven nearly mad by their relentless chase, is ultimately tried at the court of the Areopagus in Athens, where Athena herself casts the deciding vote to acquit him, while the furious Erinyes are persuaded to accept a new role as the Eumenides, the "Kindly Ones," and are granted a permanent shrine beneath the city of Athens. Through this myth the Erinyes come to symbolize the transition from tribal blood-vengeance to formal judicial process, a legacy that makes them one of the most significant figures in the ancient Greek understanding of justice and law.''',
    imageUrl: 'assets/images/Greek/Underworld/furies.webp',
    category: 'Underworld',
  ),
  God(
    id: '174',
    name: 'Morpheus',
    mythology: 'Greek',
    title: 'Dewa Mimpi',
    titleEn: 'God of Dreams',
    symbol: '💤',
    powers: ['Mimpi', 'Penyamaran Wujud', 'Tidur', 'Ilusi', 'Ramalan Malam'],
    powersEn: ['Dreams', 'Shape-Mimicry', 'Sleep', 'Illusion', 'Nocturnal Visions'],
    story: '''
Morpheus adalah putra Hypnos, dewa tidur, sebagaimana dikisahkan oleh penyair Romawi Ovid dalam Metamorphoses, dan merupakan yang paling berkuasa di antara ribuan Oneiroi, saudara-saudaranya yang bertugas membentuk mimpi manusia. Ia tinggal bersama ayahnya di sebuah gua senyap dekat perbatasan negeri suku Cimmeria, tempat yang tak pernah tersentuh cahaya matahari, dikelilingi bunga poppy dan tanaman herbal yang mendatangkan kantuk abadi. Sebagai salah satu putra Hypnos yang paling dipercaya, Morpheus bertugas khusus mengunjungi mimpi para raja dan tokoh penting, sementara saudara-saudaranya, Phobetor dan Phantasos, menangani mimpi berupa hewan dan benda mati.

Kekuatan utama Morpheus adalah kemampuannya menjelma menjadi sosok manusia mana pun di dalam mimpi dengan kesempurnaan luar biasa, meniru wajah, suara, gaya berjalan, bahkan kebiasaan kecil orang yang ia tiru sehingga mimpi yang ia ciptakan terasa sepenuhnya nyata bagi si pemimpi. Namanya sendiri berasal dari kata Yunani "morphe" yang berarti "bentuk" atau "wujud", mencerminkan kekuasaannya yang unik atas rupa dan penampilan dalam alam mimpi. Ia digambarkan sebagai sosok bersayap yang bergerak nyaris tanpa suara, membawa pesan-pesan dari para dewa kepada manusia yang sedang tidur, dengan kepribadian yang tenang, senyap, dan penuh kelicikan halus dalam cara ia menyusup ke pikiran bawah sadar manusia.

Kisah paling terkenal tentang Morpheus muncul dalam Metamorphoses karya Ovid, dalam episode Ceyx dan Alcyone: setelah Ceyx tewas tenggelam dalam badai di laut, dewi Juno memerintahkan Hypnos untuk mengirimkan mimpi yang mengabarkan kematiannya kepada sang istri, Alcyone, dan Hypnos pun mengutus Morpheus untuk melaksanakan tugas itu. Morpheus menjelma sempurna menjadi wujud Ceyx yang basah kuyup dan pucat, muncul dalam mimpi Alcyone untuk mengungkapkan kematiannya sendiri, sebuah adegan yang begitu meyakinkan hingga Alcyone terbangun dalam duka mendalam dan akhirnya melemparkan dirinya ke laut untuk menyusul suaminya, sebelum keduanya diubah para dewa menjadi sepasang burung raja udang (halcyon). Meski hanya muncul dalam sedikit sumber klasik, nama Morpheus kemudian menjadi begitu identik dengan alam mimpi hingga diabadikan dalam istilah "morfin", obat penghilang rasa sakit yang menimbulkan efek tidur dan halusinasi.''',
    storyEn: '''
Morpheus is the son of Hypnos, the god of sleep, as recounted by the Roman poet Ovid in the Metamorphoses, and is the most powerful among the thousand Oneiroi, his brothers who are tasked with shaping human dreams. He dwells with his father in a silent cave near the land of the Cimmerians, a place the sun's rays never reach, surrounded by poppies and herbs that induce eternal drowsiness. As the most trusted of Hypnos's sons, Morpheus is specifically charged with visiting the dreams of kings and other important figures, while his brothers Phobetor and Phantasos handle dreams that take the form of animals and inanimate objects.

Morpheus's principal power is his ability to assume the form of any human being within a dream with extraordinary perfection, mimicking a person's face, voice, gait, and even small mannerisms so precisely that the dream he creates feels entirely real to the dreamer. His name derives from the Greek word "morphe," meaning "form" or "shape," reflecting his unique dominion over appearance and likeness within the dream world. He is depicted as a winged figure who moves almost without a sound, carrying messages from the gods to sleeping mortals, with a character that is calm, quiet, and subtly cunning in the way he slips into the human subconscious.

The most famous myth involving Morpheus appears in Ovid's Metamorphoses, in the episode of Ceyx and Alcyone: after Ceyx drowns in a storm at sea, the goddess Juno orders Hypnos to send a dream informing his wife, Alcyone, of his death, and Hypnos dispatches Morpheus to carry out the task. Morpheus perfectly assumes the drenched, pallid form of Ceyx, appearing in Alcyone's dream to reveal his own death, a scene so convincing that Alcyone awakens in profound grief and ultimately casts herself into the sea to join her husband, after which the gods transform them both into a pair of halcyon birds, or kingfishers. Though he appears in only a handful of classical sources, Morpheus's name later became so closely tied to the realm of dreams that it was immortalized in the term "morphine," a pain-relieving drug known for inducing sleep and vivid hallucinations.''',
    imageUrl: 'assets/images/Greek/Underworld/morpheus.webp',
    category: 'Underworld',
  ),
  God(
    id: '175',
    name: 'Orpheus',
    mythology: 'Greek',
    title: 'Musisi Agung Dunia Bawah',
    titleEn: 'Great Musician of the Underworld',
    symbol: '🎶',
    powers: ['Musik', 'Puisi', 'Pesona Alam', 'Perjalanan ke Dunia Bawah', 'Cinta Abadi'],
    powersEn: ['Music', 'Poetry', 'Enchantment of Nature', 'Underworld Journey', 'Undying Love'],
    story: '''
Orpheus adalah putra Calliope, salah satu dari sembilan Muse yang menguasai puisi epik, dan menurut sebagian besar tradisi ayahnya adalah Oeagrus, seorang raja Thracia, meski beberapa sumber lain menyebutnya sebagai putra Apollo sendiri, yang konon menghadiahkan lira pertamanya kepada Orpheus semasa kecil. Lahir di Thracia, wilayah yang dikenal orang Yunani sebagai tanah asal musik dan pemujaan liar, Orpheus tumbuh menjadi penyair dan musisi paling berbakat yang pernah hidup di antara manusia fana. Ia kelak turut serta dalam pelayaran kapal Argo bersama Jason dan para Argonaut, di mana kemampuannya bernyanyi dan bermain lira terbukti menjadi senjata penting untuk menandingi nyanyian maut para Sirene.

Kekuatan utama Orpheus terletak pada musiknya yang begitu indah hingga mampu menjinakkan binatang buas, membuat pepohonan mencabut akarnya untuk mendekat, menghentikan aliran sungai, bahkan melunakkan hati batu sekalipun. Lira menjadi lambang utamanya, benda yang selalu ia bawa dan yang menjadi sumber kekuatan magisnya, sementara kepribadiannya digambarkan lembut, penuh cinta, namun juga rentan terhadap keputusasaan yang mendalam. Ia dipuja sebagai pelindung para penyair dan musisi, dan ajaran keagamaan yang berkembang atas namanya, dikenal sebagai Orphisme, mengangkat musik dan puisi sebagai jalan menuju pemurnian jiwa serta pemahaman tentang kehidupan setelah kematian.

Kisah paling terkenal tentang Orpheus adalah usahanya menyelamatkan istrinya, Eurydice, yang meninggal akibat gigitan ular berbisa tak lama setelah pernikahan mereka. Dilanda duka, Orpheus turun ke dunia bawah dan memainkan musik yang begitu memilukan hingga melunakkan hati Hades dan Persephone, yang akhirnya mengizinkan Eurydice kembali ke dunia atas dengan satu syarat: Orpheus tidak boleh menoleh ke belakang untuk melihatnya sebelum keduanya benar-benar mencapai permukaan. Namun di ambang cahaya, diliputi keraguan dan kerinduan, Orpheus menoleh sesaat terlalu cepat, dan Eurydice pun tertarik kembali selamanya ke dunia bawah. Orpheus sendiri kemudian tewas dicabik-cabik oleh para wanita Maenad pengikut Dionysus, namun kepalanya yang terus bernyanyi hanyut ke Pulau Lesbos dan menjadi tempat pemujaan oracle, menjadikan kisahnya salah satu lambang cinta, kehilangan, dan kekuatan seni yang paling abadi dalam warisan budaya Barat.''',
    storyEn: '''
Orpheus is the son of Calliope, one of the nine Muses and the patroness of epic poetry, and according to most traditions his father is Oeagrus, a king of Thrace, though other sources name Apollo himself as his father, who is said to have given the young Orpheus his first lyre. Born in Thrace, a region the Greeks regarded as the homeland of music and ecstatic worship, Orpheus grew into the most gifted poet and musician ever to live among mortals. He later joined the crew of the Argo alongside Jason and the Argonauts, where his singing and lyre-playing proved essential in overpowering the deadly song of the Sirens.

Orpheus's principal power lies in music so beautiful that it can tame wild beasts, cause trees to uproot themselves and draw near, halt the flow of rivers, and even soften the hearts of stones. The lyre is his defining symbol, an instrument he carries always and the source of his magical power, while his character is portrayed as gentle and deeply loving, yet also prone to profound despair. He is venerated as the patron of poets and musicians, and a religious movement that grew up around his legend, known as Orphism, elevated music and poetry as a path toward the purification of the soul and understanding of the afterlife.

The most famous myth involving Orpheus is his attempt to save his wife, Eurydice, who died from the bite of a venomous snake shortly after their wedding. Overcome with grief, Orpheus descended into the underworld and played music so sorrowful that it moved Hades and Persephone to pity, and they agreed to let Eurydice return to the world above on one condition: Orpheus must not look back at her until they had both fully reached the surface. Yet at the very threshold of light, overtaken by doubt and longing, Orpheus turned to look a moment too soon, and Eurydice was drawn back into the underworld forever. Orpheus himself later met his death torn apart by the Maenads, female followers of Dionysus, but his severed head, still singing, drifted to the island of Lesbos and became the site of an oracle, cementing his story as one of the most enduring symbols of love, loss, and the power of art in Western cultural heritage.''',
    imageUrl: 'assets/images/Greek/Heroes/orpheus.webp',
    category: 'Hero',
  ),
  God(
    id: '176',
    name: 'Bellerophon',
    mythology: 'Greek',
    title: 'Penjinak Pegasus',
    titleEn: 'Tamer of Pegasus',
    symbol: '🐎',
    powers: ['Menunggang Pegasus', 'Membunuh Chimera', 'Keberanian', 'Kesombongan Fatal', 'Kepahlawanan Fana'],
    powersEn: ['Pegasus Riding', 'Chimera Slaying', 'Heroic Courage', 'Fatal Hubris', 'Mortal Heroism'],
    story: '''
Bellerophon adalah cucu Sisyphus, raja licik yang terkenal dikutuk mendorong batu di dunia bawah selamanya, dan menurut sebagian besar sumber ayahnya adalah Glaucus, raja Corinth, meski beberapa tradisi lain menyebut Poseidon sendiri sebagai ayah kandungnya. Sebagai pangeran Corinth, Bellerophon dibesarkan dengan segala keistimewaan bangsawan, namun hidupnya berubah drastis setelah ia dibuang dari kotanya sendiri akibat sebuah pembunuhan tak disengaja, memaksanya mencari perlindungan di istana Raja Proetus dari Tiryns. Di sanalah nasibnya mulai terjalin dengan makhluk-makhluk luar biasa yang kelak membuatnya dikenang sebagai salah satu pahlawan fana paling gemilang dalam mitologi Yunani.

Kekuatan utama Bellerophon bukan berasal dari kesaktian ilahi, melainkan dari keberaniannya menjinakkan Pegasus, kuda bersayap ajaib yang lahir dari darah Medusa, dengan bantuan kendali emas pemberian Athena yang muncul dalam mimpinya setelah ia bermalam di kuil sang dewi. Dengan Pegasus sebagai tunggangannya, Bellerophon mampu terbang tinggi ke udara, menjadikan kuda bersayap itu sebagai lambang utamanya sekaligus simbol keberanian dan ambisi manusia yang menembus batas dunia fana. Kepribadiannya digambarkan gagah berani dan cerdik dalam menghadapi tugas-tugas mustahil, namun juga menyimpan benih kesombongan yang perlahan tumbuh seiring deretan kemenangannya, sebuah sifat yang kelak menjadi sumber kejatuhannya sendiri.

Kisah paling terkenal tentang Bellerophon adalah kemenangannya atas Chimera, monster berkepala singa, bertubuh kambing, dan berekor ular yang menyemburkan api, setelah Raja Iobates dari Lycia mengirimnya menghadapi makhluk itu dengan harapan diam-diam bahwa Bellerophon akan tewas—sebuah rencana yang berasal dari surat rahasia titipan Raja Proetus yang meminta kematiannya akibat tuduhan palsu istrinya. Bellerophon berhasil membunuh Chimera dengan menombakkan tombak berujung timah ke tenggorokannya, yang meleleh akibat napas apinya sendiri hingga mencekiknya dari dalam. Namun keberhasilan demi keberhasilan itu membuat Bellerophon menjadi sombong dan mencoba terbang menunggangi Pegasus hingga ke Gunung Olympus untuk bergabung dengan para dewa, sebuah tindakan yang membuat Zeus murka dan mengirim seekor lalat kuda untuk menyengat Pegasus, menjatuhkan Bellerophon kembali ke bumi dalam keadaan cacat dan terhina, hidup sisa umurnya sebagai pengembara kesepian yang dijauhi para dewa, kisah yang sejak itu menjadi peringatan abadi tentang bahaya hubris.''',
    storyEn: '''
Bellerophon is the grandson of Sisyphus, the cunning king famously condemned to roll a boulder in the underworld for eternity, and according to most sources his father is Glaucus, king of Corinth, though other traditions name Poseidon himself as his true father. As a prince of Corinth, Bellerophon was raised with all the privileges of nobility, but his life changed drastically after he was exiled from his own city following an accidental killing, forcing him to seek refuge at the court of King Proetus of Tiryns. It was there that his fate became entwined with extraordinary creatures that would later make him one of the most celebrated mortal heroes in Greek mythology.

Bellerophon's central power came not from divine strength but from his courage in taming Pegasus, the magical winged horse born from the blood of Medusa, with the help of a golden bridle given to him by Athena, who appeared to him in a dream after he spent a night sleeping in her temple. With Pegasus as his mount, Bellerophon could soar through the sky, making the winged horse his defining symbol as well as an emblem of human courage and ambition reaching beyond mortal limits. His character is portrayed as bold and resourceful in the face of seemingly impossible tasks, yet also carrying a seed of pride that grew steadily with each of his triumphs, a trait that would ultimately become the cause of his own downfall.

The most famous myth involving Bellerophon is his defeat of the Chimera, a fire-breathing monster with the head of a lion, the body of a goat, and a serpent's tail, after King Iobates of Lycia sent him to face the creature secretly hoping Bellerophon would be killed, a plot set in motion by a sealed letter from King Proetus requesting his death over his wife's false accusation. Bellerophon killed the Chimera by thrusting a lead-tipped spear into its throat, which melted from the monster's own fiery breath and choked it from within. Yet success after success made Bellerophon arrogant, and he attempted to fly Pegasus all the way to Mount Olympus to join the company of the gods, an act of hubris that enraged Zeus, who sent a gadfly to sting Pegasus, throwing Bellerophon back down to earth crippled and disgraced, to live out his remaining years as a lonely wanderer shunned by the gods, a story that has since stood as an enduring warning against the dangers of hubris.''',
    imageUrl: 'assets/images/Greek/Heroes/bellerophon.webp',
    category: 'Hero',
  ),
  God(
    id: '177',
    name: 'Typhon',
    mythology: 'Greek',
    title: 'Monster Terbesar Penantang Zeus',
    titleEn: 'The Greatest Monster, Challenger of Zeus',
    symbol: '🐉',
    powers: ['Kekuatan Dahsyat', 'Api dan Badai', 'Ratusan Kepala Ular', 'Ayah Para Monster', 'Penguasa Kekacauan'],
    powersEn: ['Immense Strength', 'Fire and Storms', 'Hundred Serpent Heads', 'Father of Monsters', 'Lord of Chaos'],
    story: '''
Typhon adalah putra bungsu Gaia, sang bumi, dan Tartarus, wilayah paling gelap di dasar dunia bawah, dilahirkan setelah Gaia murka atas kekalahan anak-anaknya para Titan dalam Titanomachy dan bertekad menciptakan makhluk yang mampu menggulingkan Zeus dari singgasananya. Menurut Hesiod dalam Theogony, Typhon lahir sebagai makhluk raksasa yang begitu besar hingga kepalanya menyentuh bintang-bintang sementara tangannya mampu merentang dari ujung timur hingga ujung barat dunia, menjadikannya monster terbesar dan paling menakutkan yang pernah lahir dari rahim bumi. Kelahirannya menandai ancaman terakhir dan terhebat bagi kekuasaan para Olympian yang baru saja mapan setelah kemenangan mereka atas para Titan.

Typhon digambarkan sebagai makhluk mengerikan dengan seratus kepala naga yang masing-masing mengeluarkan suara berbeda, dari raungan singa hingga desisan ular, tubuh bagian bawah berupa lilitan ular raksasa yang tak terhitung jumlahnya, serta sayap besar yang menutupi langit ketika ia terbang. Dari mulutnya menyembur api dan lahar, sementara auman serta kepakan sayapnya mampu menciptakan badai dahsyat yang mengguncang lautan dan daratan sekaligus, menjadikan api dan badai sebagai lambang kekuatannya yang paling mengerikan. Sifatnya digambarkan sebagai personifikasi murni kekacauan primordial, sebuah kekuatan liar yang menolak tunduk pada tatanan kosmis mana pun, bahkan tatanan yang ditegakkan Zeus sendiri.

Kisah paling terkenal tentang Typhon adalah pertarungannya melawan Zeus demi memperebutkan supremasi alam semesta, sebuah pertempuran dahsyat yang menurut Hesiod sempat membuat para dewa lain melarikan diri ke Mesir karena ketakutan, bahkan Zeus sendiri sempat terluka parah setelah Typhon berhasil mencuri "otot" atau senjatanya dalam sebagian versi mitos. Namun Zeus akhirnya bangkit dan mengalahkan Typhon dengan hujan petir yang tak terhitung jumlahnya, mengejarnya hingga ke Sisilia dan akhirnya menguburnya hidup-hidup di bawah Gunung Etna, yang sejak itu dipercaya orang Yunani kuno sebagai sumber letusan gunung berapi setiap kali Typhon berusaha meronta dari bawah bumi. Bersama pasangannya, Echidna, Typhon menjadi ayah dari hampir semua monster besar dalam mitologi Yunani, termasuk Cerberus, Hydra dari Lerna, Chimera, dan Orthrus, menjadikannya sumber leluhur bagi hampir seluruh makhluk buas yang kelak dihadapi para pahlawan Yunani.''',
    storyEn: '''
Typhon is the youngest son of Gaia, the earth, and Tartarus, the darkest region at the bottom of the underworld, born after Gaia grew furious over the defeat of her children the Titans in the Titanomachy and resolved to create a being powerful enough to overthrow Zeus from his throne. According to Hesiod's Theogony, Typhon was born as a giant so immense that his head brushed the stars while his arms could stretch from the eastern to the western edge of the world, making him the largest and most fearsome monster ever born of the earth. His birth marked the final and greatest threat to the newly established rule of the Olympians following their victory over the Titans.

Typhon is described as a terrifying being with a hundred dragon heads, each producing a different sound, from the roar of a lion to the hiss of a serpent, a lower body made of countless coiling serpents, and vast wings that darkened the sky when he took flight. Fire and molten rock poured from his mouths, while his roars and the beating of his wings could stir devastating storms that shook both sea and land at once, making fire and storm his most terrifying attributes. His nature is portrayed as the purest personification of primordial chaos, a wild force that refused to submit to any cosmic order, even the order Zeus himself had established.

The most famous myth involving Typhon is his battle against Zeus for supremacy over the cosmos, a cataclysmic struggle that, according to Hesiod, sent the other gods fleeing to Egypt in terror, and in some versions of the myth Zeus himself was gravely wounded after Typhon managed to steal his sinews or his thunderbolt weapon. Zeus ultimately rallied and overpowered Typhon with an unrelenting barrage of thunderbolts, chasing him all the way to Sicily and finally burying him alive beneath Mount Etna, which the ancient Greeks believed to be the source of volcanic eruptions whenever Typhon struggled beneath the earth. Together with his mate, Echidna, Typhon fathered nearly all the great monsters of Greek mythology, including Cerberus, the Lernaean Hydra, the Chimera, and Orthrus, making him the ancestral source of nearly every fearsome creature later faced by Greek heroes.''',
    imageUrl: 'assets/images/Greek/Monsters/typhon.webp',
    category: 'Monster',
  ),
  God(
    id: '178',
    name: 'Echidna',
    mythology: 'Greek',
    title: 'Ibu dari Segala Monster',
    titleEn: 'Mother of All Monsters',
    symbol: '🐍',
    powers: ['Wujud Setengah Ular', 'Kesuburan Monster', 'Persembunyian di Gua', 'Naluri Keibuan Buas', 'Garis Keturunan Mengerikan'],
    powersEn: ['Half-Serpent Form', 'Monstrous Fertility', 'Cave Dwelling', 'Fierce Maternal Instinct', 'Fearsome Lineage'],
    story: '''
Echidna adalah makhluk purba yang menurut Hesiod dalam Theogony lahir dari Phorcys dan Ceto, pasangan dewa laut kuno yang juga melahirkan berbagai makhluk buas lainnya, meski sebagian tradisi lain menyebutnya sebagai putri langsung Gaia dan Tartarus, menjadikannya saudari sekaligus pasangan Typhon. Ia digambarkan sebagai sosok abadi yang tidak menua, hidup tersembunyi jauh dari pandangan dewa maupun manusia di sebuah gua di wilayah Arima, tempat ia jarang sekali terlihat oleh siapa pun. Karena perannya sebagai leluhur bagi hampir seluruh monster besar dalam mitologi Yunani, Echidna dikenal luas dengan julukan "Ibu dari Segala Monster", sebuah gelar yang mencerminkan betapa sentralnya posisinya dalam silsilah makhluk-makhluk mengerikan Yunani kuno.

Wujud Echidna sendiri adalah perpaduan dua rupa yang saling bertentangan: bagian atas tubuhnya berupa wanita cantik dengan wajah menawan, sementara bagian bawahnya berupa tubuh ular raksasa yang berbintik-bintik dan bersisik, sebuah kombinasi yang melambangkan tipu daya di balik keindahan yang menyembunyikan bahaya mematikan. Ia dikenal sebagai pemakan daging mentah, tinggal menyendiri di kegelapan gua, dan jarang muncul di hadapan dewa maupun manusia, mencerminkan sifatnya yang liar, tersembunyi, namun penuh naluri keibuan yang kuat terhadap keturunannya yang buas. Meski demikian, Echidna tidak pernah benar-benar menjadi tokoh sentral dalam mitos aksi seperti anak-anaknya, melainkan lebih dikenal sebagai sumber asal-usul mereka.

Bersama Typhon, Echidna melahirkan hampir semua monster paling terkenal dalam mitologi Yunani, termasuk Cerberus si anjing penjaga dunia bawah berkepala tiga, Hydra dari Lerna yang berkepala banyak dan beracun, Chimera yang kelak dikalahkan Bellerophon, Orthrus si anjing berkepala dua, serta dalam sebagian tradisi juga Sphinx dan Singa Nemea yang kelak menjadi lawan Heracles. Menurut Hesiod dalam Theogony, Echidna sendiri bersifat abadi dan tidak pernah menua, dipercaya terus hidup tersembunyi di gua Arima hingga kini, meski sumber lain seperti Bibliotheca karya Pseudo-Apollodorus mencatat tradisi berbeda bahwa ia akhirnya dibunuh saat tertidur oleh Argus Panoptes, raksasa bermata seratus yang melihat segalanya. Warisan Echidna sebagai leluhur monster menjadikannya figur penting dalam memahami asal-usul hampir setiap makhluk buas yang dihadapi tokoh-tokoh besar seperti Heracles, Bellerophon, dan Oedipus dalam mitologi Yunani klasik.''',
    storyEn: '''
Echidna is a primordial being who, according to Hesiod's Theogony, was born to Phorcys and Ceto, an ancient pair of sea deities who also produced various other monstrous offspring, though other traditions name her as a direct daughter of Gaia and Tartarus, making her both sister and mate to Typhon. She is described as an immortal being who never ages, living hidden far from the sight of both gods and mortals in a cave in the region of Arima, where she was rarely seen by anyone. Because of her role as ancestor to nearly every major monster in Greek mythology, Echidna is widely known by the epithet "Mother of All Monsters," a title that reflects just how central her position is within the lineage of ancient Greece's most fearsome creatures.

Echidna's form itself combines two opposing natures: her upper body is that of a beautiful woman with an alluring face, while her lower body is that of a massive, dappled, scaly serpent, a combination that symbolizes deception lurking behind beauty that conceals deadly danger. She is known to feed on raw flesh, dwelling alone in the darkness of her cave and rarely appearing before gods or mortals, reflecting a nature that is wild and hidden, yet driven by a fierce maternal instinct toward her monstrous offspring. Even so, Echidna herself never became a central figure in action-driven myths the way her children did, and is instead remembered primarily as their point of origin.

Together with Typhon, Echidna gave birth to nearly all of Greek mythology's most famous monsters, including Cerberus, the three-headed hound guarding the underworld, the many-headed and venomous Lernaean Hydra, the Chimera later defeated by Bellerophon, the two-headed hound Orthrus, and in some traditions also the Sphinx and the Nemean Lion, later opponents of Heracles. According to Hesiod's Theogony, Echidna herself is immortal and never ages, believed to still live hidden in her cave at Arima to this day; other, later sources such as Pseudo-Apollodorus's Bibliotheca record a different tradition in which she was ultimately slain in her sleep by Argus Panoptes, the hundred-eyed giant who saw all things. Echidna's legacy as the mother of monsters makes her a key figure for understanding the origins of nearly every fearsome creature confronted by great figures such as Heracles, Bellerophon, and Oedipus in classical Greek mythology.''',
    imageUrl: 'assets/images/Greek/Monsters/echidna.webp',
    category: 'Monster',
  ),
  God(
    id: '179',
    name: 'Scylla & Charybdis',
    mythology: 'Greek',
    title: 'Dua Monster Selat Maut',
    titleEn: 'Twin Monsters of the Deadly Strait',
    symbol: '🌀',
    powers: ['Enam Kepala Pemangsa', 'Pusaran Air Raksasa', 'Penjaga Selat Sempit', 'Teror Pelaut', 'Pilihan Mustahil'],
    powersEn: ['Six Devouring Heads', 'Giant Whirlpool', 'Guardians of the Narrow Strait', 'Terror of Sailors', 'Impossible Choice'],
    story: '''
Scylla awalnya adalah seorang nimfa laut yang cantik, namun menurut sebagian besar sumber ia berubah menjadi monster setelah penyihir Circe, yang cemburu karena dewa laut Glaucus jatuh cinta pada Scylla dan bukan padanya, meracuni air tempat Scylla biasa mandi. Charybdis, di sisi lain, adalah putri Poseidon dan Gaia yang dahulu merupakan makhluk rakus yang mencuri ternak dari Heracles atau membantu Poseidon melawan Zeus, sehingga sebagai hukuman Zeus mengubahnya menjadi pusaran air raksasa yang terikat selamanya di dasar laut. Kedua makhluk ini akhirnya menempati sisi berlawanan dari sebuah selat sempit, yang oleh para penulis kuno secara tradisional diidentikkan dengan Selat Messina antara Italia dan Sisilia, menjadikan jalur pelayaran di sana salah satu yang paling ditakuti dalam dunia maritim Yunani kuno.

Scylla digambarkan sebagai monster mengerikan berkepala enam dengan leher panjang menjulur, masing-masing kepala memiliki tiga baris gigi tajam, serta dua belas kaki menyerupai tentakel, bersembunyi dalam gua tinggi di tebing untuk menyambar pelaut yang lewat terlalu dekat. Charybdis, sebaliknya, tidak berwujud makhluk melainkan pusaran air raksasa yang tiga kali sehari menyedot air laut dalam jumlah besar lalu memuntahkannya kembali, mampu menenggelamkan kapal secara utuh beserta seluruh awaknya. Karena posisi keduanya yang berdekatan di selat sempit yang sama, para pelaut yang mencoba menghindari salah satu nyaris pasti terjebak oleh yang lain, menjadikan keduanya lambang abadi dari situasi terjepit antara dua bahaya yang sama-sama mematikan.

Kisah paling terkenal tentang Scylla dan Charybdis muncul dalam Odyssey karya Homer, ketika Odysseus dalam perjalanan pulangnya diperingatkan oleh Circe bahwa lebih baik kehilangan beberapa awak kapal kepada Scylla daripada mengambil risiko kehilangan seluruh kapal ke pusaran Charybdis. Odysseus pun mengarahkan kapalnya lebih dekat ke tebing Scylla, dan meski ia telah bersiaga dengan senjata di tangan, monster berkepala enam itu tetap berhasil menyambar dan melahap enam awaknya sekaligus di depan matanya sendiri, sebuah pengorbanan pahit demi menyelamatkan sisa kapal dan krunya. Kisah ini kemudian melahirkan ungkapan idiomatik "antara Scylla dan Charybdis" yang hingga kini digunakan dalam bahasa Inggris maupun banyak bahasa lain untuk menggambarkan situasi terjepit antara dua pilihan yang sama-sama berisiko, menjadikan kedua monster ini salah satu warisan mitologi Yunani yang paling bertahan dalam bahasa sehari-hari.''',
    storyEn: '''
Scylla was originally a beautiful sea nymph, but according to most sources she was transformed into a monster after the sorceress Circe, jealous that the sea god Glaucus had fallen in love with Scylla instead of her, poisoned the waters where Scylla bathed. Charybdis, on the other hand, was a daughter of Poseidon and Gaia who had once been a voracious creature that either stole cattle from Heracles or sided with Poseidon against Zeus, and as punishment Zeus transformed her into a monstrous whirlpool bound forever to the sea floor. The two creatures ultimately came to occupy opposite sides of a narrow strait, traditionally identified by ancient writers with the Strait of Messina between Italy and Sicily, making the passage one of the most feared sailing routes in the ancient Greek maritime world.

Scylla is depicted as a terrifying six-headed monster with long, snaking necks, each head lined with three rows of sharp teeth, and twelve tentacle-like legs, lurking within a high cave on a cliff face to snatch sailors from ships that passed too close. Charybdis, by contrast, takes no bodily form at all but exists as a colossal whirlpool that three times a day draws in enormous volumes of seawater and then violently expels it again, capable of swallowing an entire ship along with its crew. Because the two dwell so close together within the same narrow strait, sailors attempting to avoid one were almost certain to be caught by the other, making the pair an enduring symbol of being trapped between two equally deadly dangers.

The most famous myth involving Scylla and Charybdis appears in Homer's Odyssey, when Odysseus, on his homeward voyage, is warned by Circe that it is better to lose a few crewmen to Scylla than to risk losing the entire ship to the whirlpool of Charybdis. Odysseus steers his ship closer to Scylla's cliff, and although he stands ready with weapons in hand, the six-headed monster still manages to snatch and devour six of his men before his own eyes, a bitter sacrifice made to save the rest of the ship and its crew. This episode gave rise to the idiom "between Scylla and Charybdis," still used today in English and many other languages to describe being caught between two equally risky choices, making these two monsters one of the most enduring legacies of Greek mythology in everyday language.''',
    imageUrl: 'assets/images/Greek/Monsters/scylla_charybdis.webp',
    category: 'Monster',
  ),
  God(
    id: '180',
    name: 'Thetis',
    mythology: 'Greek',
    title: 'Nimfa Laut Ibu Sang Pahlawan',
    titleEn: 'Sea Nymph, Mother of the Hero',
    symbol: '🌊',
    powers: ['Kekuatan Laut', 'Ramalan Kelahiran Agung', 'Perlindungan Ibu', 'Kedekatan dengan Para Dewa', 'Penempaan Senjata Pahlawan'],
    powersEn: ['Sea Power', 'Prophecy of a Great Son', 'Maternal Protection', 'Closeness to the Gods', 'Forging of Hero\'s Arms'],
    story: '''
Thetis adalah salah satu dari lima puluh Nereid, para nimfa laut putri Nereus dan Doris, dan di antara semua saudarinya ia dikenal sebagai yang paling cantik serta paling dihormati, hingga menarik perhatian dua dewa besar sekaligus, Zeus dan Poseidon, yang sama-sama ingin menjadikannya istri. Namun sebuah ramalan, yang menurut sebagian sumber diucapkan oleh Themis dan menurut sumber lain oleh Prometheus yang dirantai, menyatakan bahwa anak yang dikandung Thetis kelak akan menjadi lebih perkasa daripada ayahnya, sebuah ancaman yang membuat kedua dewa itu ketakutan mengingat nasib Cronus dan Uranus sebelumnya. Untuk menghindari risiko tersebut, para dewa memutuskan menikahkan Thetis dengan seorang manusia fana, Peleus, raja Phthia, sebuah pernikahan yang dirayakan megah di Gunung Pelion dan dihadiri hampir seluruh dewa Olympian.

Sebagai Nereid, Thetis memiliki kekuasaan atas laut dan mampu berubah wujud sesuka hati, kemampuan yang ia gunakan untuk melawan Peleus ketika sang raja berusaha memikatnya menjadi istrinya, sebelum akhirnya menyerah setelah Peleus berhasil menahannya melewati berbagai wujud liar seperti api, air, dan binatang buas. Simbolnya erat dengan gelombang laut dan kedalaman samudra, mencerminkan sifatnya yang tenang di permukaan namun menyimpan kekuatan besar di baliknya, sekaligus kasih sayang keibuan yang begitu mendalam terhadap putranya kelak. Kepribadiannya digambarkan penuh kasih namun juga gigih dan berani, tidak segan mendatangi Olympus sendirian untuk memohon keadilan bagi orang-orang yang ia cintai.

Dari pernikahannya dengan Peleus, Thetis melahirkan Achilles, pahlawan terbesar dalam Perang Troya, dan berusaha membuatnya kebal dengan mencelupkannya ke Sungai Styx sesaat setelah lahir, memegangnya erat di bagian tumit sehingga bagian tubuh itulah satu-satunya yang tetap rentan, asal-usul istilah "tumit Achilles" yang bertahan hingga kini. Dalam Iliad karya Homer, Thetis memainkan peran penting dengan mendatangi Zeus untuk memohon agar pihak Yunani dipermalukan sebagai balasan atas penghinaan terhadap Achilles oleh Agamemnon, dan setelah sahabat Achilles, Patroclus, tewas serta baju zirahnya dirampas, Thetis pergi ke bengkel Hephaestus untuk memesan zirah dan perisai baru yang megah bagi putranya. Perannya sebagai ibu yang tak kenal lelah membela nasib putranya menjadikan Thetis salah satu figur ibu paling berpengaruh dalam epik Yunani, sekaligus penghubung penting antara dunia dewa dan dunia pahlawan fana.''',
    storyEn: '''
Thetis is one of the fifty Nereids, sea nymphs who are daughters of Nereus and Doris, and among all her sisters she is renowned as the most beautiful and most honored, so much so that she drew the attention of two great gods at once, Zeus and Poseidon, both of whom wished to make her their wife. But a prophecy, spoken according to some sources by Themis and according to others by the chained Titan Prometheus, declared that any son born to Thetis would grow greater than his father, a threat that terrified both gods given the fates of Cronus and Uranus before them. To avoid this risk, the gods decided to marry Thetis to a mortal man, Peleus, king of Phthia, a wedding celebrated magnificently on Mount Pelion and attended by nearly every Olympian god.

As a Nereid, Thetis holds power over the sea and can shift her shape at will, an ability she used to resist Peleus when he first tried to win her as his bride, before finally yielding after Peleus managed to hold on to her through a series of wild transformations, including fire, water, and ferocious beasts. Her symbolism is closely tied to sea waves and ocean depths, reflecting a nature that appears calm on the surface yet conceals great power beneath, alongside a maternal devotion that would later run extraordinarily deep toward her son. Her character is portrayed as loving yet fiercely determined and courageous, unafraid to approach Olympus alone to plead for justice on behalf of those she loves.

From her marriage to Peleus, Thetis bore Achilles, the greatest hero of the Trojan War, and attempted to make him invulnerable by dipping him into the River Styx shortly after his birth, holding him firmly by the heel, which remained the one vulnerable part of his body, the origin of the enduring phrase "Achilles' heel." In Homer's Iliad, Thetis plays a pivotal role by approaching Zeus and pleading with him to humiliate the Greek forces in retribution for Agamemnon's insult to Achilles, and after Achilles's close companion Patroclus is killed and his armor stripped from his body, Thetis travels to the forge of Hephaestus to commission magnificent new armor and a shield for her son. Her role as a mother tirelessly championing her son's fate makes Thetis one of the most influential maternal figures in Greek epic, as well as a vital link between the world of the gods and the world of mortal heroes.''',
    imageUrl: 'assets/images/Greek/SeaGods/thetis.webp',
    category: 'Sea',
  ),
  God(
    id: '181',
    name: 'Proteus',
    mythology: 'Greek',
    title: 'Sang Peramal Berwujud Berubah',
    titleEn: 'The Shape-Shifting Prophet',
    symbol: '🦭',
    powers: ['Perubahan Wujud', 'Ramalan Tersembunyi', 'Gembala Makhluk Laut', 'Kebijaksanaan Kuno', 'Kesetiaan pada Poseidon'],
    powersEn: ['Shapeshifting', 'Hidden Prophecy', 'Shepherd of Sea Creatures', 'Ancient Wisdom', 'Loyalty to Poseidon'],
    story: '''
Proteus adalah dewa laut tua yang asal-usulnya tidak sepenuhnya jelas dalam berbagai sumber kuno, namun umumnya digambarkan sebagai salah satu dewa generasi awal lautan, sering disebut dengan julukan "Lelaki Tua Laut", gelar yang juga dibagikan dengan dewa laut lain seperti Nereus dan Phorcys. Ia mengabdi kepada Poseidon sebagai gembala setia yang menjaga kawanan makhluk laut, terutama anjing laut, yang biasa ia gembalakan naik ke daratan atau pulau-pulau terpencil untuk beristirahat di bawah sinar matahari. Karena usianya yang sudah sangat tua dan pengetahuannya yang mendalam tentang lautan, Proteus dipandang sebagai salah satu sosok paling bijaksana di antara para dewa laut, meski ia jarang muncul dalam kisah-kisah utama mitologi Yunani.

Kekuatan paling terkenal dari Proteus adalah kemampuannya berubah wujud menjadi apa pun sesuka hati, mulai dari binatang buas seperti singa dan babi hutan, hingga unsur alam seperti api dan air, bahkan menjadi pohon, sebuah kesaktian yang membuatnya nyaris mustahil ditangkap oleh siapa pun yang mengejarnya. Ia juga memiliki karunia nubuat yang akurat, mampu meramalkan masa depan dengan tepat, namun sifatnya yang pemalas dan enggan direpotkan membuatnya nyaris tak pernah bersedia mengungkapkan ramalannya secara sukarela. Kepribadiannya digambarkan licik namun jujur ketika benar-benar terpojok, sehingga satu-satunya cara memaksanya berbicara adalah dengan menangkap dan menahannya erat-erat melewati seluruh rangkaian wujud yang ia coba gunakan untuk melarikan diri.

Kisah paling terkenal tentang Proteus muncul dalam Odyssey karya Homer, ketika Menelaus, raja Sparta yang terdampar di Pulau Pharos dalam perjalanan pulangnya dari Troya, diberi tahu oleh Eidothea, putri Proteus, bahwa satu-satunya cara pulang adalah dengan memaksa ayahnya mengungkapkan rahasia laut. Menelaus dan anak buahnya bersembunyi di balik kulit anjing laut, menyergap Proteus saat ia sedang menghitung kawanannya di siang hari, lalu menahannya erat-erat sementara sang dewa berubah wujud menjadi singa, ular, macan tutul, babi hutan, air, dan pohon secara berturut-turut, hingga akhirnya menyerah dan kembali ke wujud aslinya. Proteus pun mengungkapkan ritual persembahan yang harus dilakukan Menelaus agar dapat berlayar pulang dengan selamat, sekaligus mengabarkan nasib para pahlawan Yunani lain, termasuk pembunuhan Agamemnon oleh istrinya sendiri, menjadikan kisah ini salah satu contoh paling terkenal tentang bagaimana pengetahuan ilahi harus direbut, bukan sekadar diminta.''',
    storyEn: '''
Proteus is an ancient sea god whose exact origins are not entirely clear across ancient sources, though he is generally regarded as one of the earliest generation of sea deities, often called the "Old Man of the Sea," a title he shares with other sea gods such as Nereus and Phorcys. He serves Poseidon as a faithful shepherd who tends flocks of sea creatures, especially seals, which he customarily herds ashore onto land or remote islands to rest beneath the sun. Because of his great age and profound knowledge of the sea, Proteus is regarded as one of the wisest figures among the sea gods, even though he rarely appears in the central narratives of Greek mythology.

Proteus's most famous power is his ability to transform into anything he wishes, from wild beasts such as lions and boars to natural elements such as fire and water, and even into a tree, a gift that makes him nearly impossible for anyone to capture. He also possesses an unerringly accurate gift of prophecy, able to foresee the future with precision, but his lazy and reluctant nature means he almost never volunteers his knowledge willingly. His character is portrayed as cunning yet honest once truly cornered, meaning the only way to force him to speak is to seize and hold onto him tightly through the entire sequence of forms he assumes in his attempts to escape.

The most famous myth involving Proteus appears in Homer's Odyssey, when Menelaus, king of Sparta, finds himself stranded on the island of Pharos during his voyage home from Troy and is told by Eidothea, Proteus's daughter, that the only way to secure his passage home is to force her father to reveal the secrets of the sea. Menelaus and his men disguise themselves in sealskins and ambush Proteus while he counts his flock at midday, holding on tightly as the god transforms in succession into a lion, a serpent, a leopard, a boar, water, and a tree, until he finally relents and returns to his true form. Proteus then reveals the offerings Menelaus must make to the gods to sail home safely, and also discloses the fates of other Greek heroes, including the murder of Agamemnon by his own wife, making this episode one of the most famous examples in Greek myth of divine knowledge that must be seized rather than simply requested.''',
    imageUrl: 'assets/images/Greek/SeaGods/proteus.webp',
    category: 'Sea',
  ),
];
