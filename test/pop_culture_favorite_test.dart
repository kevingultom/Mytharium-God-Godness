import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mytharium/data/pop_culture_data.dart';
import 'package:mytharium/l10n/language_provider.dart';
import 'package:mytharium/screens/favorites_screen.dart';
import 'package:mytharium/screens/mythic_pop_culture_screen.dart';
import 'package:mytharium/services/pop_culture_bookmark_service.dart';

Widget _wrap(Widget child, LanguageNotifier lang) =>
    LanguageProvider(notifier: lang, child: MaterialApp(home: child));

void main() {
  testWidgets('Pop Culture card heart toggles a character favorite',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(750, 1334);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    SharedPreferences.setMockInitialValues({});
    await PopCultureBookmarkService.init();
    final lang = LanguageNotifier();
    await lang.init();

    final first = popCultureData.first; // Kratos (Greek)
    expect(PopCultureBookmarkService.isFavorite(first.id), isFalse);

    await tester.pumpWidget(_wrap(const MythicPopCultureScreen(), lang));
    await tester.pumpAndSettle();

    final heart = find.byIcon(Icons.favorite_border_rounded).first;
    await tester.ensureVisible(heart);
    await tester.pumpAndSettle();
    await tester.tap(heart);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull, reason: 'Toggling PC favorite threw');
    expect(PopCultureBookmarkService.isFavorite(first.id), isTrue,
        reason: 'Favorite was not persisted');
  });

  testWidgets('Favorites screen lists favorited pop culture characters',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await PopCultureBookmarkService.init();
    await PopCultureBookmarkService.toggle(popCultureData.first.id); // Kratos

    final lang = LanguageNotifier();
    await lang.init();

    await tester.pumpWidget(_wrap(const FavoritesScreen(), lang));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull, reason: 'Favorites threw on build');

    expect(find.text('MYTHIC POP CULTURE'), findsOneWidget,
        reason: 'Pop culture section header missing');
    expect(find.text('Kratos'), findsOneWidget,
        reason: 'Favorited character not shown in Favorites');
    expect(find.text('1 favorit'), findsOneWidget);
  });
}
