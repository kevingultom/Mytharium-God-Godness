import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mythera/main.dart';
import 'package:mythera/l10n/language_provider.dart';
import 'package:mythera/services/onboarding_service.dart';

void main() {
  testWidgets(
      'God Battle: card -> disclaimer -> Continue opens battle without throwing',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'onboarding_complete': true});
    await OnboardingService.init();
    final lang = LanguageNotifier();
    await lang.init();

    await tester.pumpWidget(
      LanguageProvider(notifier: lang, child: const MytheraApp()),
    );
    await tester.pumpAndSettle(); // splash auto-advances into the app

    // Tap the God Battle feature card (flash icon) on Discover.
    final battleCard = find.byIcon(Icons.flash_on_rounded);
    expect(battleCard, findsOneWidget, reason: 'God Battle card missing');
    await tester.tap(battleCard);
    await tester.pumpAndSettle();

    // Disclaimer dialog: tap "Lanjut" (default language is id).
    final continueBtn = find.text('Lanjut');
    expect(continueBtn, findsOneWidget,
        reason: 'Battle disclaimer Continue button missing');
    await tester.tap(continueBtn);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull,
        reason: 'Opening God Battle from the disclaimer threw');
    // GodBattleScreen should now be showing, and the bottom nav should persist.
    expect(find.text('GOD BATTLE'), findsOneWidget);
    expect(find.byIcon(Icons.library_books_rounded), findsOneWidget,
        reason: 'Bottom nav footer should persist on God Battle');
  });

  testWidgets('God Battle: tapping Cancel closes the dialog and keeps Discover',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'onboarding_complete': true});
    await OnboardingService.init();
    final lang = LanguageNotifier();
    await lang.init();

    await tester.pumpWidget(
      LanguageProvider(notifier: lang, child: const MytheraApp()),
    );
    await tester.pumpAndSettle(); // splash auto-advances into the app

    await tester.tap(find.byIcon(Icons.flash_on_rounded));
    await tester.pumpAndSettle();

    // Tap "Batal" (Cancel).
    final cancelBtn = find.text('Batal');
    expect(cancelBtn, findsOneWidget);
    await tester.tap(cancelBtn);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull, reason: 'Cancelling the dialog threw');
    // The dialog is gone...
    expect(find.text('Batal'), findsNothing);
    // ...and the Discover screen is still intact (not popped away / unmounted):
    // its God Battle card is still tappable and reopens the dialog.
    expect(find.byIcon(Icons.flash_on_rounded), findsOneWidget,
        reason: 'Discover was unmounted after Cancel');
    await tester.tap(find.byIcon(Icons.flash_on_rounded));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull,
        reason: 'Discover broke after Cancel — reopening the dialog threw');
    expect(find.text('Batal'), findsOneWidget);
  });
}
