import 'package:flutter/material.dart';
import 'l10n/language_provider.dart';
import 'services/sound_service.dart';
import 'services/reading_service.dart';
import 'services/pop_culture_bookmark_service.dart';
import 'services/onboarding_service.dart';
import 'screens/onboarding_screen.dart';
import 'screens/main_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final langNotifier = LanguageNotifier();
  await langNotifier.init();
  await SoundService.init();
  await ReadingService.init();
  await PopCultureBookmarkService.init();
  await OnboardingService.init();
  runApp(LanguageProvider(notifier: langNotifier, child: const MythariumApp()));
}

class MythariumApp extends StatelessWidget {
  const MythariumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mytharium',
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
      home: OnboardingService.isComplete
          ? const MainShell()
          : const OnboardingScreen(),
    );
  }
}
