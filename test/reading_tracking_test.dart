import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mythera/data/gods_data.dart';
import 'package:mythera/l10n/language_provider.dart';
import 'package:mythera/screens/god_detail_screen.dart';
import 'package:mythera/screens/my_myths_screen.dart';
import 'package:mythera/services/reading_service.dart';

Widget _wrap(Widget child, LanguageNotifier lang) =>
    LanguageProvider(notifier: lang, child: MaterialApp(home: child));

void main() {
  testWidgets('God detail: Mark as Read toggles and persists',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await ReadingService.init();
    final lang = LanguageNotifier();
    await lang.init();

    final god = godsData.first; // Zeus
    expect(ReadingService.isGodRead(god.id), isFalse);

    await tester.pumpWidget(_wrap(GodDetailScreen(god: god), lang));
    await tester.pumpAndSettle();

    // Open the god's own legend story card (default lang is id). The hero
    // portrait above it can push the card below the fold, so scroll it into
    // view first.
    final storyCard = find.text('Legenda ${god.name}');
    await tester.ensureVisible(storyCard);
    await tester.pumpAndSettle();
    await tester.tap(storyCard);
    await tester.pumpAndSettle();

    final markBtn = find.text('Tandai Dibaca');
    expect(markBtn, findsOneWidget);

    await tester.tap(markBtn);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Marking a god read threw');
    expect(find.text('Sudah Dibaca'), findsOneWidget);
    expect(ReadingService.isGodRead(god.id), isTrue,
        reason: 'Read state was not persisted');
    expect(ReadingService.streak, greaterThanOrEqualTo(1),
        reason: 'Reading streak did not start');
  });

  testWidgets('My Myths reflects god reads and shows the collection sections',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await ReadingService.init();
    // Mark one Greek god read before opening the library.
    final greekGod = godsData.firstWhere((g) => g.mythology == 'Greek');
    await ReadingService.toggleGodRead(greekGod);

    final lang = LanguageNotifier();
    await lang.init();

    await tester.pumpWidget(_wrap(const MyMythsScreen(), lang));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'My Myths threw on build');

    // Section header + the updated stat badge are near the top (built).
    expect(find.text('KOLEKSI DEWA'), findsOneWidget);
    expect(find.text('1 dewa dibaca'), findsOneWidget,
        reason: 'God-read count not reflected in the stats');
  });

  testWidgets('My Myths shows an empty-state prompt when nothing is read',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await ReadingService.init();
    final lang = LanguageNotifier();
    await lang.init();

    await tester.pumpWidget(_wrap(const MyMythsScreen(), lang));
    await tester.pumpAndSettle();

    expect(find.text('0 dewa dibaca'), findsOneWidget);
    // The empty "recently read" prompt is at the bottom — scroll it into view.
    await tester.scrollUntilVisible(
      find.textContaining('Belum ada yang dibaca'),
      250,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.textContaining('Belum ada yang dibaca'), findsOneWidget);
  });
}
