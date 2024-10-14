import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter testing app', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });

    var textfield = find.byType('TextField');
    var button = find.text('Reverse');
    var reverse = find.text('olleH');

    test('Reverse the string', () async {
      await driver!.tap(textfield);
      await Future.delayed(const Duration(seconds: 2));
      await driver!.enterText('Hello');
      await Future.delayed(const Duration(seconds: 2));
      await driver!.waitForAbsent(reverse);
      await driver!.tap(button);
      await Future.delayed(const Duration(seconds: 2));
      await driver!.waitFor(reverse);
      await driver!.waitUntilNoTransientCallbacks();
      assert(reverse == find.text('olleH'));
    });
  });
}
