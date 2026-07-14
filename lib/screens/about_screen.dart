import 'package:flutter/material.dart';
import '../l10n/language_provider.dart';
import '../utils/app_fonts.dart';
import '../widgets/static_page_scaffold.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = LanguageProvider.of(context).value == 'id';

    return StaticPageScaffold(
      title: id ? 'Tentang' : 'About',
      children: [
        Center(
          child: Text(
            'MYTHARIUM',
            style: AppFonts.cinzel(
              color: const Color(0xFFB07800),
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: 4,
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Center(
          child: Text(
            'Explore Every God, Every Legend, Every Realm.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 12.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 28),
        StaticPageParagraph(
          id
              ? 'Mytharium adalah ensiklopedia mitologi yang mengajak kamu menjelajahi dewa-dewi, pahlawan, makhluk, dan kosmologi dari enam mitologi dunia: Yunani, Mesir, Nordik, Hindu, Tionghoa, dan Jepang.'
              : 'Mytharium is a mythology encyclopedia that invites you to explore the gods, heroes, creatures, and cosmology of six world mythologies: Greek, Egyptian, Nordic, Hindu, Chinese, and Japanese.',
        ),
        StaticPageParagraph(
          id
              ? 'Setiap tokoh disajikan dengan kisah yang ditulis mendalam dan dwibahasa (Indonesia/Inggris), lengkap dengan kekuatan, gelar, dan kategori masing-masing. Kamu juga bisa menyimpan tokoh favorit, membaca kisah-kisah epik mitologi, menguji pengetahuan lewat kuis, dan mengadu kekuatan antar dewa demi hiburan.'
              : 'Every figure is presented with a deeply written, bilingual (Indonesian/English) story, complete with powers, titles, and categories. You can also bookmark your favorite figures, read epic mythology stories, test your knowledge with quizzes, and pit gods against each other for fun.',
        ),
        StaticPageParagraph(
          id
              ? 'Aplikasi ini dibuat sebagai proyek pribadi oleh seorang pencinta mitologi, dengan konten yang disusun berdasarkan sumber dan tradisi mitologi yang telah dikenal luas.'
              : 'This app was built as a personal project by a mythology enthusiast, with content drawn from widely known mythological sources and traditions.',
        ),
      ],
    );
  }
}
