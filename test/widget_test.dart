// This is a basic Flutter widget dtest.
//
// To perform an interaction with a widget in your dtest, use the Widgetdtester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use Widgetdtester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke dtest', (WidgetTester dtester) async {
    // Build our app and trigger a frame.
    await dtester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await dtester.tap(find.byIcon(Icons.add));
    await dtester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
