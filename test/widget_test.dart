// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

/// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mind_pro/domain/usecases/login_usecases.dart';

import 'package:mind_pro/main.dart';
import 'package:mockito/annotations.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([LoginUseCases])
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final loginUseCasesMock = MockLoginUseCases();
    GetIt.I.registerSingleton<LoginUseCases>(loginUseCasesMock);

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // do something to wait for 2 seconds
    //await Future.delayed(const Duration(seconds: 2), () {});

    // Verify that our counter starts at 0.
    /*expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);*/
  });
}
