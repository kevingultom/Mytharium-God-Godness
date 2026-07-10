import 'package:flutter/material.dart';
import 'l10n/language_provider.dart';
import 'widgets/music_button.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final langNotifier = LanguageNotifier();
  await langNotifier.init();
  runApp(LanguageProvider(notifier: langNotifier, child: const MythopediaApp()));
}

class MythopediaApp extends StatelessWidget {
  const MythopediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mythopedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.light(
          surface: Color(0xFFF5F5F5),
          primary: Color(0xFFB07800),
          secondary: Color(0xFF7B1FA2),
          onSurface: Color(0xFF1A1A2E),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1A1A2E),
          elevation: 0,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xFF1A1A2E),
          contentTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: const SplashScreen(),
      builder: (context, child) {
        return Stack(
          children: [
            child ?? const SizedBox.shrink(),
            const Positioned(
              right: 20,
              bottom: 32,
              child: MusicButton(),
            ),
          ],
        );
      },
    );
  }
}
