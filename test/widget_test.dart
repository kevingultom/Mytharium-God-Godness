import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mytharium/main.dart';
import 'package:mytharium/l10n/language_provider.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final langNotifier = LanguageNotifier();
    await langNotifier.init();

    await tester.pumpWidget(
      LanguageProvider(notifier: langNotifier, child: const MythariumApp()),
    );
    expect(tester.takeException(), isNull, reason: 'App failed to render');
    // The splash screen shows the MYTHARIUM wordmark immediately.
    expect(find.text('MYTHARIUM'), findsOneWidget);
  });
}
