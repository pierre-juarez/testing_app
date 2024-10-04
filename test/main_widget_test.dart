import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/main.dart';

void main() {
  testWidgets('Reverse string widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var textfield = find.byType(TextField);
    expect(textfield, findsOneWidget);
    await tester.enterText(textfield, "Hello");
    expect(find.text('Hello'), findsOneWidget);
    var button = find.text('Reverse');
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    expect(find.text('olleH'), findsOneWidget);
  });
}
