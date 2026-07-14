import '../models/quiz_question_model.dart';

final List<QuizQuestion> nordicQuizData = [
  // 1
  QuizQuestion(
    question: 'Siapa yang menemukan rune menurut Edda?',
    questionEn: 'Who discovered the runes according to the Eddas?',
    options: ['Odin', 'Tyr', 'Heimdall', 'Loki'],
    optionsEn: ['Odin', 'Tyr', 'Heimdall', 'Loki'],
    correctIndex: 0,
  ),
  // 2
  QuizQuestion(
    question: 'Berapa lama Odin tergantung di Yggdrasil sebelum mendapatkan rahasia rune?',
    questionEn: 'How long did Odin hang on Yggdrasil before gaining the secret of the runes?',
    options: ['Tiga hari tiga malam', 'Sembilan hari sembilan malam', 'Tujuh hari tujuh malam', 'Dua belas hari dua belas malam'],
    optionsEn: ['Three days and three nights', 'Nine days and nine nights', 'Seven days and seven nights', 'Twelve days and twelve nights'],
    correctIndex: 1,
  ),
  // 3
  QuizQuestion(
    question: 'Siapa nama istri dari Skadi?',
    questionEn: 'Who was the wife of Skadi?',
    options: ['Njord', 'Bragi', 'Aegir', 'Niord'],
    optionsEn: ['Njord', 'Bragi', 'Aegir', 'Niord'],
    correctIndex: 0,
  ),
  // 4
  QuizQuestion(
    question: 'Siapa yang membunuh Baldr?',
    questionEn: 'Who killed Baldur?',
    options: ['Fenrir', 'Hodr dengan bantuan Loki', 'Jormungandr', 'Surtur'],
    optionsEn: ['Fenrir', 'Hodr with Loki\'s help', 'Jormungandr', 'Surtur'],
    correctIndex: 1,
  ),
  // 5
  QuizQuestion(
    question: 'Nama ayah dari Ymir dalam kosmologi Nordik?',
    questionEn: 'What is the name of Ymir\'s father in Norse cosmology?',
    options: ['Buri', 'Audhumla tidak memiliki suami', 'Ymir tidak memiliki ayah — ia lahir dari es dan api', 'Naglfar'],
    optionsEn: ['Buri', 'Audhumla had no husband', 'Ymir had no father — born from fire and ice', 'Naglfar'],
    correctIndex: 2,
  ),
  // 6
  QuizQuestion(
    question: 'Apa nama lembu yang merawat Ymir dalam kosmologi Nordik?',
    questionEn: 'What is the name of the cow that nourished Ymir in Norse cosmology?',
    options: ['Hildisvini', 'Audhumla', 'Hrimfaxi', 'Gullinkambi'],
    optionsEn: ['Hildisvini', 'Audhumla', 'Hrimfaxi', 'Gullinkambi'],
    correctIndex: 1,
  ),
  // 7
  QuizQuestion(
    question: 'Apa nama dua kekasih Freyja yang tinggal di dunia lain?',
    questionEn: 'What are the names of Freyja\'s two beloved who reside in other realms?',
    options: ['Hnoss dan Gersemi', 'Odr dan Hnoss', 'Otr dan Fafnir', 'Rerir dan Hreidmar'],
    optionsEn: ['Hnoss and Gersemi', 'Odr and Hnoss', 'Otr and Fafnir', 'Rerir and Hreidmar'],
    correctIndex: 1,
  ),
  // 8
  QuizQuestion(
    question: 'Berapa banyak kepala yang dimiliki Nidhogg?',
    questionEn: 'How many heads does Nidhogg have?',
    options: ['Satu', 'Tiga', 'Dua belas', 'Tujuh'],
    optionsEn: ['One', 'Three', 'Twelve', 'Seven'],
    correctIndex: 0,
  ),
  // 9
  QuizQuestion(
    question: 'Nama anjing yang menjaga gerbang Hel?',
    questionEn: 'What is the name of the hound that guards the gates of Hel?',
    options: ['Garmr', 'Fenrir', 'Hati', 'Managarmr'],
    optionsEn: ['Garmr', 'Fenrir', 'Hati', 'Managarmr'],
    correctIndex: 0,
  ),
  // 10
  QuizQuestion(
    question: 'Siapa yang mengajari Bragi tentang puisi?',
    questionEn: 'Who taught Bragi about poetry?',
    options: ['Odin', 'Kvasir', 'Mimir', 'Baugi'],
    optionsEn: ['Odin', 'Kvasir', 'Mimir', 'Baugi'],
    correctIndex: 1,
  ),
  // 11
  QuizQuestion(
    question: 'Apa nama sungai yang memisahkan dunia orang hidup dari dunia orang mati?',
    questionEn: 'What is the name of the river that separates the world of the living from the dead?',
    options: ['Gjoll', 'Ginnungagap', 'Vimur', 'Iving'],
    optionsEn: ['Gjoll', 'Ginnungagap', 'Vimur', 'Iving'],
    correctIndex: 0,
  ),
  // 12
  QuizQuestion(
    question: 'Berapa banyak leher yang dipotong Kvasir untuk membuat Madu Puisi?',
    questionEn: 'How many necks were severed from Kvasir to create the Mead of Poetry?',
    options: ['Dua', 'Empat', 'Satu', 'Tiga'],
    optionsEn: ['Two', 'Four', 'One', 'Three'],
    correctIndex: 0,
  ),
  // 13
  QuizQuestion(
    question: 'Siapa yang menangkap rusa dengan tangan kosong sebagai tugas untuk Loki?',
    questionEn: 'Who caught a deer with bare hands as a task for Loki?',
    options: ['Thialfe', 'Magni', 'Vali', 'Ull'],
    optionsEn: ['Thialfe', 'Magni', 'Vali', 'Ull'],
    correctIndex: 0,
  ),
  // 14
  QuizQuestion(
    question: 'Nama isteri Freyr yang direbut dari raksasa?',
    questionEn: 'What is the name of the wife of Freyr that was won from the giants?',
    options: ['Gerdr', 'Gersemi', 'Skadi', 'Iðunn'],
    optionsEn: ['Gerdr', 'Gersemi', 'Skadi', 'Iðunn'],
    correctIndex: 0,
  ),
  // 15
  QuizQuestion(
    question: 'Apa hewan peliharaan Freyja yang selalu menemaninya?',
    questionEn: 'What animal accompanies Freyja wherever she goes?',
    options: ['Dua kucing', 'Seekor rubah', 'Seekor gagak', 'Seekor kuda'],
    optionsEn: ['Two cats', 'A fox', 'A raven', 'A horse'],
    correctIndex: 0,
  ),
  // 16
  QuizQuestion(
    question: 'Siapa yang menempa rantai Gleipnir untuk mengikat Fenrir?',
    questionEn: 'Who forged the chain Gleipnir to bind Fenrir?',
    options: ['Para dwarf — Sons of Ivaldi', 'Itnar', 'Brokkr dan Eitri', 'Regin'],
    optionsEn: ['The dwarves — Sons of Ivaldi', 'Itnar', 'Brokkr and Eitri', 'Regin'],
    correctIndex: 0,
  ),
  // 17
  QuizQuestion(
    question: 'Apa nama kuda yang membawa Freyr ke pertempuran Ragnarok?',
    questionEn: 'What is the name of the steed that carries Freyr into battle at Ragnarok?',
    options: ['Hrimfaxi', 'Gullinbursti', 'Sleipnir', 'Skinfaxi'],
    optionsEn: ['Hrimfaxi', 'Gullinbursti', 'Sleipnir', 'Skinfaxi'],
    correctIndex: 1,
  ),
  // 18
  QuizQuestion(
    question: 'Siapa yang menggantikan Tyr sebagai dewa perang di Asgard?',
    questionEn: 'Who replaced Tyr as god of war in Asgard?',
    options: ['Thor', 'Odin', 'Ull', 'Tyr tidak digantikan'],
    optionsEn: ['Thor', 'Odin', 'Ull', 'Tyr was not replaced'],
    correctIndex: 1,
  ),
  // 19
  QuizQuestion(
    question: 'Siapa yang meracuni Baldr dengan mistletoe?',
    questionEn: 'Who poisoned Baldur with mistletoe?',
    options: ['Loki', 'Hodr', 'Kvasir', 'Vidar'],
    optionsEn: ['Loki', 'Hodr', 'Kvasir', 'Vidar'],
    correctIndex: 1,
  ),
  // 20
  QuizQuestion(
    question: 'Apa nama kapal perang para raksasa di Ragnarok?',
    questionEn: 'What is the name of the ship of the giants at Ragnarok?',
    options: ['Naglfar', 'Skidbladnir', 'Skirnir', 'Hringhorni'],
    optionsEn: ['Naglfar', 'Skidbladnir', 'Skirnir', 'Hringhorni'],
    correctIndex: 0,
  ),
  // 21
  QuizQuestion(
    question: 'Siapa yang mengajari Thor tentang kebijaksanaan?',
    questionEn: 'Who taught Thor about wisdom?',
    options: ['Odin', 'Loki', 'Mimir', 'Modi'],
    optionsEn: ['Odin', 'Loki', 'Mimir', 'Modi'],
    correctIndex: 2,
  ),
  // 22
  QuizQuestion(
    question: 'Apa nama empat ekor rusa yang menggigit Yggdrasil?',
    questionEn: 'What are the names of the four stags that gnaw on Yggdrasil?',
    options: ['Dain, Dvalin, Duneyr, Durathor', 'Dun, Dein, Dur, Dan', 'Ratatoskr, Nidhogg, Veorfelnir, Hræsvelgr', 'Modi, Magni, Vali, Vidar'],
    optionsEn: ['Dain, Dvalin, Duneyr, Durathor', 'Dun, Dein, Dur, Dan', 'Ratatoskr, Nidhogg, Veorfelnir, Hræsvelgr', 'Modi, Magni, Vali, Vidar'],
    correctIndex: 0,
  ),
  // 23
  QuizQuestion(
    question: 'Berapa banyak lembu yang muncul dari Ginnungagap?',
    questionEn: 'How many cows emerged from Ginnungagap?',
    options: ['Satu', 'Dua', 'Tiga', 'Empat'],
    optionsEn: ['One', 'Two', 'Three', 'Four'],
    correctIndex: 0,
  ),
  // 24
  QuizQuestion(
    question: 'Apa nama perisai Thor yang terbuat dari emas?',
    questionEn: 'What is the name of Thor\'s shield made of gold?',
    options: ['Ægishjálmur', 'Aegis', 'Bilskirnir', 'Iaunn'],
    optionsEn: ['Ægishjálmur', 'Aegis', 'Bilskirnir', 'Iaunn'],
    correctIndex: 3,
  ),
  // 25
  QuizQuestion(
    question: 'Siapa yang memberi nama untuk Yggdrasil?',
    questionEn: 'Who named Yggdrasil?',
    options: ['Nornen', 'Odin', 'Mimir', 'Völuspá'],
    optionsEn: ['The Norns', 'Odin', 'Mimir', 'Völuspá'],
    correctIndex: 0,
  ),
  // 26
  QuizQuestion(
    question: 'Apa nama mata air yang tersembunyi di bawah Yggdrasil?',
    questionEn: 'What is the name of the hidden spring beneath Yggdrasil?',
    options: ['Urðarbrunnr', 'Mímisbrunnr', 'Hvergelmir', 'Körmt'],
    optionsEn: ['Urðarbrunnr', 'Mímisbrunnr', 'Hvergelmir', 'Körmt'],
    correctIndex: 2,
  ),
  // 27
  QuizQuestion(
    question: 'Siapa ayah dari Magni, putra Thor?',
    questionEn: 'Who is the father of Magni, son of Thor?',
    options: ['Jord', 'Thor', 'Hymir', 'Modi'],
    optionsEn: ['Jord', 'Thor', 'Hymir', 'Modi'],
    correctIndex: 1,
  ),
  // 28
  QuizQuestion(
    question: 'Apa nama rusa milik Heimdall yang membunyikan terompetnya?',
    questionEn: 'What is the name of Heimdall\'s deer that sounds his horn?',
    options: ['Gold-tooth', 'Gullinkambi', 'Tanngrisnir', 'Gullintanni'],
    optionsEn: ['Gold-tooth', 'Gullinkambi', 'Tanngrisnir', 'Gullintanni'],
    correctIndex: 3,
  ),
  // 29
  QuizQuestion(
    question: 'Di mana Frigg tinggal di Asgard?',
    questionEn: 'Where does Frigg dwell in Asgard?',
    options: ['Fensalir', 'Bilskirnir', 'Himinbjorg', 'Sessrumnir'],
    optionsEn: ['Fensalir', 'Bilskirnir', 'Himinbjorg', 'Sessrumnir'],
    correctIndex: 0,
  ),
  // 30
  QuizQuestion(
    question: 'Siapa yang membunuh raksasa Geirröd?',
    questionEn: 'Who killed the giant Geirröd?',
    options: ['Loki', 'Thor', 'Tyr', 'Odin'],
    optionsEn: ['Loki', 'Thor', 'Tyr', 'Odin'],
    correctIndex: 1,
  ),
  // 31
  QuizQuestion(
    question: 'Apa nama ular raksasa yang melilit dunia?',
    questionEn: 'What is the name of the giant serpent that encircles the world?',
    options: ['Jormungandr', 'Nidhogg', 'Nidhoggr', 'Ormr'],
    optionsEn: ['Jormungandr', 'Nidhogg', 'Nidhoggr', 'Ormr'],
    correctIndex: 0,
  ),
  // 32
  QuizQuestion(
    question: 'Apa nama sungai pemisah Aesir dan Vanir?',
    questionEn: 'What is the name of the river that separates Aesir and Vanir?',
    options: ['Iving', 'Gjoll', 'Vimur', 'Élivágar'],
    optionsEn: ['Iving', 'Gjoll', 'Vimur', 'Élivágar'],
    correctIndex: 0,
  ),
  // 33
  QuizQuestion(
    question: 'Siapa yang mengemban tugas menguburkan Baldr di kapal kematian?',
    questionEn: 'Who was tasked with carrying Baldur to his funeral ship?',
    options: ['Modi', 'Vali', 'Hermod', 'Vidar'],
    optionsEn: ['Modi', 'Vali', 'Hermod', 'Vidar'],
    correctIndex: 2,
  ),
  // 34
  QuizQuestion(
    question: 'Apa nama sungai tempat Hvergelmir berada?',
    questionEn: 'What is the name of the river where Hvergelmir is located?',
    options: ['Gjoll', 'Niflheim', 'Vimur', 'Élivágar'],
    optionsEn: ['Gjoll', 'Niflheim', 'Vimur', 'Élivágar'],
    correctIndex: 3,
  ),
  // 35
  QuizQuestion(
    question: 'Siapa yang menjadi pemimpin Einherjar di Valhalla?',
    questionEn: 'Who leads the Einherjar in Valhalla?',
    options: ['Vidar', 'Vali', 'Tyr', 'Odin'],
    optionsEn: ['Vidar', 'Vali', 'Tyr', 'Odin'],
    correctIndex: 3,
  ),
  // 36
  QuizQuestion(
    question: 'Apa nama helm yang Loki curi dari raksasa Andvari?',
    questionEn: 'What is the name of the helm that Loki stole from the giant Andvari?',
    options: ['Helm of Darkness', 'Ægishjálmur', 'Helm of Awe', 'Crown of Shadows'],
    optionsEn: ['Helm of Darkness', 'Ægishjálmur', 'Helm of Awe', 'Crown of Shadows'],
    correctIndex: 1,
  ),
  // 37
  QuizQuestion(
    question: 'Siapa Norn yang mengawasi nasib masa lalu?',
    questionEn: 'Which Norn governs the fate of the past?',
    options: ['Verdandi', 'Urðr', 'Skuld', 'Surtur'],
    optionsEn: ['Verdandi', 'Urðr', 'Skuld', 'Surtur'],
    correctIndex: 1,
  ),
  // 38
  QuizQuestion(
    question: 'Apa nama perahu terbang milik Freyr yang bisa dilipat menjadi kantung?',
    questionEn: 'What is the name of Freyr\'s flying ship that can be folded into a pouch?',
    options: ['Naglfar', 'Skidbladnir', 'Hringhorni', 'Arvak'],
    optionsEn: ['Naglfar', 'Skidbladnir', 'Hringhorni', 'Arvak'],
    correctIndex: 1,
  ),
  // 39
  QuizQuestion(
    question: 'Siapa yang menciptakan rusa Helsvelgir?',
    questionEn: 'Who created the dragon Helsvelgir?',
    options: ['Nornen', 'Hreidmar', 'Hræsvelgr', 'Tidak diketahui'],
    optionsEn: ['The Norns', 'Hreidmar', 'Hræsvelgr', 'Unknown'],
    correctIndex: 2,
  ),
  // 40
  QuizQuestion(
    question: 'Apa nama apel yang diberikan Idunn kepada para dewa?',
    questionEn: 'What is the name of the apples that Idunn gives to the gods?',
    options: ['Golden Apples of Immortality', 'Apples of Iðunn', 'Fruit of Yggdrasil', 'Apples of Kvasir'],
    optionsEn: ['Golden Apples of Immortality', 'Apples of Iðunn', 'Fruit of Yggdrasil', 'Apples of Kvasir'],
    correctIndex: 0,
  ),
  // 41
  QuizQuestion(
    question: 'Siapa yang membunuh Fenrir di Ragnarok?',
    questionEn: 'Who killed Fenrir at Ragnarok?',
    options: ['Thor', 'Vidar', 'Tyr', 'Magni'],
    optionsEn: ['Thor', 'Vidar', 'Tyr', 'Magni'],
    correctIndex: 1,
  ),
  // 42
  QuizQuestion(
    question: 'Apa nama istri Loki yang merupakan raksasa?',
    questionEn: 'What is the name of Loki\'s wife who is a giantess?',
    options: ['Gerd', 'Angrboda', 'Sigyn', 'Ran'],
    optionsEn: ['Gerd', 'Angrboda', 'Sigyn', 'Ran'],
    correctIndex: 2,
  ),
  // 43
  QuizQuestion(
    question: 'Siapa tiga anak Loki dan Angrboda?',
    questionEn: 'What are the three children of Loki and Angrboda?',
    options: ['Fenrir, Jormungandr, Hel', 'Fenrir, Hel, Nidhogg', 'Fenrir, Jormungandr, Sleipnir', 'Hel, Modi, Magni'],
    optionsEn: ['Fenrir, Jormungandr, Hel', 'Fenrir, Hel, Nidhogg', 'Fenrir, Jormungandr, Sleipnir', 'Hel, Modi, Magni'],
    correctIndex: 0,
  ),
  // 44
  QuizQuestion(
    question: 'Apa nama perisai yang dimiliki Freyr?',
    questionEn: 'What is the name of the shield that Freyr possesses?',
    options: ['Aegis', 'Skidbladnir Shield', 'Lævateinn', 'Tidak disebutkan memiliki perisai'],
    optionsEn: ['Aegis', 'Skidbladnir Shield', 'Lævateinn', 'Not mentioned as having a shield'],
    correctIndex: 3,
  ),
  // 45
  QuizQuestion(
    question: 'Siapa yang mengembara ke dunia raksasa untuk meminang Gerdr untuk Freyr?',
    questionEn: 'Who journeyed to the land of giants to woo Gerdr for Freyr?',
    options: ['Skirnir', 'Odin', 'Loki', 'Heimdall'],
    optionsEn: ['Skirnir', 'Odin', 'Loki', 'Heimdall'],
    correctIndex: 0,
  ),
  // 46
  QuizQuestion(
    question: 'Berapa banyak dunia yang terhubung oleh Yggdrasil menurut Edda?',
    questionEn: 'How many realms are connected by Yggdrasil according to the Eddas?',
    options: ['Sembilan', 'Tujuh', 'Dua belas', 'Lima'],
    optionsEn: ['Nine', 'Seven', 'Twelve', 'Five'],
    correctIndex: 0,
  ),
  // 47
  QuizQuestion(
    question: 'Apa nama perisai yang dimiliki Baldr?',
    questionEn: 'What is the name of Baldur\'s shield?',
    options: ['Aegis', 'Lævateinn', 'Himinbjorg', 'Tidak disebutkan memiliki perisai'],
    optionsEn: ['Aegis', 'Lævateinn', 'Himinbjorg', 'Not mentioned as having a shield'],
    correctIndex: 3,
  ),
  // 48
  QuizQuestion(
    question: 'Siapa yang menjadi penunggang kuda kematian Hrimfaxi?',
    questionEn: 'Who rides the death horse Hrimfaxi?',
    options: ['Odin', 'Skuld', 'Nott', 'Vidar'],
    optionsEn: ['Odin', 'Skuld', 'Nott', 'Vidar'],
    correctIndex: 2,
  ),
  // 49
  QuizQuestion(
    question: 'Apa nama apel yang diberikan oleh Iðunn untuk menjaga keabadian para dewa?',
    questionEn: 'What is the name of the apples given by Iðunn to maintain the gods\' immortality?',
    options: ['Golden Apples of Iðunn', 'Apples of Wisdom', 'Mead of Poetry', 'Fruit of Kvasir'],
    optionsEn: ['Golden Apples of Iðunn', 'Apples of Wisdom', 'Mead of Poetry', 'Fruit of Kvasir'],
    correctIndex: 0,
  ),
  // 50
  QuizQuestion(
    question: 'Siapa yang menghubungkan Madu Puisi dengan Kvasir?',
    questionEn: 'Who connected the Mead of Poetry with Kvasir?',
    options: ['Gagnrâd', 'Baugi dan Suttung', 'Odin dan Kvasir', 'Mimir'],
    optionsEn: ['Gagnrâd', 'Baugi and Suttung', 'Odin and Kvasir', 'Mimir'],
    correctIndex: 1,
  ),
  // 51
  QuizQuestion(
    question: 'Istri Thor manakah yang terkenal dengan rambut emasnya yang melambangkan ladang gandum, sebelum dipotong oleh Loki?',
    questionEn: 'Which wife of Thor was famed for her golden hair symbolizing fields of grain, before Loki cut it off?',
    options: ['Freya', 'Idun', 'Sif', 'Frigg'],
    optionsEn: ['Freya', 'Idun', 'Sif', 'Frigg'],
    correctIndex: 2,
  ),
  // 52
  QuizQuestion(
    question: 'Siapakah dua saudara Odin yang bersamanya menciptakan manusia pertama, Ask dan Embla, dari sepasang batang kayu?',
    questionEn: 'Who are Odin\'s two brothers who together with him created the first humans, Ask and Embla, from a pair of tree trunks?',
    options: ['Vili dan Vé', 'Baldur dan Hodr', 'Hoenir dan Lodur', 'Mimir dan Kvasir'],
    optionsEn: ['Vili and Vé', 'Baldur and Hodr', 'Hoenir and Lodur', 'Mimir and Kvasir'],
    correctIndex: 0,
  ),
  // 53
  QuizQuestion(
    question: 'Raksasa terkuat dengan kepala dan hati dari batu keras ini berduel melawan Thor hingga kepalanya hancur oleh Mjolnir. Siapakah dia?',
    questionEn: 'This strongest giant, with a head and heart of solid stone, dueled Thor until his head was shattered by Mjolnir. Who is he?',
    options: ['Thrym', 'Surtr', 'Ymir', 'Hrungnir'],
    optionsEn: ['Thrym', 'Surtr', 'Ymir', 'Hrungnir'],
    correctIndex: 3,
  ),
  // 54
  QuizQuestion(
    question: 'Apa sebutan untuk mayat hidup dalam mitologi Nordik yang bangkit dari kuburnya untuk menjaga harta karunnya?',
    questionEn: 'What is the term for the undead in Norse mythology that rises from its grave to guard its treasure hoard?',
    options: ['Einherjar', 'Draugr', 'Valkyrie', 'Jotun'],
    optionsEn: ['Einherjar', 'Draugr', 'Valkyrie', 'Jotun'],
    correctIndex: 1,
  ),
  // 55
  QuizQuestion(
    question: 'Siapakah para prajurit perempuan pelayan Odin yang terbang di atas medan perang untuk memilih pahlawan gugur yang paling gagah menuju Valhalla?',
    questionEn: 'Who are the warrior maidens serving Odin who fly over the battlefield to choose the bravest fallen heroes for Valhalla?',
    options: ['Valkyrie', 'Norns', 'Disir', 'Idis'],
    optionsEn: ['Valkyrie', 'Norns', 'Disir', 'Idis'],
    correctIndex: 0,
  ),
  // 56
  QuizQuestion(
    question: 'Apa nama jembatan pelangi yang menghubungkan Asgard dengan Midgard dan dijaga oleh Heimdall?',
    questionEn: 'What is the name of the rainbow bridge connecting Asgard with Midgard, guarded by Heimdall?',
    options: ['Gjallarbru', 'Yggdrasil', 'Bifröst', 'Gnipahellir'],
    optionsEn: ['Gjallarbru', 'Yggdrasil', 'Bifröst', 'Gnipahellir'],
    correctIndex: 2,
  ),
  // 57
  QuizQuestion(
    question: 'Siapakah raja raksasa yang mencuri palu Mjolnir milik Thor dan menuntut Freyja sebagai istri untuk mengembalikannya?',
    questionEn: 'Which giant king stole Thor\'s hammer Mjolnir and demanded Freyja as his bride in exchange for its return?',
    options: ['Hrungnir', 'Thrym', 'Surtr', 'Skrymir'],
    optionsEn: ['Hrungnir', 'Thrym', 'Surtr', 'Skrymir'],
    correctIndex: 1,
  ),
  // 58
  QuizQuestion(
    question: 'Bagaimana cara Thor akhirnya berhasil merebut kembali Mjolnir dari Thrym?',
    questionEn: 'How did Thor finally manage to seize Mjolnir back from Thrym?',
    options: ['Menantang duel langsung', 'Mengirim Loki untuk mencurinya kembali', 'Meminta bantuan Odin', 'Menyamar sebagai pengantin perempuan Freyja'],
    optionsEn: ['By challenging him to a direct duel', 'By sending Loki to steal it back', 'By asking Odin for help', 'By disguising himself as the bride Freyja'],
    correctIndex: 3,
  ),
  // 59
  QuizQuestion(
    question: 'Bagaimana para dewa akhirnya menghukum Loki setelah kematian Baldur?',
    questionEn: 'How did the gods finally punish Loki after Baldur\'s death?',
    options: ['Membelenggunya di bawah ular berbisa dengan usus putranya sendiri', 'Mengasingkannya ke Jotunheim selamanya', 'Melemparnya ke dalam Ginnungagap', 'Mengubahnya menjadi batu'],
    optionsEn: ['They bound him beneath a venomous serpent with his own son\'s entrails', 'They exiled him to Jotunheim forever', 'They cast him into Ginnungagap', 'They turned him to stone'],
    correctIndex: 0,
  ),
  // 60
  QuizQuestion(
    question: 'Apa yang dikorbankan Tyr sebagai jaminan saat para dewa membelenggu serigala Fenrir dengan tali gaib Gleipnir?',
    questionEn: 'What did Tyr sacrifice as a pledge when the gods bound the wolf Fenrir with the magical fetter Gleipnir?',
    options: ['Matanya', 'Nyawanya', 'Tangan kanannya', 'Palunya'],
    optionsEn: ['His eye', 'His life', 'His right hand', 'His hammer'],
    correctIndex: 2,
  ),
  // 61
  QuizQuestion(
    question: 'Bagaimana Perang Aesir-Vanir, perang pertama di dunia, akhirnya berakhir?',
    questionEn: 'How did the Aesir-Vanir War, the first war in the world, ultimately end?',
    options: ['Kemenangan total Aesir', 'Gencatan senjata dan pertukaran sandera', 'Kemenangan total Vanir', 'Kehancuran kedua belah pihak'],
    optionsEn: ['Total Aesir victory', 'A truce and exchange of hostages', 'Total Vanir victory', 'Mutual destruction of both sides'],
    correctIndex: 1,
  ),
];
