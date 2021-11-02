// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:delivery_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(KwikBasketDeliveryApp());
    Widget widget = Image.asset(
      'assets/icon/icon.png',
      height: 200,
      width: 200,
    );
    Finder x = find.byWidget(widget, skipOffstage: true);
    // Verify that the quick basket logo appears on the splash screen
    expect(x, findsOneWidget);
  });
}
