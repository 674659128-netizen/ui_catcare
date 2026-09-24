import 'package:flutter_test/flutter_test.dart';
import 'package:ui_catcare/main.dart';

void main() {
  testWidgets('App loads LoginScreen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that CatCare title is rendered.
    expect(find.text('Cat'), findsOneWidget);
    expect(find.text('are'), findsOneWidget);
  });
}
