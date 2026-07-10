import 'package:flutter_test/flutter_test.dart';
import 'package:mythopedia/main.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    await tester.pumpWidget(const MythopediaApp());
    expect(find.text('MYTHOPEDIA'), findsNothing);
  });
}
