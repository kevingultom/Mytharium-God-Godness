import 'package:flutter/material.dart';
import '../l10n/language_provider.dart';
import '../widgets/static_page_scaffold.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = LanguageProvider.of(context).value == 'id';

    return StaticPageScaffold(
      title: id ? 'Ketentuan Layanan' : 'Terms of Service',
      children: [
        StaticPageHeading(id ? 'Tujuan Aplikasi' : 'Purpose of the App'),
        StaticPageParagraph(
          id
              ? 'Mytharium dibuat semata-mata untuk tujuan hiburan dan edukasi seputar mitologi dunia. Seluruh konten, termasuk fitur "Adu Dewa", tidak dimaksudkan untuk menyinggung, menyalahgunakan, atau merendahkan kepercayaan maupun tradisi budaya mana pun.'
              : 'Mytharium is built solely for entertainment and educational purposes about world mythology. All content, including the "God Battle" feature, is not intended to offend, misuse, or belittle any belief system or cultural tradition.',
        ),
        StaticPageHeading(id ? 'Konten' : 'Content'),
        StaticPageParagraph(
          id
              ? 'Kisah dan informasi dalam aplikasi ini disusun berdasarkan tradisi mitologi yang telah dikenal luas secara publik, kemudian ditulis ulang dan disederhanakan agar mudah dibaca. Kami berupaya menjaga keakuratan, namun konten dapat berbeda dari satu sumber atau tradisi ke tradisi lainnya.'
              : 'The stories and information in this app are compiled from widely known public mythological traditions, then rewritten and simplified for readability. We strive for accuracy, but content may vary between sources and traditions.',
        ),
        StaticPageHeading(id ? 'Penggunaan Aplikasi' : 'Use of the App'),
        StaticPageParagraph(
          id
              ? 'Aplikasi ini gratis digunakan dan tidak memerlukan akun maupun pembayaran. Kamu bebas menjelajahi, menyimpan favorit, membaca kisah, dan mengikuti kuis sesuai keinginan.'
              : 'This app is free to use and does not require an account or payment. You are free to explore, bookmark favorites, read stories, and take quizzes as you like.',
        ),
        StaticPageParagraph(
          id
              ? 'Fitur "Adu Dewa" adalah simulasi hiburan berbasis angka kekuatan fiktif dan tidak merepresentasikan pandangan atau penilaian nyata terhadap kekuatan relatif antar dewa dari kepercayaan apa pun.'
              : 'The "God Battle" feature is an entertainment simulation based on fictional power ratings and does not represent any real judgment about the relative power of deities from any belief system.',
        ),
        StaticPageHeading(id ? 'Perubahan' : 'Changes'),
        StaticPageParagraph(
          id
              ? 'Konten dan fitur aplikasi dapat diperbarui, ditambah, atau diubah dari waktu ke waktu tanpa pemberitahuan sebelumnya.'
              : 'App content and features may be updated, added to, or changed over time without prior notice.',
        ),
      ],
    );
  }
}
