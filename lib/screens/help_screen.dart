import 'package:flutter/material.dart';
import '../l10n/language_provider.dart';
import '../widgets/static_page_scaffold.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = LanguageProvider.of(context).value == 'id';

    return StaticPageScaffold(
      title: id ? 'Bantuan' : 'Help',
      children: [
        StaticPageHeading(
            id ? 'Bagaimana cara menjelajahi dewa?' : 'How do I browse gods?'),
        StaticPageParagraph(
          id
              ? 'Buka tab Discover, lalu gunakan kolom pencarian atau chip mitologi (Greek, Egyptian, Nordic, Hindu, Chinese, Japanese) untuk menyaring. Ketuk sebuah dewa untuk melihat ringkasan, lalu ketuk "Pelajari" untuk membaca kisah lengkapnya.'
              : 'Open the Discover tab, then use the search bar or the mythology chips (Greek, Egyptian, Nordic, Hindu, Chinese, Japanese) to filter. Tap a god to see a summary, then tap "Learn More" to read the full story.',
        ),
        StaticPageHeading(id
            ? 'Bagaimana cara menyimpan dewa favorit?'
            : 'How do I bookmark a favorite god?'),
        StaticPageParagraph(
          id
              ? 'Buka halaman detail dewa mana pun, lalu ketuk ikon bookmark di sana untuk menyimpannya. Semua dewa yang disimpan bisa dilihat lewat kartu "Favorites" di tab Codex.'
              : 'Open any god\'s detail page and tap the bookmark icon there to save it. All saved gods can be viewed via the "Favorites" card in the Codex tab.',
        ),
        StaticPageHeading(id ? 'Apa itu tab Stories?' : 'What is the Stories tab?'),
        StaticPageParagraph(
          id
              ? 'Tab Stories berisi kisah-kisah epik mitologi yang lebih panjang, seperti perang para dewa atau legenda besar, disusun per mitologi.'
              : 'The Stories tab contains longer epic mythology tales, such as great wars among the gods or major legends, organized by mythology.',
        ),
        StaticPageHeading(
            id ? 'Bagaimana cara main kuis?' : 'How do I take a quiz?'),
        StaticPageParagraph(
          id
              ? 'Buka tab Codex, pilih salah satu genre mitologi (atau "All Mythologies" untuk level lebih sulit), lalu jawab 10 soal acak seputar dewa dan kisahnya.'
              : 'Open the Codex tab, pick a mythology genre (or "All Mythologies" for a harder mix), then answer 10 random questions about the gods and their stories.',
        ),
        StaticPageHeading(id ? 'Apa itu Adu Dewa?' : 'What is God Battle?'),
        StaticPageParagraph(
          id
              ? 'Adu Dewa adalah fitur hiburan di tab Discover (banner emas di bagian atas) yang memungkinkanmu memilih 2 dewa dan mengadu kekuatan mereka secara simulasi. Fitur ini murni untuk hiburan, bukan penilaian nyata.'
              : 'God Battle is an entertainment feature on the Discover tab (the gold banner near the top) that lets you pick 2 gods and simulate a battle between them. It is purely for fun, not a real judgment of power.',
        ),
        StaticPageHeading(id ? 'Bisa ganti bahasa?' : 'Can I switch languages?'),
        StaticPageParagraph(
          id
              ? 'Bisa. Ketuk tombol EN/ID di pojok kanan atas tab Discover untuk beralih antara Bahasa Indonesia dan Inggris kapan saja.'
              : 'Yes. Tap the EN/ID button in the top-right corner of the Discover tab to switch between English and Indonesian at any time.',
        ),
        StaticPageHeading(id
            ? 'Di mana pengaturan suara dan getaran?'
            : 'Where are the sound and haptics settings?'),
        StaticPageParagraph(
          id
              ? 'Buka tab Profile, lalu atur Pengingat Harian, Efek Suara, dan Getaran melalui saklar di card Preferences.'
              : 'Open the Profile tab, then adjust Daily Reminders, Sound Effects, and Haptics using the switches in the Preferences card.',
        ),
      ],
    );
  }
}
