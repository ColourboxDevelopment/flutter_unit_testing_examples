// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:some_testing/FuckScreen.dart';

void main() {
  testWidgets('Correct texts exists on screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FuckScreen()));

    // different ways of smoke testing.
    expect(find.text('Well, I don\'t have anything to do with count,'),
        findsOneWidget);

    expect(
      find.byType(Text),
      findsNWidgets(3),
    );

    expect(
      find.byKey(
        Key('first text'),
      ),
      findsOneWidget,
    );

    // not ideal, now we need to test the test...
    expect(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        final Text textWidget = widget;
        if (textWidget.data != null) return textWidget.data.contains('Well');
        return textWidget.textSpan.toPlainText().contains('Well');
      }
      return false;
    }), findsOneWidget);
  });

  testWidgets('toggle text test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FuckScreen()));

    expect(find.text('This text can disappear'), findsOneWidget);
    await tester.tap(find.byKey(Key('button')));

    // rebuild widget after state change.
    await tester.pump();
    expect(find.text('This text can disappear'), findsNothing);
  });
}
