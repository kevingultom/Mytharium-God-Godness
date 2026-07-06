import '../models/god_model.dart';

final List<God> godsData = [
  // ==================== GREEK (10) ====================
  God(
    id: '1',
    name: 'Zeus',
    mythology: 'Greek',
    title: 'Raja Para Dewa',
    symbol: '⚡',
    powers: ['Petir', 'Langit', 'Otoritas', 'Keadilan', 'Hukum'],
    story:
        'Zeus adalah penguasa tertinggi para dewa Olympus dan raja seluruh alam semesta. Putra dari Titan Kronos dan Rhea, Zeus berhasil menggulingkan ayahnya setelah perang besar yang disebut Titanomakhia. Dengan senjata andalannya berupa petir yang ditempa oleh para Kiklops, Zeus menegakkan keadilan dan hukum di antara dewa maupun manusia. Ia bersemayam di puncak Gunung Olympus dan dikenal sebagai pelindung tamu dan simbol kedaulatan langit.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Zeus_Otricoli_Pio-Clementino_Inv257.jpg',
  ),
  God(
    id: '2',
    name: 'Athena',
    mythology: 'Greek',
    title: 'Dewi Kebijaksanaan & Perang',
    symbol: '🦉',
    powers: ['Kebijaksanaan', 'Strategi Perang', 'Kerajinan', 'Keadilan', 'Ilmu Pengetahuan'],
    story:
        'Athena adalah dewi kebijaksanaan, strategi perang, dan kerajinan tangan. Ia lahir secara ajaib langsung dari kepala Zeus setelah Titan Metis ditelan olehnya. Berbeda dari Ares yang mewakili kekejaman perang, Athena mewakili kecerdasan dan strategi dalam pertempuran. Kota Athena dinamai atas dirinya setelah ia mengalahkan Poseidon dalam lomba memberikan hadiah terbaik bagi kota tersebut.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Athena_Giustiniani_Musei_Capitolini_MC278.jpg',
  ),
  God(
    id: '3',
    name: 'Hades',
    mythology: 'Greek',
    title: 'Penguasa Dunia Bawah',
    symbol: '👑',
    powers: ['Kematian', 'Kekayaan', 'Dunia Bawah', 'Kegelapan', 'Jiwa-jiwa'],
    story:
        'Hades adalah penguasa Dunia Bawah, tempat roh-roh orang yang telah meninggal. Ia adalah saudara Zeus dan Poseidon, dan mendapat bagian dunia bawah ketika ketiga saudara itu membagi alam semesta. Meski sering dikira dewa kematian, Hades sebenarnya berperan sebagai raja yang memerintah alam kematian. Ia adalah salah satu dewa yang setia kepada pasangannya, Persephone.',
    imageUrl: '',
  ),
  God(
    id: '4',
    name: 'Poseidon',
    mythology: 'Greek',
    title: 'Penguasa Lautan',
    symbol: '🔱',
    powers: ['Lautan', 'Gempa Bumi', 'Badai', 'Kuda', 'Pelayaran'],
    story:
        'Poseidon adalah penguasa laut, danau, dan sungai. Saudara Zeus ini terkenal dengan trisula-nya yang bisa menimbulkan gempa bumi dan badai besar. Para pelaut Yunani kuno selalu memohon keselamatan darinya sebelum berlayar. Poseidon dikenal memiliki temperamen yang mudah berubah seperti cuaca lautan. Ia juga pencipta kuda pertama dari jilatan trisula di tanah.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Poseidon_sculpture_Copenhagen_2005.jpg',
  ),
  God(
    id: '5',
    name: 'Apollo',
    mythology: 'Greek',
    title: 'Dewa Matahari & Musik',
    symbol: '☀️',
    powers: ['Matahari', 'Musik', 'Ramalan', 'Penyembuhan', 'Panah'],
    story:
        'Apollo adalah salah satu dewa paling penting dalam mitologi Yunani, mengurusi matahari, musik, puisi, seni, ramalan, kebenaran, panahan, penyembuhan, cahaya, dan pengetahuan. Kembarannya adalah Artemis. Ia memimpin para Muse dan dewa penasihat Oracle Delphi. Dalam kereta keemasan yang ditarik empat kuda berapi, Apollo melintasi langit setiap hari membawa cahaya ke dunia.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Apollo_of_the_Belvedere.jpg',
  ),
  God(
    id: '6',
    name: 'Artemis',
    mythology: 'Greek',
    title: 'Dewi Perburuan & Bulan',
    symbol: '🌙',
    powers: ['Perburuan', 'Bulan', 'Alam Liar', 'Panah', 'Perlindungan Perempuan'],
    story:
        'Artemis adalah dewi perburuan, bulan, dan alam liar. Kembar Apollo, ia dikenal sebagai pemburu terbaik di antara para dewa. Selalu digambarkan membawa busur dan anak panah, Artemis menjelajahi hutan bersama para nimfa pengiringnya. Ia adalah pelindung perempuan muda dan ibu yang sedang melahirkan.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Diana_of_Versailles_Leochares.jpg',
  ),
  God(
    id: '7',
    name: 'Ares',
    mythology: 'Greek',
    title: 'Dewa Perang',
    symbol: '⚔️',
    powers: ['Perang', 'Keberanian', 'Kekuatan', 'Kekerasaan', 'Pertempuran'],
    story:
        'Ares adalah dewa perang dalam mitologi Yunani, melambangkan sisi brutal dan berdarah dari pertempuran. Berbeda dengan Athena yang mewakili strategi perang, Ares mewakili kekacauan dan keganasan di medan perang. Ia adalah putra Zeus dan Hera, dan memiliki hubungan rahasia dengan Aphrodite.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Ares_Ludovisi_Altemps_Inv8602_n2.jpg',
  ),
  God(
    id: '8',
    name: 'Aphrodite',
    mythology: 'Greek',
    title: 'Dewi Cinta & Kecantikan',
    symbol: '💞',
    powers: ['Cinta', 'Kecantikan', 'Kesuburan', 'Hasrat', 'Pesona'],
    story:
        'Aphrodite adalah dewi cinta, kecantikan, kesenangan, dan prokreasi. Menurut Hesiod, ia lahir dari buih laut di pantai Siprus. Ia menikah dengan Hephaestus namun memiliki banyak hubungan dengan dewa lain termasuk Ares. Ia adalah ibu dari Eros dan pelindung para pecinta.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Venus_de_Milo_Louvre_Ma399_n4.jpg',
  ),
  God(
    id: '9',
    name: 'Hermes',
    mythology: 'Greek',
    title: 'Utusan Para Dewa',
    symbol: '🪶',
    powers: ['Kecepatan', 'Komunikasi', 'Perdagangan', 'Kecerdikan', 'Panduan Jiwa'],
    story:
        'Hermes adalah utusan para dewa dan pemandu jiwa orang mati menuju Dunia Bawah. Ia adalah dewa tercepat di Olympus, dengan sandal bersayap. Hermes adalah pelindung pedagang, pelancong, dan pencuri. Ia dikenal sangat cerdik — pada hari pertama kelahirannya, ia mencuri ternak Apollo!',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Hermes_Ingenui_Pio-Clementino_Inv544.jpg',
  ),
  God(
    id: '10',
    name: 'Hephaestus',
    mythology: 'Greek',
    title: 'Dewa Api & Tempa',
    symbol: '🔥',
    powers: ['Api', 'Pandai Besi', 'Teknologi', 'Kerajinan', 'Senjata Dewa'],
    story:
        'Hephaestus adalah dewa api, pandai besi, dan pengrajin di antara para dewa Olympus. Meski memiliki fisik tidak sempurna, ia adalah pengrajin terbaik di alam semesta, menciptakan senjata para dewa termasuk petir Zeus, baju zirah Achilles, dan perangkap emas untuk menangkap Ares dan Aphrodite.',
    imageUrl: '',
  ),

  // ==================== EGYPTIAN (8) ====================
  God(
    id: '11',
    name: 'Anubis',
    mythology: 'Egyptian',
    title: 'Dewa Kematian & Mumifikasi',
    symbol: '🐺',
    powers: ['Kematian', 'Mumifikasi', 'Penimbang Jiwa', 'Penjaga Makam', 'Akhirat'],
    story:
        'Anubis adalah dewa kematian dan mumifikasi dalam mitologi Mesir Kuno. Berkepala anjing hutan hitam, Anubis memandu jiwa orang mati menuju akhirat dan menimbang hati mereka di hadapan Bulu Kebenaran. Hati yang lebih ringan dari bulu akan masuk surga, sedangkan yang lebih berat akan dimakan oleh Ammit.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Anubis_opening_the_mouth.jpg',
  ),
  God(
    id: '12',
    name: 'Ra',
    mythology: 'Egyptian',
    title: 'Dewa Matahari Agung',
    symbol: '☉',
    powers: ['Matahari', 'Penciptaan', 'Kerajaan', 'Langit', 'Kehidupan'],
    story:
        'Ra adalah dewa matahari dan salah satu dewa terpenting dalam mitologi Mesir. Digambarkan sebagai laki-laki berkepala elang dengan cakram matahari. Setiap hari, Ra berlayar melintasi langit di perahu surya. Firaun dianggap sebagai inkarnasi Ra di bumi.',
    imageUrl: '',
  ),
  God(
    id: '13',
    name: 'Osiris',
    mythology: 'Egyptian',
    title: 'Dewa Kematian & Kebangkitan',
    symbol: '🌿',
    powers: ['Kematian', 'Kebangkitan', 'Kesuburan', 'Peradaban', 'Akhirat'],
    story:
        'Osiris adalah raja pertama Mesir dan penguasa dunia orang mati. Ia dibunuh oleh saudaranya Set, dan tubuhnya dipotong-potong. Namun istrinya Isis mengumpulkan tubuhnya kembali. Osiris melambangkan siklus kematian dan kelahiran kembali, seperti Nil yang banjir setiap tahun menyuburkan tanah Mesir.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Osiris_Walters_22293.jpg',
  ),
  God(
    id: '14',
    name: 'Isis',
    mythology: 'Egyptian',
    title: 'Dewi Sihir & Keibuan',
    symbol: '🪶',
    powers: ['Sihir', 'Penyembuhan', 'Keibuan', 'Perlindungan', 'Kebijaksanaan'],
    story:
        'Isis adalah salah satu dewi paling dihormati dalam mitologi Mesir, dewi sihir, keibuan, dan penyembuhan. Ketika Osiris dibunuh Set, Isis menggunakan sihirnya untuk mengumpulkan tubuh suaminya dan menghidupkannya kembali. Pemujaan Isis kemudian menyebar ke seluruh dunia Mediterania.',
    imageUrl: '',
  ),
  God(
    id: '15',
    name: 'Horus',
    mythology: 'Egyptian',
    title: 'Dewa Langit & Kerajaan',
    symbol: '🦅',
    powers: ['Langit', 'Kerajaan', 'Perlindungan', 'Perang', 'Penglihatan'],
    story:
        'Horus adalah dewa langit dan kerajaan, digambarkan berkepala elang. Ia adalah putra Osiris dan Isis, dan musuh abadi Set. Pertarungan panjang Horus melawan Set untuk merebut tahta Mesir adalah salah satu kisah paling dramatis. Firaun dianggap sebagai inkarnasi Horus yang hidup.',
    imageUrl: '',
  ),
  God(
    id: '16',
    name: 'Seth',
    mythology: 'Egyptian',
    title: 'Dewa Kekacauan & Badai',
    symbol: '🌪️',
    powers: ['Kekacauan', 'Badai', 'Gurun', 'Kekuatan', 'Ketidakstabilan'],
    story:
        'Seth adalah dewa kekacauan, badai, dan gurun. Ia adalah pembunuh saudaranya Osiris. Meski dikenal sebagai dewa jahat, Seth juga berperan penting sebagai pelindung Ra dari ular chaos Apophis setiap malam. Ia melambangkan kekuatan gurun yang ganas.',
    imageUrl: '',
  ),
  God(
    id: '17',
    name: 'Thoth',
    mythology: 'Egyptian',
    title: 'Dewa Pengetahuan & Tulisan',
    symbol: '📜',
    powers: ['Pengetahuan', 'Tulisan', 'Sihir', 'Ilmu Pengetahuan', 'Penilaian'],
    story:
        'Thoth adalah dewa kebijaksanaan, penulisan, sihir, dan bulan. Digambarkan berkepala ibis, ia adalah sekretaris para dewa. Thoth menciptakan sistem tulisan hieroglif dan dianggap sebagai penulis semua buku suci. Dalam penghakiman jiwa, Thoth mencatat hasil penimbangan hati.',
    imageUrl: '',
  ),
  God(
    id: '18',
    name: 'Bastet',
    mythology: 'Egyptian',
    title: 'Dewi Perlindungan & Kucing',
    symbol: '🐈',
    powers: ['Perlindungan', 'Kesuburan', 'Keibuan', 'Musik', 'Hiburan'],
    story:
        'Bastet adalah dewi perlindungan, kesenangan, dan keibuan, digambarkan sebagai kucing. Di Mesir Kuno, kucing sangat dihormati karena melindungi dari tikus dan ular. Sebagai dewi kucing, Bastet melindungi rumah tangga dari roh jahat. Kuil utamanya di Bubastis adalah salah satu yang paling ramai dikunjungi.',
    imageUrl: '',
  ),

  // ==================== NORDIC (9) ====================
  God(
    id: '19',
    name: 'Odin',
    mythology: 'Nordic',
    title: 'Bapak Semua (All-Father)',
    symbol: '🧙',
    powers: ['Kebijaksanaan', 'Sihir', 'Perang', 'Kematian', 'Puisi'],
    story:
        'Odin adalah raja para dewa Asgard, dewa kebijaksanaan dan sihir. Untuk mendapatkan kebijaksanaan tertinggi, ia mengorbankan satu matanya di sumur Mimir dan menggantung dirinya di pohon dunia Yggdrasil selama sembilan hari. Ia ditemani burung gagak Huginn dan Muninn yang melaporkan semua kejadian di dunia.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Georg_von_Rosen_-_Oden_som_vandringsman,_1886_(Odin,_the_Wanderer).jpg',
  ),
  God(
    id: '20',
    name: 'Thor',
    mythology: 'Nordic',
    title: 'Dewa Petir',
    symbol: '🔨',
    powers: ['Petir', 'Kekuatan', 'Perlindungan', 'Keberanian', 'Badai'],
    story:
        'Thor adalah dewa petir, badai, dan kekuatan. Putra Odin ini terkenal dengan palunya, Mjolnir, yang bisa menghancurkan pegunungan dan hanya bisa diangkat oleh mereka yang layak. Thor adalah pelindung umat manusia dan musuh bebuyutan ular dunia Jormungandr. Hari Kamis (Thursday) dinamai atas dirinya.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Mårten_Eskil_Winge_-_Tor%27s_Fight_with_the_Giants_-_Google_Art_Project.jpg',
  ),
  God(
    id: '21',
    name: 'Loki',
    mythology: 'Nordic',
    title: 'Dewa Tipu Muslihat',
    symbol: '🦊',
    powers: ['Tipu Muslihat', 'Perubahan Wujud', 'Sihir', 'Kecerdikan', 'Kekacauan'],
    story:
        'Loki adalah dewa tipu muslihat dan perubahan wujud yang paling kontroversial dalam mitologi Norse. Kelicikannya sering membantu namun juga menimbulkan masalah besar. Ia adalah ayah dari monster-monster besar termasuk Hel, Jormungandr, dan Fenrir. Setelah membunuh Baldur, Loki dirantai hingga Ragnarok.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Loki_by_Mårten_Eskil_Winge.jpg',
  ),
  God(
    id: '22',
    name: 'Freya',
    mythology: 'Nordic',
    title: 'Dewi Cinta & Perang',
    symbol: '💎',
    powers: ['Cinta', 'Kesuburan', 'Sihir', 'Perang', 'Kematian'],
    story:
        'Freya adalah dewi cinta, kesuburan, perang, dan sihir dari ras dewa Vanir. Ia adalah dewa perang terkuat setelah Odin. Ia memiliki jubah bulu elang yang memungkinkannya terbang dan kalung Brisingamen yang sangat berharga. Freya juga mengajarkan sihir seidr kepada Odin.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Freya_by_Johannes_Gehrts.jpg',
  ),
  God(
    id: '23',
    name: 'Tyr',
    mythology: 'Nordic',
    title: 'Dewa Keadilan & Hukum',
    symbol: '⚖️',
    powers: ['Keadilan', 'Hukum', 'Keberanian', 'Pengorbanan', 'Perang'],
    story:
        'Tyr adalah dewa keadilan, hukum, dan perang yang terhormat. Ketika para dewa mengikat serigala raksasa Fenrir, hanya Tyr yang berani memasukkan tangannya ke mulut Fenrir sebagai jaminan. Fenrir menggigit tangan Tyr — namun Tyr dengan tenang menerima pengorbanan ini demi keselamatan alam semesta.',
    imageUrl: '',
  ),
  God(
    id: '24',
    name: 'Baldur',
    mythology: 'Nordic',
    title: 'Dewa Cahaya & Kemurnian',
    symbol: '✨',
    powers: ['Cahaya', 'Kemurnian', 'Kecantikan', 'Kebaikan', 'Kebijaksanaan'],
    story:
        'Baldur adalah dewa cahaya dan kemurnian — dewa yang paling dicintai di Asgard. Ibunya Frigg meminta semua benda di dunia untuk tidak menyakitinya, kecuali mistletoe. Loki mengelabui Hodur untuk melempar mistletoe ke Baldur, membunuhnya. Kematian Baldur adalah pertanda awal Ragnarok.',
    imageUrl: '',
  ),
  God(
    id: '25',
    name: 'Heimdall',
    mythology: 'Nordic',
    title: 'Penjaga Bifrost',
    symbol: '🌈',
    powers: ['Penglihatan', 'Pendengaran', 'Penjagaan', 'Peringatan', 'Cahaya'],
    story:
        'Heimdall adalah penjaga jembatan pelangi Bifrost yang menghubungkan Asgard dengan dunia lainnya. Ia bisa melihat ratusan mil jauhnya dan mendengar suara rumput tumbuh. Tanduknya Gjallarhorn, jika ditiup, akan membangunkan semua dewa dan manusia di sembilan dunia saat Ragnarok tiba.',
    imageUrl: '',
  ),
  God(
    id: '26',
    name: 'Frigg',
    mythology: 'Nordic',
    title: 'Ratu Asgard',
    symbol: '🕊️',
    powers: ['Keibuan', 'Ramalan', 'Kebijaksanaan', 'Cinta', 'Perlindungan'],
    story:
        'Frigg adalah ratu Asgard dan istri Odin, dewi keibuan, pernikahan, dan ramalan. Ia bisa melihat masa depan namun tidak pernah mengungkapkannya. Cintanya kepada Baldur mendorongnya meminta semua benda di semesta untuk tidak menyakiti anaknya. Hari Jumat (Friday) diyakini dinamai atas dirinya.',
    imageUrl: '',
  ),
  God(
    id: '27',
    name: 'Skadi',
    mythology: 'Nordic',
    title: 'Dewi Musim Dingin & Perburuan',
    symbol: '⛰️',
    powers: ['Musim Dingin', 'Berburu', 'Gunung', 'Ski', 'Kebebasan'],
    story:
        'Skadi adalah dewi musim dingin, ski, dan berburu. Ia adalah putri dari raksasa Thiazi yang dibunuh oleh para dewa Asgard. Skadi datang ke Asgard bersenjata lengkap menuntut keadilan. Para dewa menawarkan kompensasi termasuk memberikan suami dari antara mereka.',
    imageUrl: '',
  ),

  // ==================== HINDU (9) ====================
  God(
    id: '28',
    name: 'Shiva',
    mythology: 'Hindu',
    title: 'Penghancur & Transformer',
    symbol: '🌀',
    powers: ['Penghancuran', 'Transformasi', 'Meditasi', 'Tari Kosmik', 'Yoga'],
    story:
        'Shiva adalah salah satu dari Trimurti, dewa penghancur dan transformer. Shiva adalah dewa paradoks — ia adalah pertapa yang bermeditasi di Gunung Kailash sekaligus penari kosmik Nataraja yang tariannya menciptakan dan menghancurkan alam semesta. Simbol utamanya adalah lingam, Trishul, dan Damaru.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Shiva_as_the_Lord_of_Dance_LACMA_edit.jpg',
  ),
  God(
    id: '29',
    name: 'Vishnu',
    mythology: 'Hindu',
    title: 'Pemelihara Alam Semesta',
    symbol: '🔵',
    powers: ['Pemeliharaan', 'Perlindungan', 'Kebenaran', 'Avatar', 'Kesejahteraan'],
    story:
        'Vishnu adalah dewa pemelihara dan pelindung alam semesta dalam Trimurti Hindu. Ia turun ke bumi dalam berbagai avatar ketika kejahatan mengancam keseimbangan kosmis. Sepuluh avatar utamanya (Dashavatara) termasuk Rama, Krishna, dan Buddha. Vishnu tinggal di Vaikuntha di atas ular kosmik Ananta Shesha.',
    imageUrl: '',
  ),
  God(
    id: '30',
    name: 'Brahma',
    mythology: 'Hindu',
    title: 'Pencipta Alam Semesta',
    symbol: '🪷',
    powers: ['Penciptaan', 'Pengetahuan', 'Veda', 'Nasib', 'Waktu'],
    story:
        'Brahma adalah dewa pencipta dalam Trimurti Hindu. Ia digambarkan memiliki empat wajah yang menghadap ke empat penjuru mata angin, mewakili pengetahuan universal. Brahma lahir dari bunga teratai yang keluar dari pusar Vishnu. Istrinya Saraswati adalah dewi kebijaksanaan dan seni.',
    imageUrl: '',
  ),
  God(
    id: '31',
    name: 'Durga',
    mythology: 'Hindu',
    title: 'Dewi Kekuatan Kosmik',
    symbol: '⚜️',
    powers: ['Kekuatan', 'Perang', 'Perlindungan', 'Keibuan', 'Kemenangan'],
    story:
        'Durga adalah dewi ibu yang perkasa, perwujudan dari shakti (energi ilahi feminin). Ia diciptakan dari kumpulan energi semua dewa untuk mengalahkan Mahishasura, iblis kerbau yang tidak bisa dibunuh oleh pria manapun. Dengan delapan tangan yang masing-masing memegang senjata sakti, Durga adalah prajurit tak terkalahkan.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Raja_Ravi_Varma,_Goddess_Durga.jpg',
  ),
  God(
    id: '32',
    name: 'Kali',
    mythology: 'Hindu',
    title: 'Dewi Waktu & Kematian',
    symbol: '🖤',
    powers: ['Waktu', 'Kematian', 'Transformasi', 'Kebebasan', 'Kekuatan Gelap'],
    story:
        'Kali adalah dewi waktu, perubahan, dan kematian. Digambarkan dengan kulit hitam dan lidah terjulur, ia tampak menakutkan namun sebenarnya penuh kasih bagi pemujanya. Kali lahir dari dahi Durga selama pertempuran melawan iblis Raktabija — ia menjulurkan lidahnya untuk meminumnya setiap kali darah iblis itu jatuh.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Kali_by_Raja_Ravi_Varma.jpg',
  ),
  God(
    id: '33',
    name: 'Ganesha',
    mythology: 'Hindu',
    title: 'Dewa Kebijaksanaan & Awal Mula',
    symbol: '🐘',
    powers: ['Kebijaksanaan', 'Awal Mula', 'Menghilangkan Rintangan', 'Seni', 'Ilmu Pengetahuan'],
    story:
        'Ganesha adalah dewa berkepala gajah yang paling dicintai dalam Hindu, pelindung seni, ilmu pengetahuan, dan penjaga pintu. Kepala gajahnya didapat ketika Shiva memenggal kepalanya karena tidak mengenali putranya sendiri, lalu menggantinya dengan kepala gajah pertama yang ditemuinya.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Ganesha_Basohli_miniature_circa_1730_Dubost_p175.jpg',
  ),
  God(
    id: '34',
    name: 'Krishna',
    mythology: 'Hindu',
    title: 'Dewa Cinta & Kasih Sayang',
    symbol: '🪈',
    powers: ['Cinta', 'Kebijaksanaan', 'Sihir', 'Strategi', 'Seni Musik'],
    story:
        'Krishna adalah avatar kedelapan Vishnu dan salah satu dewa paling dicintai dalam Hindu. Ia adalah pengajar kebijaksanaan tertinggi dalam Bhagavad Gita, membimbing Arjuna di medan perang Kurukshetra. Krishna terkenal dengan sifatnya yang penuh kasih dan humoris. Cintanya dengan Radha adalah simbol cinta jiwa kepada Yang Ilahi.',
    imageUrl: '',
  ),
  God(
    id: '35',
    name: 'Lakshmi',
    mythology: 'Hindu',
    title: 'Dewi Kekayaan & Keberuntungan',
    symbol: '🌸',
    powers: ['Kekayaan', 'Keberuntungan', 'Kemakmuran', 'Kecantikan', 'Kesuburan'],
    story:
        'Lakshmi adalah dewi kekayaan, keberuntungan, dan kecantikan dalam Hindu. Ia adalah istri Vishnu dan muncul bersamanya di setiap inkarnasi. Lakshmi lahir dari samudra susu kosmik saat para dewa mengaduk lautan untuk mendapatkan amerta. Festival Diwali merayakan kedatangannya ke rumah-rumah untuk memberkati dengan kemakmuran.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Lakshmi_by_Raja_Ravi_Varma.jpg',
  ),
  God(
    id: '36',
    name: 'Saraswati',
    mythology: 'Hindu',
    title: 'Dewi Pengetahuan & Seni',
    symbol: '🎵',
    powers: ['Pengetahuan', 'Musik', 'Seni', 'Kebijaksanaan', 'Pembelajaran'],
    story:
        'Saraswati adalah dewi pengetahuan, musik, seni, dan pembelajaran. Ia adalah istri Brahma dan ibu dari semua ilmu pengetahuan. Digambarkan dengan sari putih di atas angsa atau teratai putih dan memegang veena (alat musik petik). Saraswati adalah pelindung para pelajar, seniman, dan musisi.',
    imageUrl:
        'https://commons.wikimedia.org/wiki/Special:FilePath/Saraswati_by_Raja_Ravi_Varma.jpg',
  ),
];
