import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mythera/main.dart';
import 'package:mythera/l10n/language_provider.dart';
import 'package:mythera/services/onboarding_service.dart';

void main() {
  testWidgets(
      'Codex → Tier → mythology → god detail navigates without error',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(750, 1334); // iPhone SE class
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    SharedPreferences.setMockInitialValues({'onboarding_complete': true});
    await OnboardingService.init();
    final lang = LanguageNotifier();
    await lang.init();

    await tester.pumpWidget(
      LanguageProvider(notifier: lang, child: const MytheraApp()),
    );
    await tester.pumpAndSettle(); // splash auto-advances into the app

    // Codex tab.
    await tester.tap(find.byIcon(Icons.library_books_rounded));
    await tester.pumpAndSettle();

    final tierCard = find.text('Tier');
    expect(tierCard, findsOneWidget, reason: 'Tier card missing from Codex');
    await tester.tap(tierCard);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Opening Tier screen threw');

    // Cards below the fold aren't mounted until scrolled into view.
    // Scoped to the screen's own ListView by key — once the mythology grid
    // scrolls into view it adds a second (nested, non-scrolling) Scrollable,
    // and the default byType(Scrollable) finder would then match both.
    final tierList = find
        .descendant(
          of: find.byKey(const Key('tierScreenList')),
          matching: find.byType(Scrollable),
        )
        .first;

    // Scroll to the mythology grid and drill into Nordic.
    await tester.scrollUntilVisible(find.text('Nordic'), 300,
        scrollable: tierList);
    await tester.ensureVisible(find.text('Nordic'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Nordic'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull,
        reason: 'Opening Nordic tier breakdown threw');
    expect(find.text('NORDIC'), findsOneWidget);
    // Odin (World-Ender) should be visible as a god chip.
    expect(find.text('Odin'), findsWidgets);

    // Tapping a god chip opens its detail screen.
    await tester.tap(find.text('Odin').first);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Opening Odin detail threw');
    expect(find.text('Odin'), findsWidgets);
  });
}
