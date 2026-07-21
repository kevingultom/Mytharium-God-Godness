import '../models/quiz_question_model.dart';

final List<QuizQuestion> japaneseQuizData = [
  // 1
  QuizQuestion(
    question: 'Dalam mitos penciptaan Kuniumi, berapa kali pasangan ilahi Izanagi dan Izanami berhasil menciptakan pulau-pulau Jepang sebelum menghasilkan delapan pulau utama?',
    questionEn: 'In the Kuniumi creation myth, how many times did Izanagi and Izanami fail before successfully creating the eight main islands of Japan?',
    options: [
      'Tidak ada kegagalan — mereka langsung berhasil',
      'Satu kali kegagalan',
      'Tiga kali kegagalan',
      'Dua kali kegagalan',
    ],
    optionsEn: [
      'No failures — they succeeded on the first attempt',
      'One failure',
      'Three failures',
      'Two failures',
    ],
    correctIndex: 2,
  ),
  // 2
  QuizQuestion(
    question: 'Siapa yang mengobati luka di leher (tenggorokan) Izanami saat melahirkan api, sehingga mengorbankan dirinya sendiri?',
    questionEn: 'Who treated the wound on Izanami\'s neck when she gave birth to fire, ultimately leading to her death?',
    options: [
      'Izanagi',
      'Kagutsuchi',
      'Tajikarao',
      'Takemikazuchi',
    ],
    optionsEn: [
      'Izanagi',
      'Kagutsuchi',
      'Tajikarao',
      'Takemikazuchi',
    ],
    correctIndex: 1,
  ),
  // 3
  QuizQuestion(
    question: 'Dalam Kojiki, dewa apa yang lahir dari kotoran tubuh Izanagi saat ia membersihkan diri setelah turun ke Yomi?',
    questionEn: 'In the Kojiki, what deity was born from the filth on Izanagi\'s body when he purified himself after returning from Yomi?',
    options: [
      'Amaterasu',
      'Tsukuyomi',
      'Susanoo',
      'Wakumusubi',
    ],
    optionsEn: [
      'Amaterasu',
      'Tsukuyomi',
      'Susanoo',
      'Wakumusubi',
    ],
    correctIndex: 3,
  ),
  // 4
  QuizQuestion(
    question: 'Tali shimenawa (shimenawa) yang mengelilingi Ama-no-Iwato (Gua Batu Surgawi) dibuat dari bahan apa?',
    questionEn: 'What material was the shimenawa rope around the Ama-no-Iwato (Heavenly Rock Cave) made from?',
    options: [
      'Rami suci',
      'Rumput kusanagi',
      'Tali jerami tamanari',
      'Sutra emas',
    ],
    optionsEn: [
      'Sacred hemp',
      'Kusanagi grass',
      'Tamanari straw rope',
      'Golden silk',
    ],
    correctIndex: 2,
  ),
  // 5
  QuizQuestion(
    question: 'Ame-no-Uzume melakukan tarian telanjang yang memancing tawa para dewa untuk menarik Amaterasu keluar dari gua. Siapa yang menarik Amaterasu keluar dari gua saat ia melihat pantulannya?',
    questionEn: 'Ame-no-Uzume performed a lewd dance to lure Amaterasu out of the cave. Who physically pulled Amaterasu out when she saw her reflection?',
    options: [
      'Tajikarao',
      'Kamotaketsunumi',
      'Takemikazuchi',
      'Futodama',
    ],
    optionsEn: [
      'Tajikarao',
      'Kamotaketsunumi',
      'Takemikazuchi',
      'Futodama',
    ],
    correctIndex: 0,
  ),
  // 6
  QuizQuestion(
    question: 'Yamata no Orochi (Ular Kepala Delapan) yang dibunuh Susanoo memiliki berapa ekor?',
    questionEn: 'How many tails did Yamata no Orochi, the eight-headed serpent slain by Susanoo, have?',
    options: [
      'Delapan',
      'Tujuh',
      'Sembilan',
      'Enam',
    ],
    optionsEn: [
      'Eight',
      'Seven',
      'Nine',
      'Six',
    ],
    correctIndex: 2,
  ),
  // 7
  QuizQuestion(
    question: 'Pedang Kusanagi no Tsurugi ditemukan di dalam tubuh Yamata no Orochi. Di mana Susanoo menanam pedang itu setelah menemukannya?',
    questionEn: 'The Kusanagi no Tsurugi was found inside Yamata no Orochi. Where did Susanoo plant the sword after finding it?',
    options: [
      'Di kuil Ise',
      'Di gunung Izumo',
      'Di istana Tenri',
      'Di kota Yamato',
    ],
    optionsEn: [
      'At the Ise Shrine',
      'On Mount Izumo',
      'In the city of Tenri',
      'In the city of Yamato',
    ],
    correctIndex: 1,
  ),
  // 8
  QuizQuestion(
    question: 'Tsukuyomi membunuh dewi makanan Uke Mochi karena cara ia menghasilkan makanan. Apa yang dihasilkan Uke Mochi dari hidungnya?',
    questionEn: 'Tsukuyomi killed the food goddess Uke Mochi because of how she produced food. What did Uke Mochi produce from her nose?',
    options: [
      'Nasi',
      'Ikan',
      'Sake',
      'Rumput',
    ],
    optionsEn: [
      'Rice',
      'Fish',
      'Sake',
      'Grass',
    ],
    correctIndex: 2,
  ),
  // 9
  QuizQuestion(
    question: 'Menurut Kojiki, apakah Tsukuyomi dan Amaterasu terlahir dari tubuh yang sama? Bagaimana hal ini berbeda dengan versi Nihon Shoki?',
    questionEn: 'According to the Kojiki, were Tsukuyomi and Amaterasu born from the same body? How does this differ from the Nihon Shoki version?',
    options: [
      'Keduanya lahir dari mata kiri Izanagi',
      'Tsukuyomi dari mata kiri, Amaterasu dari mata kanan',
      'Amaterasu dari mata kanan, Tsukuyomi dari hidung',
      'Keduanya lahir dari mata kanan Izanagi',
    ],
    optionsEn: [
      'Both born from Izanagi\'s left eye',
      'Tsukuyomi from the left eye, Amaterasu from the right',
      'Amaterasu from the right eye, Tsukuyomi from the nose',
      'Both born from Izanagi\'s right eye',
    ],
    correctIndex: 1,
  ),
  // 10
  QuizQuestion(
    question: 'Ninigi-no-Mikoto diturunkan ke Ashihara no Nakatsukuni oleh siapa?',
    questionEn: 'Who sent Ninigi-no-Mikoto down to Ashihara no Nakatsukuni?',
    options: [
      'Susanoo',
      'Amaterasu dan Takemikazuchi',
      'Amaterasu saja',
      'Izanagi',
    ],
    optionsEn: [
      'Susanoo',
      'Amaterasu and Takemikazuchi',
      'Amaterasu alone',
      'Izanagi',
    ],
    correctIndex: 1,
  ),
  // 11
  QuizQuestion(
    question: 'Apa yang menjadi syarat utama yang memisahkan dunia para dewa (Takamagahara) dari dunia manusia (Ashihara no Nakatsukuni)?',
    questionEn: 'What was the main condition that separated the realm of the gods (Takamagahara) from the world of humans (Ashihara no Nakatsukuni)?',
    options: [
      'Pertempuran antara Amaterasu dan Susanoo',
      'Izanagi menetapkan batas dunia di gunung Fuji',
      'Pertaruhan dan kemenangan Izanagi atas Izanami',
      'Pemberian shimenawa oleh dewa tertinggi',
    ],
    optionsEn: [
      'The battle between Amaterasu and Susanoo',
      'Izanagi set the boundary at Mount Fuji',
      'Izanagi\'s wager and victory over Izanami',
      'The granting of the shimenawa by the highest deity',
    ],
    correctIndex: 2,
  ),
  // 12
  QuizQuestion(
    question: 'Suku Ainu di Hokkaido menyebut Susanoo sebagai dewa penyelamat mereka. Nama dewa yang berkaitan dengan Susanoo dalam tradisi Ainu disebut apa?',
    questionEn: 'The Ainu people of Hokkaido revered Susanoo as their savior deity. What is the name of the deity associated with Susanoo in Ainu tradition?',
    options: [
      'Shirokane',
      'Raijin',
      'Shinra-bansho',
      'Kamuy',
    ],
    optionsEn: [
      'Shirokane',
      'Raijin',
      'Shinra-bansho',
      'Kamuy',
    ],
    correctIndex: 3,
  ),
  // 13
  QuizQuestion(
    question: 'Hachiman, dewa perang, sebenarnya lahir sebagai putra siapa?',
    questionEn: 'Hachiman, the god of war, was actually born as the son of whom?',
    options: [
      'Susanoo dan Amaterasu',
      'Ōkuninushi dan Kushinadahime',
      'Takemikazuchi dan Haritasu-hime',
      'Amaterasu dan Ninigi',
    ],
    optionsEn: [
      'Susanoo and Amaterasu',
      'Ōkuninushi and Kushinadahime',
      'Takemikazuchi and Haritasu-hime',
      'Amaterasu and Ninigi',
    ],
    correctIndex: 1,
  ),
  // 14
  QuizQuestion(
    question: 'Menurut Nihon Shoki, berapa jumlah dewa yang diciptakan ketika Izanagi membersihkan diri di sungai setelah kembali dari Yomi?',
    questionEn: 'According to the Nihon Shoki, how many deities were created when Izanagi purified himself in the river after returning from Yomi?',
    options: [
      'Tiga belas',
      'Sembilan belas',
      'Dua belas',
      'Dua puluh satu',
    ],
    optionsEn: [
      'Thirteen',
      'Nineteen',
      'Twelve',
      'Twenty-one',
    ],
    correctIndex: 1,
  ),
  // 15
  QuizQuestion(
    question: 'Ninigi-no-Mikoto menikahi Konohanasakuya-hime (Putri Pohon Bunga). Siapa saudari perempuan Konohanasakuya-hime yang menjadi nenek moyang garis keturunan bangsa Yamato?',
    questionEn: 'Ninigi-no-Mikoto married Konohanasakuya-hime. Who was her sister that became the ancestor of the Yamato lineage?',
    options: [
      'Iwanagahime',
      'Kono-hana-sakuya-hime tidak punya saudari',
      'Yamato-hime-no-Mikoto',
      'Kushinadahime',
    ],
    optionsEn: [
      'Iwanagahime',
      'Konohanasakuya-hime had no sister',
      'Yamato-hime-no-Mikoto',
      'Kushinadahime',
    ],
    correctIndex: 0,
  ),
  // 16
  QuizQuestion(
    question: 'Kenapa Ninigi menolak menikahi Iwanagahime, padahal ia adalah putri Ame-no-Oshihomimi?',
    questionEn: 'Why did Ninigi refuse to marry Iwanagahime, even though she was the daughter of Ame-no-Oshihomimi?',
    options: [
      'Iwanagahime terlalu tua untuknya',
      'Karena Iwanagahime adalah dewi kematian',
      'Karena Iwanagahime memiliki wajah yang menakutkan',
      'Iwanagahime tidak menawarkan keabadian',
    ],
    optionsEn: [
      'Iwanagahime was too old for him',
      'Because Iwanagahime was a death goddess',
      'Because Iwanagahime had a frightening appearance',
      'Iwanagahime did not offer immortality',
    ],
    correctIndex: 3,
  ),
  // 17
  QuizQuestion(
    question: 'Mitos tentang Iwanagahime menjelaskan bahwa Ninigi memilih keindahan daripada keabadian. Apa yang diberikan Iwanagahime jika diterima?',
    questionEn: 'The myth of Iwanagahime explains that Ninigi chose beauty over immortality. What would Iwanagahime have granted?',
    options: [
      'Kekayaan tak terbatas',
      'Umur panjang',
      'Kekuatan tak terbatas',
      'Kehidupan abadi',
    ],
    optionsEn: [
      'Unlimited wealth',
      'Long life',
      'Unlimited power',
      'Eternal life',
    ],
    correctIndex: 1,
  ),
  // 18
  QuizQuestion(
    question: 'Ōkuninushi (Ōnamuchi) memiliki julukan lain karena kesabarannya. Apa julukan yang terkait dengan karakternya yang tenang?',
    questionEn: 'Ōkuninushi (Ōnamuchi) had another nickname related to his patient character. What was it?',
    options: [
      'Kami-no-nushi (Tuan Dewa)',
      'Yasoshima-no-Kami',
      'Sukuna-hikona-no-Kami',
      'Shiotsuchi-no-Kami',
    ],
    optionsEn: [
      'Kami-no-nushi (Lord of the Gods)',
      'Yasoshima-no-Kami',
      'Sukuna-hikona-no-Kami',
      'Shiotsuchi-no-Kami',
    ],
    correctIndex: 1,
  ),
  // 19
  QuizQuestion(
    question: 'Sukuna-hikona adalah dewa kecil yang membantu Ōkuninushi. Dalam versi Nihon Shoki, dari mana Sukuna-hikona berasal?',
    questionEn: 'Sukuna-hikona was a small deity who helped Ōkuninushi. In the Nihon Shoki version, where did Sukuna-hikona come from?',
    options: [
      'Dari Yomi (dunia bawah)',
      'Dari Takamagahara',
      'Dari laut selatan (Tokoyo)',
      'Dari gunung Izumo',
    ],
    optionsEn: [
      'From Yomi (the underworld)',
      'From Takamagahara',
      'From the southern sea (Tokoyo)',
      'From Mount Izumo',
    ],
    correctIndex: 2,
  ),
  // 20
  QuizQuestion(
    question: 'Tiga Regalia Kekaisaran (Sanshu no Jingi) terdiri dari pedang, permata, dan cermin. Siapa dewa yang membawa cermin khiangan ke Ama-no-Iwato untuk mengeluarkan Amaterasu?',
    questionEn: 'The Three Imperial Regalia consist of a sword, a jewel, and a mirror. Which deity brought the mirror to the Ama-no-Iwato to lure Amaterasu out?',
    options: [
      'Ame-no-Uzume',
      'Futodama',
      'Ame-no-Tajikarao',
      'Takemikazuchi',
    ],
    optionsEn: [
      'Ame-no-Uzume',
      'Futodama',
      'Ame-no-Tajikarao',
      'Takemikazuchi',
    ],
    correctIndex: 1,
  ),
  // 21
  QuizQuestion(
    question: 'Raijin (Raijin) dan Fujin (Fujin) adalah saudara. Berdasarkan tradisi Shinto, mereka lahir dari tubuh siapa?',
    questionEn: 'Raijin and Fujin are brothers. According to Shinto tradition, they were born from whose body?',
    options: [
      'Izanami',
      'Izanagi',
      'Susanoo',
      'Takemikazuchi',
    ],
    optionsEn: [
      'Izanami',
      'Izanagi',
      'Susanoo',
      'Takemikazuchi',
    ],
    correctIndex: 1,
  ),
  // 22
  QuizQuestion(
    question: 'Nihon Shoki dan Kojiki memiliki perbedaan tentang siapa yang menjadi raja pertama Jepang. Nihon Shoki mencantumkan siapa yang diklaim sebagai raja?',
    questionEn: 'The Nihon Shoki and Kojiki differ on who the first ruler of Japan was. Who does the Nihon Shoki claim as the first ruler?',
    options: [
      'Sumeru-no-Mikoto',
      'Jimmu',
      'Hikoyosune-no-Mikoto',
      'Kan-yamato Iware-biko',
    ],
    optionsEn: [
      'Sumeru-no-Mikoto',
      'Jimmu',
      'Hikoyosune-no-Mikoto',
      'Kan-yamato Iware-biko',
    ],
    correctIndex: 0,
  ),
  // 23
  QuizQuestion(
    question: 'Raja Jimmu dalam legenda ditemani oleh burung gagak tiga kaki yang disebut Yatagarasu. Siapa yang mengirim Yatagarasu?',
    questionEn: 'In the legend, Emperor Jimmu was guided by a three-legged crow called Yatagarasu. Who sent Yatagarasu?',
    options: [
      'Izanagi',
      'Amaterasu',
      'Susanoo',
      'Takemikazuchi',
    ],
    optionsEn: [
      'Izanagi',
      'Amaterasu',
      'Susanoo',
      'Takemikazuchi',
    ],
    correctIndex: 1,
  ),
  // 24
  QuizQuestion(
    question: 'Dalam mitologi Jepang, Gunung Fuji terkait dengan dewa/api vulkanik apa?',
    questionEn: 'In Japanese mythology, Mount Fuji is associated with which fire/volcanic deity?',
    options: [
      'Kanayamahiko',
      'Hinokagutsuchi',
      'Konohanasakuya-hime',
      'Ame-no-Uzume',
    ],
    optionsEn: [
      'Kanayamahiko',
      'Hinokagutsuchi',
      'Konohanasakuya-hime',
      'Ame-no-Uzume',
    ],
    correctIndex: 2,
  ),
  // 25
  QuizQuestion(
    question: 'Konohanasakuya-hime membakar makam suaminya Hoori (Yamasachihiko) dengan mengorbankan dirinya. Berapa bayi yang lahir dari pernikahan mereka?',
    questionEn: 'Konohanasakuya-hime sacrificed herself by burning her husband Hoori\'s funeral pyre. How many children were born from their marriage?',
    options: [
      'Dua',
      'Tiga',
      'Empat',
      'Satu',
    ],
    optionsEn: [
      'Two',
      'Three',
      'Four',
      'One',
    ],
    correctIndex: 1,
  ),
  // 26
  QuizQuestion(
    question: 'Kanayamahiko dan Kanayamabime adalah dewa logam. Dalam Nihon Shoki, bagaimana mereka meninggal?',
    questionEn: 'Kanayamahiko and Kanayamabime are metal deities. How did they die in the Nihon Shoki?',
    options: [
      'Dibunuh oleh Susanoo',
      'Bunuh diri karena malu',
      'Tersedak oleh makanan yang ditawarkan',
      'Terserang wabah penyakit',
    ],
    optionsEn: [
      'Killed by Susanoo',
      'Committed suicide out of shame',
      'Choked on an offering',
      'Struck down by plague',
    ],
    correctIndex: 2,
  ),
  // 27
  QuizQuestion(
    question: 'Dalam festival Tanabata, dua kekasih celestial yang dipisahkan oleh galaksi disebut apa?',
    questionEn: 'In the Tanabata festival, the two celestial lovers separated by the galaxy are known as what?',
    options: [
      'Amano-Uzume dan Ame-no-Tajikarao',
      'Orihime dan Hikoboshi',
      'Tsukuyomi dan Amaterasu',
      'Izanagi dan Izanami',
    ],
    optionsEn: [
      'Amano-Uzume and Ame-no-Tajikarao',
      'Orihime and Hikoboshi',
      'Tsukuyomi and Amaterasu',
      'Izanagi and Izanami',
    ],
    correctIndex: 1,
  ),
  // 28
  QuizQuestion(
    question: 'Perayaan Namahage di Prefektur Akita melibatkan pria berpakaian sebagai roh/makhluk menyeramkan. Makhluk Namahage dikirim dari pulau mana?',
    questionEn: 'The Namahage ritual in Akita Prefecture involves men dressed as frightening spirits. According to legend, where were Namahage sent from?',
    options: [
      'Pulau Tsushima',
      'Pulau Awaji',
      'Pulau Dewa',
      'Pulau Okinawa',
    ],
    optionsEn: [
      'Tsushima Island',
      'Awaji Island',
      'Dewa Island',
      'Okinawa Island',
    ],
    correctIndex: 0,
  ),
  // 29
  QuizQuestion(
    question: 'Kapan festival Namahage tradisional diadakan? Apa makna ritual ini?',
    questionEn: 'When is the traditional Namahage festival held? What is the meaning of this ritual?',
    options: [
      'Malam Tahun Baru — mengusir roh jahat',
      'Pertengahan musim panas — merayakan panen',
      'Malam Tahun Baru — menjaga anak-anak nakal',
      'Musim gugur — merayakan kematian',
    ],
    optionsEn: [
      'New Year\'s Eve — to drive away evil spirits',
      'Midsummer — to celebrate the harvest',
      'New Year\'s Eve — to keep naughty children in check',
      'Autumn — to celebrate death',
    ],
    correctIndex: 2,
  ),
  // 30
  QuizQuestion(
    question: 'Dalam tradisi Shinto, shimenawa sering ditemukan di pintu masuk kuil. Apa yang diwakili oleh shimenawa?',
    questionEn: 'In Shinto tradition, shimenawa are often found at shrine entrances. What does the shimenawa represent?',
    options: [
      'Jalan masuk ke dunia bawah',
      'Batas antara suci dan profan',
      'Peringatan dari dewa kematian',
      'Simbol kekaisaran',
    ],
    optionsEn: [
      'Pathway to the underworld',
      'Boundary between sacred and profane',
      'Warning from the death god',
      'Symbol of the emperor',
    ],
    correctIndex: 1,
  ),
  // 31
  QuizQuestion(
    question: 'Inari adalah dewa/dewi perlindungan apa, dan mengapa rubah (kitsune) menjadi utusan mereka?',
    questionEn: 'Inari is the protector deity of what, and why do foxes (kitsune) serve as their messengers?',
    options: [
      'Dewa laut — rubah suka makan ikan',
      'Dewa pertanian dan beras — rubah mengusir hama',
      'Dewa api — rubah memiliki api ekor',
      'Dewa kekayaan — rubah membawa keberuntungan',
    ],
    optionsEn: [
      'Sea god — foxes like eating fish',
      'Agricultural and rice deity — foxes repel pests',
      'Fire god — foxes have fire in their tails',
      'Wealth deity — foxes bring good fortune',
    ],
    correctIndex: 1,
  ),
  // 32
  QuizQuestion(
    question: 'Apa nama bunga sakura yang mekar di sekitar kuil Inari di Kyoto?',
    questionEn: 'What is the name of the cherry blossom that blooms around the Inari shrine in Kyoto?',
    options: [
      'Yaezakura',
      'Somei Yoshino',
      'Shidarezakura',
      'Fugenzo',
    ],
    optionsEn: [
      'Yaezakura',
      'Somei Yoshino',
      'Shidarezakura',
      'Fugenzo',
    ],
    correctIndex: 2,
  ),
  // 33
  QuizQuestion(
    question: 'Jizo Bosatsu (Jizo) adalah bodhisattva yang melindungi siapa?',
    questionEn: 'Jizo Bosatsu (Jizo) is a bodhisattva who protects whom?',
    options: [
      'Prajurit yang tewas dalam pertempuran',
      'Anak-anak yang meninggal sebelum orang tua mereka',
      'Pelaut yang tersesat di laut',
      'Petani yang kehilangan panen',
    ],
    optionsEn: [
      'Warriors who died in battle',
      'Children who died before their parents',
      'Sailors lost at sea',
      'Farmers who lost their harvest',
    ],
    correctIndex: 1,
  ),
  // 34
  QuizQuestion(
    question: 'Kannon di Jepang sering ditampilkan sebagai wanita berbaju putih. Dalam tradisi Buddha Jepang, berapa jumlah bentuk Kannon yang utama?',
    questionEn: 'Kannon in Japan is often depicted as a woman in white. In Japanese Buddhist tradition, how many main forms of Kannon are recognized?',
    options: [
      'Tiga puluh tiga',
      'Dua belas',
      'Tujuh belas',
      'Empat puluh empat',
    ],
    optionsEn: [
      'Thirty-three',
      'Twelve',
      'Seventeen',
      'Forty-four',
    ],
    correctIndex: 0,
  ),
  // 35
  QuizQuestion(
    question: 'Pertempuran antara Kunitsukami (dewa darat) dan Amatsukami (dewa langit) terjadi dalam konteks konflik siapa?',
    questionEn: 'The conflict between Kunitsukami (land deities) and Amatsukami (heavenly deities) took place in the context of whose conflict?',
    options: [
      'Konflik Ōkuninushi dengan Amaterasu',
      'Konflik Susanoo dengan Izanagi',
      'Konflik Ninigi dengan Takemikazuchi',
      'Konflik Takemikazuchi dengan Raijin',
    ],
    optionsEn: [
      'Ōkuninushi\'s conflict with Amaterasu',
      'Susanoo\'s conflict with Izanagi',
      'Ninigi\'s conflict with Takemikazuchi',
      'Takemikazuchi\'s conflict with Raijin',
    ],
    correctIndex: 0,
  ),
  // 36
  QuizQuestion(
    question: 'Kunitsukami vs Amatsukami: Takemikazuchi dikirim ke daratan untuk menaklukkan Ōkuninushi. Ōkuninushi menyerah setelah berapa kali dihancurkan dan hidup kembali?',
    questionEn: 'In the Kunitsukami vs Amatsukami conflict, Takemikazuchi was sent to subdue Ōkuninushi. How many times was Ōkuninushi destroyed and revived before surrendering?',
    options: [
      'Tiga kali',
      'Tujuh kali',
      'Lima kali',
      'Delapan kali',
    ],
    optionsEn: [
      'Three times',
      'Seven times',
      'Five times',
      'Eight times',
    ],
    correctIndex: 2,
  ),
  // 37
  QuizQuestion(
    question: 'Yokai (makhluk supernatural Jepang) berasal dari berbagai sumber. Asal usul yokai yang berasal dari rasa malu dan frustrasi manusia disebut apa?',
    questionEn: 'Japanese yokai (supernatural creatures) come from various sources. Yokai that originate from human shame and frustration are called what?',
    options: [
      'Obake',
      'Tsukumogami',
      'Oni',
      'Bakemono',
    ],
    optionsEn: [
      'Obake',
      'Tsukumogami',
      'Oni',
      'Bakemono',
    ],
    correctIndex: 1,
  ),
  // 38
  QuizQuestion(
    question: 'Tsukumogami adalah jenis yokai yang muncul dari benda-benda yang berusia seratus tahun. Contoh yang terkenal adalah apa?',
    questionEn: 'Tsukumogami are yokai born from objects that reach 100 years old. What is a famous example?',
    options: [
      'Umi-bōzu (gelembung laut)',
      'Ō-nyūdō (biarawan raksasa)',
      'Karakasa-obake (payung hantu)',
      'Nurarihyon (kepala bulat)',
    ],
    optionsEn: [
      'Umi-bōzu (sea bubble)',
      'Ō-nyūdō (giant monk)',
      'Karakasa-obake (umbrella ghost)',
      'Nurarihyon (round-headed)',
    ],
    correctIndex: 2,
  ),
  // 39
  QuizQuestion(
    question: 'Hiruzen Sarutobi dari Naruto terinspirasi dari legenda Jepang. Namun, asal usul kata "onifrom" oni dalam mitologi terkait dengan apa?',
    questionEn: 'In mythology, the word "oni" is associated with what origin?',
    options: [
      'Dari benda-benda rusak',
      'Dari roh orang yang meninggal tanpa penguburan',
      'Dari hewan liar yang berubah bentuk',
      'Dari para dewa yang diusir dari surga',
    ],
    optionsEn: [
      'From broken objects',
      'From spirits of those who died without burial',
      'From wild animals that shape-shifted',
      'From gods banished from heaven',
    ],
    correctIndex: 1,
  ),
  // 40
  QuizQuestion(
    question: 'Ritual kebersihan Shinto (misogi) melibatkan air dingin. Berdasarkan mitos penciptaan, siapa yang melakukan misogi pertama kali?',
    questionEn: 'Shinto purification rituals (misogi) involve cold water. Based on the creation myth, who performed misogi first?',
    options: [
      'Amaterasu',
      'Susanoo',
      'Izanagi',
      'Ninigi',
    ],
    optionsEn: [
      'Amaterasu',
      'Susanoo',
      'Izanagi',
      'Ninigi',
    ],
    correctIndex: 2,
  ),
  // 41
  QuizQuestion(
    question: 'Ketika Izanagi melakukan ritual pembersihan diri, pakaian yang dilepasnya berubah menjadi dewa. Apa yang menjadi dewa dari ikat pinggang (obi) Izanagi?',
    questionEn: 'When Izanagi performed purification, his discarded clothing became deities. What deity came from Izanagi\'s sash (obi)?',
    options: [
      'Tsukuyomi',
      'Miketsu-no-Kami',
      'Amaterasu',
      'Wakumusubi',
    ],
    optionsEn: [
      'Tsukuyomi',
      'Miketsu-no-Kami',
      'Amaterasu',
      'Wakumusubi',
    ],
    correctIndex: 1,
  ),
  // 42
  QuizQuestion(
    question: 'Ketika Izanagi membersihkan diri, rok (hakama) yang dilepasnya menjadi dewa apa?',
    questionEn: 'When Izanagi purified himself, his discarded skirt (hakama) became which deity?',
    options: [
      'Miketsu-no-Kami',
      'Mizuhanome',
      'Ōgetsu-hime',
      'Kami-shikome',
    ],
    optionsEn: [
      'Miketsu-no-Kami',
      'Mizuhanome',
      'Ōgetsu-hime',
      'Kami-shikome',
    ],
    correctIndex: 1,
  ),
  // 43
  QuizQuestion(
    question: 'Pada saat Kojiki ditulis, siapa yang ditugaskan oleh Kaisar Gemmei untuk menyusunnya?',
    questionEn: 'When the Kojiki was compiled, who was commissioned by Emperor Gemmei to write it?',
    options: [
      'Fujiwara no Fuhito',
      'Ō no Yasumaro',
      'Hayashi Razan',
      'Ban Nobutomo',
    ],
    optionsEn: [
      'Fujiwara no Fuhito',
      'Ō no Yasumaro',
      'Hayashi Razan',
      'Ban Nobutomo',
    ],
    correctIndex: 1,
  ),
  // 44
  QuizQuestion(
    question: 'Ashihara no Nakatsukuni (Tanah Tengah Kepulauan Reed) adalah nama lain untuk apa dalam mitologi Jepang?',
    questionEn: 'Ashihara no Nakatsukuni (Land of the Reed Plains) is another name for what in Japanese mythology?',
    options: [
      'Takamagahara (Dataran Tinggi Surga)',
      'Dunia manusia yang diperintah oleh Ninigi',
      'Yomi (Dunia Bawah)',
      'Pulau Takachiho',
    ],
    optionsEn: [
      'Takamagahara (High Plain of Heaven)',
      'The human world ruled by Ninigi',
      'Yomi (the Underworld)',
      'Takachiho Island',
    ],
    correctIndex: 1,
  ),
  // 45
  QuizQuestion(
    question: 'Susanoo diturunkan ke dunia manusia sebagai hukuman. Di mana ia mendarat dan mulai berpetualang?',
    questionEn: 'Susanoo was banished to the human world as punishment. Where did he land and begin his adventures?',
    options: [
      'Izu',
      'Izumo',
      'Kumano',
      'Yamato',
    ],
    optionsEn: [
      'Izu',
      'Izumo',
      'Kumano',
      'Yamato',
    ],
    correctIndex: 1,
  ),
  // 46
  QuizQuestion(
    question: 'Susanoo bertemu dengan pasangan tua (Ashinazuchi dan Tenazuchi) yang menangis karena putri mereka akan dimakan Yamata no Orochi. Berapa putri mereka?',
    questionEn: 'Susanoo met an elderly couple (Ashinazuchi and Tenazuchi) weeping because their daughter would be eaten by Yamata no Orochi. How many daughters did they have?',
    options: [
      'Satu',
      'Dua',
      'Tiga',
      'Empat',
    ],
    optionsEn: [
      'One',
      'Two',
      'Three',
      'Four',
    ],
    correctIndex: 2,
  ),
  // 47
  QuizQuestion(
    question: 'Pedang Kusanagi no Tsurugi adalah salah satu dari Tiga Regalia Kekaisaran. Regalia ini sekarang disimpan di mana?',
    questionEn: 'The Kusanagi no Tsurugi is one of the Three Imperial Regalia. Where is this regalia currently kept?',
    options: [
      'Istana Kekaisaran Tokyo',
      'Kuil Atsuta di Nagoya',
      'Kuil Ise',
      'Istana Kyoto',
    ],
    optionsEn: [
      'Imperial Palace Tokyo',
      'Atsuta Shrine in Nagoya',
      'Ise Shrine',
      'Kyoto Imperial Palace',
    ],
    correctIndex: 1,
  ),
  // 48
  QuizQuestion(
    question: 'Kojiki mencatat bahwa Susanoo memiliki nama penuh yang sangat panjang. Apa nama penuh Susanoo di Takamagahara sebelum diusir?',
    questionEn: 'The Kojiki records Susanoo\'s very long birth name. What was Susanoo\'s full name in Takamagahara before being banished?',
    options: [
      'Ame-no-Oshihomimi-no-Mikoto',
      'Takehaya Susanoo-no-Mikoto',
      'Ame-no-hohi-no-Mikoto',
      'Ame-no-wakahiko-no-Mikoto',
    ],
    optionsEn: [
      'Ame-no-Oshihomimi-no-Mikoto',
      'Takehaya Susanoo-no-Mikoto',
      'Ame-no-hohi-no-Mikoto',
      'Ame-no-wakahiko-no-Mikoto',
    ],
    correctIndex: 1,
  ),
  // 49
  QuizQuestion(
    question: 'Dalam Nihon Shoki, bagaimana nasib dewa makanan Uke Mochi berbeda dengan versi Kojiki?',
    questionEn: 'In the Nihon Shoki, how does the fate of the food goddess Uke Mochi differ from the Kojiki version?',
    options: [
      'Nihon Shoki: Uke Mochi hidup; Kojiki: dibunuh',
      'Nihon Shoki: dibunuh oleh Tsukuyomi; Kojiki: dibunuh oleh Amaterasu',
      'Nihon Shoki: dibunuh oleh Amaterasu; Kojiki: dibunuh oleh Tsukuyomi',
      'Nihon Shoki: Uke Mochi membunuh Tsukuyomi; Kojiki: sebaliknya',
    ],
    optionsEn: [
      'Nihon Shoki: Uke Mochi lives; Kojiki: killed',
      'Nihon Shoki: killed by Tsukuyomi; Kojiki: killed by Amaterasu',
      'Nihon Shoki: killed by Amaterasu; Kojiki: killed by Tsukuyomi',
      'Nihon Shoki: Uke Mochi kills Tsukuyomi; Kojiki: the reverse',
    ],
    correctIndex: 2,
  ),
  // 50
  QuizQuestion(
    question: 'Izanagi mengejar Izanami ke Yomi tetapi gagal membawanya kembali. Setelah itu, ia melemparkan tongkat keramat ke tanah. Apa yang muncul dari pukulan tongkat tersebut?',
    questionEn: 'Izanagi chased Izanami to Yomi but failed to bring her back. He then threw his sacred staff to the ground. What emerged from the staff\'s impact?',
    options: [
      'Sungai pertama Jepang',
      'Gunung pertama Jepang',
      'Delapan dewa keberuntungan',
      'Tiga belas dewa',
    ],
    optionsEn: [
      'Japan\'s first river',
      'Japan\'s first mountain',
      'Eight lucky gods',
      'Thirteen deities',
    ],
    correctIndex: 3,
  ),
];
