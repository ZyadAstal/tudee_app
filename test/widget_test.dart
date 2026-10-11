import 'package:flutter_test/flutter_test.dart';
import 'package:tudee_tasks/main.dart';

void main() {
  testWidgets('TudeeApp loads properly', (WidgetTester tester) async {
    await tester.pumpWidget(TudeeApp());
    expect(find.byType(TudeeApp), findsOneWidget);
  });
}
