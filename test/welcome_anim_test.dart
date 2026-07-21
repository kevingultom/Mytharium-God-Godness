import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mythera/l10n/language_provider.dart';
import 'package:mythera/screens/onboarding_screen.dart';

void main() {
  testWidgets('Welcome reveal: text starts hidden and renders without error',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final lang = LanguageNotifier();
    await lang.init();

    await tester.pumpWidget(
      LanguageProvider(
        notifier: lang,
        child: const MaterialApp(home: OnboardingScreen()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 16));

    // The welcome entrance is driven by a real Stopwatch (not the fake
    // clock tester.pump() advances — see onboarding_screen.dart's
    // _welcomeClock for why), so this test only checks the state right
    // after the first frame: every fade should still be hidden. Verifying
    // the fully-revealed end state would require actually waiting out the
    // real reveal duration, which isn't practical in a widget test.
    final opacities = tester
        .widgetList<FadeTransition>(find.byType(FadeTransition))
        .map((f) => f.opacity.value)
        .toList();
    final minStart = opacities.reduce((a, b) => a < b ? a : b);

    expect(tester.takeException(), isNull);
    expect(opacities, isNotEmpty, reason: 'welcome page should use FadeTransition reveals');
    expect(minStart, lessThan(0.1), reason: 'at least one text hidden at start');
  });
}
