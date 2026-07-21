import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mythera/main.dart';
import 'package:mythera/l10n/language_provider.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final langNotifier = LanguageNotifier();
    await langNotifier.init();

    await tester.pumpWidget(
      LanguageProvider(notifier: langNotifier, child: const MytheraApp()),
    );
    expect(tester.takeException(), isNull, reason: 'App failed to render');
    // The welcome page reveals the MYTHERA wordmark one letter at a time
    // (each letter is its own Text widget), so check the spelled-out result
    // rather than a single 'MYTHERA' Text widget.
    final letters = tester
        .widgetList<Text>(find.byType(Text))
        .map((w) => w.data ?? '')
        .join();
    expect(letters, contains('MYTHERA'));
  });
}
