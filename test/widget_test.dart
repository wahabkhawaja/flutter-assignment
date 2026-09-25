import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_assignment/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    Get.testMode = true;
    await Get.deleteAll(force: true);
  });

  tearDown(() async {
    await Get.deleteAll(force: true);
  });

  testWidgets('Bookings empty state opens login', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const VenuzeApp());
    await tester.pump();

    expect(find.text('Log in'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text("I'm not a robot"), findsOneWidget);

    await tester.tap(find.text('Login'));
    await tester.pump();
    expect(find.text('Enter a valid email address.'), findsOneWidget);
  });
}
