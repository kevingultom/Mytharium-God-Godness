import 'package:flutter/material.dart';
import '../l10n/language_provider.dart';
import '../widgets/static_page_scaffold.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = LanguageProvider.of(context).value == 'id';

    return StaticPageScaffold(
      title: id ? 'Kebijakan Privasi' : 'Privacy Policy',
      children: [
        StaticPageHeading(id ? 'Data yang Disimpan' : 'Data We Store'),
        StaticPageParagraph(
          id
              ? 'Mytharium tidak memerlukan pendaftaran akun dan tidak mengumpulkan data pribadi apa pun. Preferensi seperti bahasa, daftar favorit, dan pengaturan suara/getaran hanya disimpan secara lokal di perangkatmu.'
              : 'Mytharium does not require account registration and does not collect any personal data. Preferences such as language, your favorites list, and sound/haptics settings are stored locally on your device only.',
        ),
        StaticPageHeading(id ? 'Tidak Ada Pelacakan' : 'No Tracking'),
        StaticPageParagraph(
          id
              ? 'Aplikasi ini tidak menggunakan layanan analitik, iklan, maupun pelacak pihak ketiga. Tidak ada data yang dikirim ke server mana pun — seluruh konten (gambar, cerita, audio) sudah tersimpan di dalam aplikasi dan dapat diakses tanpa koneksi internet.'
              : 'This app does not use analytics, advertising, or third-party trackers. No data is ever sent to any server — all content (images, stories, audio) is bundled with the app and works without an internet connection.',
        ),
        StaticPageHeading(id ? 'Kontrol Kamu' : 'Your Control'),
        StaticPageParagraph(
          id
              ? 'Kamu dapat menghapus dewa favorit kapan saja dari halaman detailnya, dan mengubah pengaturan suara atau getaran kapan pun dari halaman Profil. Menghapus aplikasi akan menghapus seluruh data lokal tersebut dari perangkatmu.'
              : 'You can remove favorited gods at any time from their detail page, and change sound or haptics settings anytime from the Profile page. Uninstalling the app removes all of this local data from your device.',
        ),
        StaticPageHeading(id ? 'Perubahan Kebijakan' : 'Changes to This Policy'),
        StaticPageParagraph(
          id
              ? 'Jika suatu saat aplikasi ini menambahkan fitur yang memerlukan koneksi internet atau pengumpulan data, kebijakan ini akan diperbarui untuk mencerminkan perubahan tersebut.'
              : 'If this app ever adds a feature that requires an internet connection or data collection, this policy will be updated to reflect that change.',
        ),
      ],
    );
  }
}
