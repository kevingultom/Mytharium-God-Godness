import '../models/quiz_question_model.dart';

final List<QuizQuestion> chineseQuizData = [
  // 1
  QuizQuestion(
    question: 'Dalam mitologi penciptaan Tiongkok, bagian tubuh Pangu mana yang menjadi matahari dan bulan?',
    questionEn: 'In Chinese creation mythology, which parts of Pangu\'s body became the sun and the moon?',
    options: [
      'Mata kanan menjadi matahari, mata kiri menjadi bulan',
      'Mata kiri menjadi matahari, mata kanan menjadi bulan',
      'Darah yang terbang ke langit menjadi matahari, cairan tubuh menjadi bulan',
      'Hati menjadi matahari, paru-paru menjadi bulan',
    ],
    optionsEn: [
      'Right eye became the sun, left eye became the moon',
      'Left eye became the sun, right eye became the moon',
      'Blood that flew upward became the sun, body fluids became the moon',
      'Heart became the sun, lungs became the moon',
    ],
    correctIndex: 1,
  ),
  // 2
  QuizQuestion(
    question: 'Menurut teks kuno Shan Hai Jing, Pangu harus berjalan berapa hari setelah menciptakan langit dan bumi sebelum ia mati?',
    questionEn: 'According to the ancient text Shan Hai Jing, how many days did Pangu walk after creating heaven and earth before he died?',
    options: [
      'Delapan belas ribu hari',
      'Sembilan ribu hari',
      'Empat puluh ribu hari',
      'Dua belas ribu hari',
    ],
    optionsEn: [
      'Eighteen thousand days',
      'Nine thousand days',
      'Forty thousand days',
      'Twelve thousand days',
    ],
    correctIndex: 0,
  ),
  // 3
  QuizQuestion(
    question: 'Siapa yang membantu Nuwa dalam memperbaiki langit yang retak setelah pertempuran antara Zhurong dan Gong Gong?',
    questionEn: 'Who helped Nuwa repair the cracked sky after the battle between Zhurong and Gong Gong?',
    options: [
      'Fuxi',
      'Tidak ada — Nuwa bekerja sendirian dengan mencairkan lima batu berwarna',
      'Shennong',
      'Yama Raja',
    ],
    optionsEn: [
      'Fuxi',
      'No one — Nuwa worked alone by melting five colored stones',
      'Shennong',
      'King Yama',
    ],
    correctIndex: 1,
  ),
  // 4
  QuizQuestion(
    question: 'Dalam legenda, tubuh Fuxi dan Nuwa digambarkan menyerupai ular. Berapa kaki ular tersebut?',
    questionEn: 'In the legends, the bodies of Fuxi and Nuwa are depicted as serpentine. How many legs did the serpents have?',
    options: [
      'Dua',
      'Empat',
      'Tidak ada kaki',
      'Enam',
    ],
    optionsEn: [
      'Two',
      'Four',
      'No legs',
      'Six',
    ],
    correctIndex: 1,
  ),
  // 5
  QuizQuestion(
    question: 'Kaisar Kuning (Huangdi) dikreditkan dengan menemukan apa yang menjadi fondasi pengobatan tradisional Tiongkok?',
    questionEn: 'The Yellow Emperor (Huangdi) is credited with founding what text that became the foundation of traditional Chinese medicine?',
    options: [
      'Shang Han Lun',
      'Huangdi Neijing (Kanoner Kaisar Kuning)',
      'Ben Cao Gang Mu',
      'Dao De Jing',
    ],
    optionsEn: [
      'Shang Han Lun',
      'Huangdi Neijing (The Yellow Emperor\'s Classic of Internal Medicine)',
      'Ben Cao Gang Mu',
      'Dao De Jing',
    ],
    correctIndex: 1,
  ),
  // 6
  QuizQuestion(
    question: 'Siapakah istrinya Huangdi yang mengajarkan kepada manusia tentang meramal nasib dengan cacing sutra?',
    questionEn: 'Who was the wife of Huangdi who taught humans about divination using silkworms?',
    options: [
      'Xi Wangmu (Ratu Barat)',
      'Leizu (Lei Zu)',
      'Chang\'e',
      'Ma Gu',
    ],
    optionsEn: [
      'Queen Mother of the West (Xi Wangmu)',
      'Leizu (Lei Zu)',
      'Chang\'e',
      'Ma Gu',
    ],
    correctIndex: 1,
  ),
  // 7
  QuizQuestion(
    question: 'Pertempuran Zhuolu antara Huangdi dan Chiyou dikenal karena Huangdi menggunakan benda apa untuk mengalahkan Chiyou?',
    questionEn: 'In the Battle of Zhuolu between Huangdi and Chiyou, what instrument did Huangdi reportedly use to defeat Chiyou?',
    options: [
      'Gong perang perunggu',
      'Tambur Chi You yang terbuat dari kaki monster',
      'Pedang obsidian',
      'Lonceng jangkrik perak',
    ],
    optionsEn: [
      'Bronze war drum',
      'The Chiyou drum made from monster legs',
      'Obsidian sword',
      'Silver cricket bell',
    ],
    correctIndex: 1,
  ),
  // 8
  QuizQuestion(
    question: 'Chiyou digambarkan memiliki berapa kepala menurut beberapa versi kuno?',
    questionEn: 'Chiyou is depicted as having how many heads according to some ancient versions?',
    options: [
      'Tiga',
      'Tujuh',
      'Enam',
      'Delapan',
    ],
    optionsEn: [
      'Three',
      'Seven',
      'Six',
      'Eight',
    ],
    correctIndex: 2,
  ),
  // 9
  QuizQuestion(
    question: 'Dalam kitab Shan Hai Jing, Gun mencoba membendung banjir dengan menggunakan apa yang disebut?',
    questionEn: 'In the Shan Hai Jing, what was the name of the substance Gun used to try to dam the floods?',
    options: [
      'Xirang (tanah ajaib yang mengembang)',
      'Tuhan Emas',
      'Batu Giok Suci',
      'Rambut Naga Suci',
    ],
    optionsEn: [
      'Xirang (self-expanding magical soil)',
      'Golden Soil',
      'Holy Jade Stone',
      'Sacred Dragon Hair',
    ],
    correctIndex: 0,
  ),
  // 10
  QuizQuestion(
    question: 'Yu Agung menaklukkan banjir dengan cara apa yang membedakannya dari ayahnya Gun?',
    questionEn: 'How did Yu the Great conquer the floods, distinguishing himself from his father Gun?',
    options: [
      'Membangun tembok batu raksasa di sepanjang Sungai Kuning',
      'Membuka saluran air dan mengalirkan air ke laut',
      'Memanggil naga-naga untuk menelan air',
      'Menggunakan sihir air dari surga',
    ],
    optionsEn: [
      'Built giant stone walls along the Yellow River',
      'Opened channels and directed water to the sea',
      'Summoned dragons to swallow the water',
      'Used heavenly water magic',
    ],
    correctIndex: 1,
  ),
  // 11
  QuizQuestion(
    question: 'Legenda mengatakan bahwa selama bekerja keras mengendalikan banjir, Yu Agung melewati pintu mana tanpa masuk ke rumahnya?',
    questionEn: 'Legend says that while working tirelessly to control the floods, Yu the Great passed through which of his doors without ever entering his house?',
    options: [
      'Pintu depan tiga kali',
      'Pintu samping sekali',
      'Pintu belakang dua kali',
      'Tidak ada yang benar',
    ],
    optionsEn: [
      'The front door three times',
      'The side door once',
      'The back door twice',
      'None of these',
    ],
    correctIndex: 0,
  ),
  // 12
  QuizQuestion(
    question: 'Menurut tradisi, Sun Wukong lahir dari apa yang muncul dari batu gunung yang sudah tua dan suci?',
    questionEn: 'According to tradition, Sun Wukong was born from what emerged from an ancient sacred mountain stone?',
    options: [
      'Sebuah telur emas',
      'Seekor kera batu yang terlahir dari energi langit dan bumi',
      'Sebuah permata giok hidup',
      'Putra Kaisar Langit yang diasingkan',
    ],
    optionsEn: [
      'A golden egg',
      'A stone monkey born from the energies of heaven and earth',
      'A living jade gem',
      'An exiled son of the Jade Emperor',
    ],
    correctIndex: 1,
  ),
  // 13
  QuizQuestion(
    question: 'Sun Wukong mendapatkan gelar "Qitian Dasheng" dari Kaisar Langit. Apa arti gelar tersebut?',
    questionEn: 'Sun Wukong received the title "Qitian Dasheng" from the Jade Emperor. What does this title mean?',
    options: [
      'Raja Kera Suci',
      'Sama Hebat dengan Langit',
      'Penguasa Segala Gunung',
      'Ksatria Emas Abadi',
    ],
    optionsEn: [
      'Holy Monkey King',
      'Great Sage Equal to Heaven',
      'Lord of All Mountains',
      'Immortal Golden Knight',
    ],
    correctIndex: 1,
  ),
  // 14
  QuizQuestion(
    question: 'Dalam "Perjalanan ke Barat", berapa batas kelahiran kematian yang berhasil dihapus Sun Wukong dari buku kematian?',
    questionEn: 'In "Journey to the West," Sun Wukong erased the entries for what number of lifespans from the Book of Death?',
    options: [
      'Tiga ratus',
      'Seratus lima puluh',
      'Dua ratus delapan puluh sembilan',
      'Empat ratus sembilan puluh sembilan',
    ],
    optionsEn: [
      'Three hundred',
      'One hundred and fifty',
      'Two hundred and eighty-nine',
      'Four hundred and ninety-nine',
    ],
    correctIndex: 2,
  ),
  // 15
  QuizQuestion(
    question: 'Nezha dilahirkan setelah berapa lama kehamilan ibunya, Li Jing?',
    questionEn: 'Nezha was born after how long a gestation period for his mother, Li Jing?',
    options: [
      'Sembilan bulan',
      'Tiga tahun enam bulan',
      'Satu tahun',
      'Enam tahun',
    ],
    optionsEn: [
      'Nine months',
      'Three years and six months',
      'One year',
      'Six years',
    ],
    correctIndex: 1,
  ),
  // 16
  QuizQuestion(
    question: 'Saat lahir, Nezha terlahir dari apa?',
    questionEn: 'When Nezha was born, what did he emerge from?',
    options: [
      'Sebuah telur raksasa',
      'Sebuah bola daging',
      'Sungai melahirkan ia dari buih',
      'Sebuah batu kristal',
    ],
    optionsEn: [
      'A giant egg',
      'A flesh ball',
      'The river birthed him from foam',
      'A crystal stone',
    ],
    correctIndex: 1,
  ),
  // 17
  QuizQuestion(
    question: 'Erlang Shen memiliki ketiga mata yang terkenal. Mata ketiganya terletak di mana?',
    questionEn: 'Erlang Shen is famous for his third eye. Where is his third eye located?',
    options: [
      'Di tengah punggung tangannya',
      'Di dahi, di antara dua mata lainnya',
      'Di tengah telapak kakinya',
      'Di sisi lehernya',
    ],
    optionsEn: [
      'In the center of the back of his hand',
      'On his forehead, between his other two eyes',
      'In the center of the sole of his foot',
      'On the side of his neck',
    ],
    correctIndex: 1,
  ),
  // 18
  QuizQuestion(
    question: 'Menurut tradisi, Erlang Shen memiliki hewan peliharaan apa yang membantunya dalam pertempuran?',
    questionEn: 'According to tradition, what pet animal does Erlang Shen have that assists him in battle?',
    options: [
      'Singa emas',
      'Anjing sakti yang bisa mendeteksi kebohongan',
      'Harimau putih',
      'Kuda terbang',
    ],
    optionsEn: [
      'Golden lion',
      'A divine dog that can detect lies',
      'White tiger',
      'Flying horse',
    ],
    correctIndex: 1,
  ),
  // 19
  QuizQuestion(
    question: 'Siapakah Raja Naga Laut Timur dari empat Raja Naga?',
    questionEn: 'Who is the Dragon King of the East Sea among the Four Dragon Kings?',
    options: [
      'Ao Qin',
      'Ao Run',
      'Ao Guang',
      'Ao Shun',
    ],
    optionsEn: [
      'Ao Qin',
      'Ao Run',
      'Ao Guang',
      'Ao Shun',
    ],
    correctIndex: 2,
  ),
  // 20
  QuizQuestion(
    question: 'Nama Asura Raja yang mengguncang istana Kaisar Langit dan memaksa Kaisar melarikan diri menurut mitos tentang Sun Wukong?',
    questionEn: 'Which Asura King shook the Heavenly Palace and forced the Jade Emperor to flee, according to Sun Wukong mythology?',
    options: [
      'Ravana',
      'Hundun',
      'Sun Wukong sendiri — tidak ada Asura King',
      'Erlang Shen',
    ],
    optionsEn: [
      'Ravana',
      'Hundun',
      'Sun Wukong himself — no Asura King',
      'Erlang Shen',
    ],
    correctIndex: 2,
  ),
  // 21
  QuizQuestion(
    question: 'Di antara Delapan Sembilan (Baxian), siapa yang memainkan alat musik yang terbuat dari bambu dua ruas?',
    questionEn: 'Among the Eight Immortals (Baxian), who plays a musical instrument made of two bamboo sections?',
    options: [
      'Lü Dongbin',
      'Han Xiangzi',
      'He Xiangu',
      'Cao Guojiu',
    ],
    optionsEn: [
      'Lü Dongbin',
      'Han Xiangzi',
      'He Xiangu',
      'Cao Guojiu',
    ],
    correctIndex: 1,
  ),
  // 22
  QuizQuestion(
    question: 'Delapan Sembilan terkenal menyeberangi Laut Timur. Apa yang digunakan Lü Dongbin untuk menyeberangi lautan?',
    questionEn: 'The Eight Immortals famously crossed the Eastern Sea. What did Lü Dongbin use to cross the ocean?',
    options: [
      'Perahu kecil',
      'Pedangnya yang terbang',
      'Kipas sakti',
      'Tongkat ajaib',
    ],
    optionsEn: [
      'A small boat',
      'His flying sword',
      'A magical fan',
      'A magic staff',
    ],
    correctIndex: 1,
  ),
  // 23
  QuizQuestion(
    question: 'Chang\'e naik ke bulan setelah menelan obat keabadian. Siapa yang mencuri obat keabadian tersebut dari harta suaminya Hou Yi?',
    questionEn: 'Chang\'e ascended to the moon after swallowing the elixir of immortality. Who tried to steal the elixir from her husband Hou Yi\'s treasury?',
    options: [
      'Peng Meng — murid Hou Yi yang memberontak',
      'Feng Hou — penasihat Kaisar',
      'Gun — ayah Yu Agung',
      'Lei Gong — Dewa Petir',
    ],
    optionsEn: [
      'Peng Meng — Hou Yi\'s rebellious disciple',
      'Feng Hou — the Emperor\'s advisor',
      'Gun — Yu the Great\'s father',
      'Lei Gong — the Thunder God',
    ],
    correctIndex: 0,
  ),
  // 24
  QuizQuestion(
    question: 'Meng Po bertugas di Dunia Bawah untuk melakukan apa kepada jiwa-jiwa yang akan bereinkarnasi?',
    questionEn: 'What does Meng Po do to souls about to be reincarnated in the Underworld?',
    options: [
      'Menghukum mereka dengan cambuk api',
      'Menghapus ingatan mereka dengan sup supaya mereka lupa kehidupan masa lalu',
      'Mengubah bentuk mereka menjadi hewan',
      'Menilai perbuatan baik dan buruk mereka',
    ],
    optionsEn: [
      'Punishes them with a fire whip',
      'Erases their memories with soup so they forget their past life',
      'Transforms them into animals',
      'Judges their good and bad deeds',
    ],
    correctIndex: 1,
  ),
  // 25
  QuizQuestion(
    question: 'Mazu, dewi pelindung pelaut, lahir dari keluarga di provinsi mana?',
    questionEn: 'Mazu, the patron goddess of seafarers, was born into a family in which province?',
    options: [
      'Guangdong',
      'Fujian',
      'Zhejiang',
      'Hainan',
    ],
    optionsEn: [
      'Guangdong',
      'Fujian',
      'Zhejiang',
      'Hainan',
    ],
    correctIndex: 1,
  ),
  // 26
  QuizQuestion(
    question: 'Nama lahir Mazu (dewi pelindung laut) adalah apa?',
    questionEn: 'What was Mazu\'s (the sea patron goddess) birth name?',
    options: [
      'Lin Mo Niang',
      'Lin Mo (Lin Mong)',
      'Mei Zu',
      'Xian Nu',
    ],
    optionsEn: [
      'Lin Mo Niang',
      'Lin Mo',
      'Mei Zu',
      'Xian Nu',
    ],
    correctIndex: 1,
  ),
  // 27
  QuizQuestion(
    question: 'Zhong Kui, pembasmi setan, dikenal dengan status apa yang ia miliki setelah kematiannya?',
    questionEn: 'Zhong Kui, the demon queller, is known for what status he held after his death?',
    options: [
      'Dewa Kekayaan',
      'Pemburu Hantu Agung dari Alam Bawah',
      'Raja Surga Ketiga',
      'Pahlawan Kaisar Kuning',
    ],
    optionsEn: [
      'God of Wealth',
      'Great Ghost Hunter of the Underworld',
      'King of the Third Heaven',
      'Hero of the Yellow Emperor',
    ],
    correctIndex: 1,
  ),
  // 28
  QuizQuestion(
    question: 'Menurut tradisi, Zhong Kui bunuh diri karena apa?',
    questionEn: 'According to tradition, why did Zhong Kui commit suicide?',
    options: [
      'Karena kalah bertarung dari naga laut',
      'Karena dihina dan dicerca penampilannya saat ujian kekaisaran meskipun nilainya sempurna',
      'Karena diusir dari istana oleh Kaisar Langit',
      'Karena gagal mengendalikan hantu-hantu',
    ],
    optionsEn: [
      'Because he lost a fight against a sea dragon',
      'Because he was insulted for his appearance during the imperial examination despite perfect scores',
      'Because he was banished from the palace by the Jade Emperor',
      'Because he failed to control the ghosts',
    ],
    correctIndex: 1,
  ),
  // 29
  QuizQuestion(
    question: 'Dewa Dapur (Zao Jun) dilaporkan melaporkan tentang keluarga manusia kepada siapa setiap tahun?',
    questionEn: 'The Kitchen God (Zao Jun) is said to report about human families to whom each year?',
    options: [
      'Yama Raja di Alam Bawah',
      'Kaisar Langit di Surga',
      'Huangdi di dunia manusia',
      'Xi Wangmu di Gunung Kunlun',
    ],
    optionsEn: [
      'King Yama in the Underworld',
      'The Jade Emperor in Heaven',
      'Huangdi in the human world',
      'Queen Mother of the West on Mount Kunlun',
    ],
    correctIndex: 1,
  ),
  // 30
  QuizQuestion(
    question: 'Menurut tradisi, agar Dewa Dapur tidak melaporkan hal buruk, keluarga Tionghoa menempelkan apa di mulut patungnya sebelum festival musim semi?',
    questionEn: 'According to tradition, to prevent the Kitchen God from reporting bad things, what did Chinese families stick on the mouth of his statue before the Spring Festival?',
    options: [
      'Garam',
      'Gula permen malt (malt candy)',
      'Minyak wijen',
      'Air suci',
    ],
    optionsEn: [
      'Salt',
      'Malt candy',
      'Sesame oil',
      'Holy water',
    ],
    correctIndex: 1,
  ),
  // 31
  QuizQuestion(
    question: 'Dalam hierarki surgawi Daois, siapa yang berada tepat di bawah Kaisar Langit (Yuhuang Dadi)?',
    questionEn: 'In the Daoist celestial hierarchy, who is positioned directly below the Jade Emperor (Yuhuang Dadi)?',
    options: [
      'Xuanwu Agung',
      'Taiyi Jiuku Tianzun (Taiyi Cinta Universal yang Menyelamatkan Penderitaan)',
      'Xi Wangmu',
      'Guan Yu',
    ],
    optionsEn: [
      'The Great Xuanwu',
      'Taiyi Jiuku Tianzun (Universal Salvation from Suffering)',
      'Queen Mother of the West',
      'Guan Yu',
    ],
    correctIndex: 1,
  ),
  // 32
  QuizQuestion(
    question: 'Dalam sistem Pengadilan Sepuluh Alam Bawah Tiongkok, Dewa Yama Agung pertama memerintah pengadilan keberapa?',
    questionEn: 'In the Chinese Ten Courts of Hell system, which court does the Great King Yama preside over?',
    options: [
      'Pengadilan pertama',
      'Pengadilan kelima',
      'Pengadilan ketujuh',
      'Pengadilan kesepuluh',
    ],
    optionsEn: [
      'The first court',
      'The fifth court',
      'The seventh court',
      'The tenth court',
    ],
    correctIndex: 0,
  ),
  // 33
  QuizQuestion(
    question: 'Pengadilan keenam di Dunia Bawah Tiongkok menghukum jiwa-jiwa karena dosa apa?',
    questionEn: 'In the sixth court of the Chinese Underworld, what sin are souls punished for?',
    options: [
      'Dosa pembunuhan',
      'Dosa kemarahan dan kebrutalan',
      'Dosa pemberontakan',
      'Dosa keserakahan',
    ],
    optionsEn: [
      'Sin of murder',
      'Sin of wrath and brutality',
      'Sin of rebellion',
      'Sin of greed',
    ],
    correctIndex: 1,
  ),
  // 34
  QuizQuestion(
    question: 'Menurut mitologi zodiak Tiongkok, mengapa kucing tidak termasuk dalam dua belas hewan zodiak?',
    questionEn: 'According to Chinese zodiac mythology, why is the cat not included among the twelve zodiac animals?',
    options: [
      'Karena kucing terlalu kecil untuk dianggap sebagai hewan zodiak',
      'Karena tikus menipu kucing sehingga bangun terlambat dan melewati undangan Kaisar',
      'Karena kucing menolak tawaran menjadi hewan zodiak',
      'Karena kucing tidak bisa ditemukan oleh utusan Kaisar',
    ],
    optionsEn: [
      'Because the cat was too small to be considered a zodiac animal',
      'Because the rat tricked the cat into oversleeping and missing the Emperor\'s invitation',
      'Because the cat declined the offer to be a zodiac animal',
      'Because the cat could not be found by the Emperor\'s messenger',
    ],
    correctIndex: 1,
  ),
  // 35
  QuizQuestion(
    question: 'Menurut mitos asal zodiak Tiongkok, hewan apa yang menyeberangi sungai pertama dan menjadi urutan pertama zodiak?',
    questionEn: 'According to Chinese zodiac origin myths, which animal crossed the river first and became the first in the zodiac order?',
    options: [
      'Harimau',
      'Babi',
      'Kerbau',
      'Tikus',
    ],
    optionsEn: [
      'Tiger',
      'Pig',
      'Ox',
      'Rat',
    ],
    correctIndex: 3,
  ),
  // 36
  QuizQuestion(
    question: 'Dalam mitos, Naga Utara (Xuanwu) memiliki bentuk gabungan dari kura-kura dan hewan apa?',
    questionEn: 'In mythology, the Northern Dragon (Xuanwu) has a combined form of a tortoise and which other animal?',
    options: [
      'Ular',
      'Ikan',
      'Burung',
      'Kucing',
    ],
    optionsEn: [
      'Snake',
      'Fish',
      'Bird',
      'Cat',
    ],
    correctIndex: 0,
  ),
  // 37
  QuizQuestion(
    question: 'Fenghuang (burung mitis Tiongkok) digambarkan memiliki tubuh yang merupakan gabungan dari tubuh hewan-hewan apa?',
    questionEn: 'The Fenghuang (Chinese mythical bird) is depicted with a body composed of parts from which animals?',
    options: [
      'Elang, singa, naga, dan serigala',
      'Ikan, ular, kambing, dan macan tutul',
      'Ayam jantan, burung hantu, elang, ular, dan ikan',
      'Merak, burung camar, burung hantu, dan kuda',
    ],
    optionsEn: [
      'Eagle, lion, dragon, and wolf',
      'Fish, snake, goat, and leopard',
      'Rooster, owl, eagle, snake, and fish',
      'Peacock, seagull, owl, and horse',
    ],
    correctIndex: 2,
  ),
  // 38
  QuizQuestion(
    question: 'Qilin, makhluk mitis Tiongkok, memiliki sisar di bagian tubuh mana?',
    questionEn: 'The Qilin, a Chinese mythical creature, has scales on which part of its body?',
    options: [
      'Di seluruh tubuhnya',
      'Hanya di punggung dan ekornya',
      'Hanya di kakinya',
      'Di leher dan kepalanya',
    ],
    optionsEn: [
      'All over its body',
      'Only on its back and tail',
      'Only on its legs',
      'On its neck and head',
    ],
    correctIndex: 1,
  ),
  // 39
  QuizQuestion(
    question: 'Menurut kepercayaan, Qilin hanya muncul untuk menyambut lahirnya siapa?',
    questionEn: 'According to belief, the Qilin only appears to welcome the birth of whom?',
    options: [
      'Pahlawan militer',
      'Sage atau raja bijaksana',
      'Dewa perang',
      'Ratu kecantikan',
    ],
    optionsEn: [
      'Military heroes',
      'A sage or wise king',
      'Gods of war',
      'Queens of beauty',
    ],
    correctIndex: 1,
  ),
  // 40
  QuizQuestion(
    question: 'Cheng Huang (Dewa Kota) pada awalnya adalah gelar untuk apa?',
    questionEn: 'Cheng Huang (City God) was originally a title for what?',
    options: [
      'Penguasa kota kuno yang dibangun dari tanah liat',
      'Dinding dan parit kota yang melindungi penduduk',
      'Bunga-bunga yang tumbuh di dalam kota',
      'Guru yang mengajar di sekolah kota',
    ],
    optionsEn: [
      'Ancient rulers of cities built from clay',
      'The walls and moats of a city that protect its inhabitants',
      'Flowers that grow inside the city',
      'Teachers who taught in city schools',
    ],
    correctIndex: 1,
  ),
  // 41
  QuizQuestion(
    question: 'Cowherd and Weaver Girl (Niulang dan Zhinü) dipisahkan oleh sungai apa di langit?',
    questionEn: 'The Cowherd and Weaver Girl (Niulang and Zhinü) are separated by which river in the sky?',
    options: [
      'Sungai Kuning',
      'Sungai Gangga',
      'Sungai Galaksi atau Bima Sakti',
      'Sungai Amazon',
    ],
    optionsEn: [
      'The Yellow River',
      'The Ganges',
      'The Milky Way',
      'The Amazon River',
    ],
    correctIndex: 2,
  ),
  // 42
  QuizQuestion(
    question: 'Menurut tradisi, Niulang dan Zhinü bertemu kembali sekali setiap tahun pada tanggal berapa dalam kalender lunar?',
    questionEn: 'According to tradition, Niulang and Zhinü meet once a year on which date in the lunar calendar?',
    options: [
      'Tanggal 15 bulan pertama',
      'Tanggal 7 bulan ketujuh (Qixi)',
      'Tanggal 8 bulan kedelapan',
      'Tanggal 14 bulan pertama',
    ],
    optionsEn: [
      'The 15th of the first month',
      'The 7th day of the 7th month (Qixi)',
      'The 8th day of the 8th month',
      'The 14th day of the first month',
    ],
    correctIndex: 1,
  ),
  // 43
  QuizQuestion(
    question: 'Dalam ajaran alkimia Tiongkok kuno, apa yang disebut "Wu Xing" (Lima Elemen) yang harus diseimbangkan untuk mencapai keabadian?',
    questionEn: 'In ancient Chinese alchemy, what are the "Wu Xing" (Five Elements) that must be balanced to achieve immortality?',
    options: [
      'Tanah, logam, cahaya, bayangan, dan angin',
      'Kayu, api, tanah, logam, dan air',
      'Batu, es, api, udara, dan cahaya',
      'Emas, perak, perunggu, besi, dan timah',
    ],
    optionsEn: [
      'Earth, metal, light, shadow, and wind',
      'Wood, fire, earth, metal, and water',
      'Stone, ice, fire, air, and light',
      'Gold, silver, bronze, iron, and tin',
    ],
    correctIndex: 1,
  ),
  // 44
  QuizQuestion(
    question: 'Siapakah dewa yang memimpin perang melawan para Dewa Tiga Klan dalam mitologi Daois?',
    questionEn: 'Who led the war against the Three Great Clan Lords in Daoist mythology?',
    options: [
      'Xuanwu',
      'Yama Raja',
      'Chiyou',
      'Hundun',
    ],
    optionsEn: [
      'Xuanwu',
      'King Yama',
      'Chiyou',
      'Hundun',
    ],
    correctIndex: 0,
  ),
  // 45
  QuizQuestion(
    question: 'Dalam teks "Dao De Jing", siapa yang menulis ajaran Daois tentang "Tao" (Jalan)?',
    questionEn: 'In the text "Dao De Jing," who wrote the Daoist teachings about the "Tao" (the Way)?',
    options: [
      'Confucius',
      'Laozi (Lao Tzu)',
      'Sima Qian',
      'Zhuangzi',
    ],
    optionsEn: [
      'Confucius',
      'Laozi (Lao Tzu)',
      'Sima Qian',
      'Zhuangzi',
    ],
    correctIndex: 1,
  ),
  // 46
  QuizQuestion(
    question: 'Hundun (Hundun) dalam mitologi Tiongkok, makhluk Chaos, memiliki wajah seperti apa?',
    questionEn: 'In Chinese mythology, Hundun (Chaos), is depicted as having a face like what?',
    options: [
      'Tidak memiliki wajah sama sekali',
      'Wajah manusia yang tersenyum',
      'Wajah dengan banyak mata dan telinga',
      'Wajah kosong tanpa fitur',
    ],
    optionsEn: [
      'No face at all',
      'A smiling human face',
      'A face with many eyes and ears',
      'A blank face without features',
    ],
    correctIndex: 2,
  ),
  // 47
  QuizQuestion(
    question: 'Raja Kui (Gong Gong) yang merusak tiang penyangga langit, merupakan makhluk apa?',
    questionEn: 'Gong Gong, the king who destroyed the pillar supporting heaven, is depicted as what kind of creature?',
    options: [
      'Seekor naga terbang',
      'Makhluk humanoid dengan kepala kerbau hitam',
      'Seekor singa api',
      'Sebuah monster laut',
    ],
    optionsEn: [
      'A flying dragon',
      'A humanoid creature with a black ox head',
      'A fire lion',
      'A sea monster',
    ],
    correctIndex: 1,
  ),
  // 48
  QuizQuestion(
    question: 'Menurut mitos Tiongkok, Gun berusaha membendung banjir selama berapa tahun sebelum dihukum oleh Kaisar Kuning?',
    questionEn: 'According to Chinese mythology, how many years did Gun try to dam the floods before being punished by the Yellow Emperor?',
    options: [
      'Delapan tahun',
      'Tiga tahun',
      'Sepuluh tahun',
      'Lima belas tahun',
    ],
    optionsEn: [
      'Eight years',
      'Three years',
      'Ten years',
      'Fifteen years',
    ],
    correctIndex: 0,
  ),
  // 49
  QuizQuestion(
    question: 'Dalam mitologi Tiongkok, Xi Wangmu (Ratu Barat) tinggal di gunung suci apa yang merupakan pintu masuk ke dunia abadi?',
    questionEn: 'In Chinese mythology, Queen Mother of the West (Xi Wangmu) resides on which sacred mountain that serves as a gateway to the immortal world?',
    options: [
      'Gunung Tai',
      'Gunung Kunlun',
      'Gunung Huashan',
      'Gunung Putuo',
    ],
    optionsEn: [
      'Mount Tai',
      'Mount Kunlun',
      'Mount Huashan',
      'Mount Putuo',
    ],
    correctIndex: 1,
  ),
  // 50
  QuizQuestion(
    question: 'Menurut legenda Tiongkok, siapa yang mencuri buah persik keabadian dari taman Xi Wangmu?',
    questionEn: 'According to Chinese legend, who stole the peaches of immortality from the garden of Xi Wangmu?',
    options: [
      'Sun Wukong (Raja Kera)',
      'Nezha',
      'Chang\'e',
      'Erlang Shen',
    ],
    optionsEn: [
      'Sun Wukong (the Monkey King)',
      'Nezha',
      'Chang\'e',
      'Erlang Shen',
    ],
    correctIndex: 0,
  ),
];
