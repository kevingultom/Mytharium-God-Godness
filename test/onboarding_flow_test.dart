import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mytharium/main.dart';
import 'package:mytharium/l10n/language_provider.dart';
import 'package:mytharium/services/onboarding_service.dart';

void main() {
  testWidgets('First-run onboarding: pick realm + god, then enter the app',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Fresh install: onboarding not yet completed.
    SharedPreferences.setMockInitialValues({});
    await OnboardingService.init();
    expect(OnboardingService.isComplete, isFalse);

    final lang = LanguageNotifier();
    await lang.init();

    await tester.pumpWidget(
      LanguageProvider(notifier: lang, child: const MythariumApp()),
    );
    await tester.pumpAndSettle();

    // Page 1 — Welcome.
    expect(find.text('Continue'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Page 2 — Choose a realm.
    await tester.tap(find.text('Nordic'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Page 3 — Choose an iconic god of that realm.
    expect(find.text('Odin'), findsOneWidget,
        reason: 'Odin should appear among the iconic Nordic gods');
    await tester.tap(find.text('Odin'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Page 4 — Interest.
    await tester.tap(find.text('Surprise Me'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Page 5 — Rhythm.
    await tester.tap(find.text('Daily'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Page 6 — Reminders.
    await tester.tap(find.text('Enable daily reminders'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    // Page 7 — Ready → enter the app.
    expect(find.text('Enter Mytharium'), findsOneWidget);
    await tester.tap(find.text('Enter Mytharium'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull, reason: 'Finishing onboarding threw');
    expect(OnboardingService.isComplete, isTrue,
        reason: 'Onboarding flag was not persisted');
    expect(OnboardingService.patronGodId, '19', reason: 'Patron should be Odin');
    expect(OnboardingService.preferredPantheon, 'Nordic',
        reason: 'Realm should be Nordic');
    // Landed in the app: the bottom nav is present.
    expect(find.byIcon(Icons.library_books_rounded), findsOneWidget,
        reason: 'Should be inside MainShell after onboarding');
  });
}
