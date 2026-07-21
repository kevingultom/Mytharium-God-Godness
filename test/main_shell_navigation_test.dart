import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mythera/main.dart';
import 'package:mythera/l10n/language_provider.dart';
import 'package:mythera/services/onboarding_service.dart';

void main() {
  testWidgets('Switching through all bottom nav tabs does not throw',
      (WidgetTester tester) async {
    // Simulate a small phone (iPhone SE-class) so the "fits on one screen"
    // requirement is checked against a realistic worst case.
    tester.view.physicalSize = const Size(750, 1334);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Mark onboarding done so the app opens straight into MainShell.
    SharedPreferences.setMockInitialValues({'onboarding_complete': true});
    await OnboardingService.init();

    final langNotifier = LanguageNotifier();
    await langNotifier.init();

    await tester.pumpWidget(
      LanguageProvider(notifier: langNotifier, child: const MytheraApp()),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull, reason: 'Entering MainShell threw');

    // Navigate by icon (tab label text is language-dependent; icons aren't).
    for (final icon in [
      Icons.auto_awesome_rounded, // Discover
      Icons.auto_stories_rounded, // Stories
      Icons.library_books_rounded, // Codex
      Icons.person_rounded, // Profile
    ]) {
      final tabFinder = find.byIcon(icon);
      expect(tabFinder, findsOneWidget, reason: 'Tab icon $icon not found');
      await tester.tap(tabFinder);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull,
          reason: 'Switching to the $icon tab threw an exception');
    }

    // "What's Your God?" (the personality quiz) must stay reachable from
    // Discover — it was previously dropped by accident during a nav refactor.
    await tester.tap(find.byIcon(Icons.auto_awesome_rounded));
    await tester.pumpAndSettle();
    final personalityQuizBanner = find.byIcon(Icons.psychology_rounded);
    expect(personalityQuizBanner, findsOneWidget,
        reason: '"What\'s Your God?" banner missing from Discover');
    await tester.tap(personalityQuizBanner);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull,
        reason: 'Opening the "What\'s Your God?" quiz threw an exception');

    // QuizScreen is a full-screen route covering MainShell (same as
    // DetailScreen/GodBattleScreen elsewhere) — its own custom back arrow
    // (not a framework BackButton) needs a tap before the bottom nav
    // reappears.
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded).first);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull,
        reason: 'Returning from the "What\'s Your God?" quiz threw');

    // Stories tab: the genre browser must render (no layout overflow) and its
    // "Mythic Pop Culture" banner + genre cards must be present.
    await tester.tap(find.byIcon(Icons.auto_stories_rounded));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Opening Stories threw');
    expect(find.text('Mythic Pop Culture'), findsOneWidget,
        reason: 'Mythic Pop Culture banner missing from Stories');
    // Greek appears in both the carousel and the grid.
    expect(find.text('Greek'), findsWidgets,
        reason: 'Greek genre card missing from Stories');
    // Tapping a genre opens its stories list without throwing.
    await tester.tap(find.text('Greek').first);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull,
        reason: 'Opening a genre stories list threw');

    // The bottom nav bar must STAY visible on this deeper pushed page — the
    // whole point of the per-tab nested navigators. The Codex tab icon lives
    // only in the bottom bar, so finding it here proves the footer persists.
    expect(find.byIcon(Icons.library_books_rounded), findsOneWidget,
        reason: 'Bottom nav footer disappeared on a deeper page');

    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded).first);
    await tester.pumpAndSettle();

    // Navigate back to Codex to confirm its cards render without a layout
    // exception (the loop above leaves the Profile tab active).
    await tester.tap(find.byIcon(Icons.library_books_rounded));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Returning to Codex threw');

    expect(find.text('Codex'), findsWidgets);
    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('My Myths'), findsOneWidget);
    // "Mythic Pop Culture" also exists on the Stories tab (still mounted
    // underneath, since IndexedStack keeps all tabs alive), so it may match
    // more than once.
    expect(find.text('Mythic Pop Culture'), findsWidgets);
    expect(find.text('Quiz'), findsOneWidget);
    expect(find.text('Tier'), findsOneWidget);

    // Codex is a single non-scrolling screen whose cards flex to fill the
    // height. It renders without a layout overflow (checked above via
    // takeException) and has no scrollable ancestor — proving it is one full
    // screen, not a scroll view, on a small phone (iPhone SE-class).
    final codexScrollable = find.ancestor(
      of: find.text('Favorites'),
      matching: find.byType(Scrollable),
    );
    expect(codexScrollable, findsNothing,
        reason: 'Codex should be a single non-scrolling screen');
  });
}
