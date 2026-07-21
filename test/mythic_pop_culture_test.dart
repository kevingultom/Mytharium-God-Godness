import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mythera/main.dart';
import 'package:mythera/l10n/language_provider.dart';
import 'package:mythera/services/onboarding_service.dart';

Future<void> _enterAppAndOpenPopCulture(WidgetTester tester) async {
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

  final card = find.text('Mythic Pop Culture');
  expect(card, findsWidgets, reason: 'Mythic Pop Culture card missing from Codex');
  await tester.tap(card.first);
  await tester.pumpAndSettle();
  expect(tester.takeException(), isNull, reason: 'Opening Mythic Pop Culture threw');
}

void main() {
  testWidgets(
      'Mythic Pop Culture: immersive feed renders and verse/media filters narrow it',
      (WidgetTester tester) async {
    await _enterAppAndOpenPopCulture(tester);

    // The first character (Greek: Kratos) is in the feed.
    expect(find.text('Kratos'), findsOneWidget);

    // Filtering to Nordic drops Greek characters; the feed's first (visible)
    // card becomes Thor. (Only on-screen cards are built — each fills a full
    // screen — so we assert on the first card, not off-screen ones.)
    await tester.tap(find.text('Nordic'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Verse filter threw');
    expect(find.text('Kratos'), findsNothing,
        reason: 'Greek character still shown after filtering to Nordic');
    expect(find.text('Thor'), findsOneWidget);

    // Nordic + Novel has no matches → graceful empty state, not a crash.
    await tester.tap(find.text('Novel'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Combined filter threw');
    expect(find.text('Tidak ada karakter ditemukan'), findsOneWidget,
        reason: 'Empty state did not render for a filter combo with 0 matches');
  });

  testWidgets('Mythic Pop Culture: Thor detail links to the original god card',
      (WidgetTester tester) async {
    await _enterAppAndOpenPopCulture(tester);

    // Filter to Nordic; the first card is Thor. Its info button sits at the
    // bottom of a full-screen card, so scroll it into view before tapping.
    await tester.tap(find.text('Nordic'));
    await tester.pumpAndSettle();
    final info = find.byIcon(Icons.info_outline_rounded).first;
    await tester.ensureVisible(info);
    await tester.pumpAndSettle();
    await tester.tap(info);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Opening Thor detail threw');
    // Thor has a real god card → the compare section + a linked original card.
    expect(find.text('BANDINGKAN DENGAN ASLINYA'), findsOneWidget);
    expect(find.text('Thor'), findsWidgets);
  });

  testWidgets(
      'Mythic Pop Culture: Zagreus detail falls back gracefully (no god card match)',
      (WidgetTester tester) async {
    await _enterAppAndOpenPopCulture(tester);

    // Filter to Greek, then scroll past Kratos (who now has a matching god
    // card in the catalog) to Zagreus, who still has none.
    await tester.tap(find.text('Greek'));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -1000));
    await tester.pumpAndSettle();
    expect(find.text('Zagreus'), findsOneWidget);
    final info = find.byIcon(Icons.info_outline_rounded).first;
    await tester.ensureVisible(info);
    await tester.pumpAndSettle();
    await tester.tap(info);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Opening Zagreus detail threw');
    expect(find.textContaining('Belum ada kartu dewa'), findsOneWidget,
        reason: 'Fallback message missing for a figure with no god card match');
  });
}
