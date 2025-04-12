import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wan_android/main.dart';

void main() {
  group('GoldenBuilder', () {
    testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
        (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.iphone11,
        ])
        ..addScenario(
          widget: ProviderScope(child: MyApp()),
          name: 'default page',
        );
      // ..addScenario(
      //   widget: ProviderScope(child: MyApp()),
      //   name: 'mine',
      //   onCreate: (scenarioWidgetKey) async {
      //     final finder = find.descendant(
      //       of: find.byKey(scenarioWidgetKey),
      //       matching: find.byIcon(Icons.person),
      //     );
      //     expect(finder, findsWidgets);
      //     await tester.tap(finder.last);
      //   },
      // );
      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'home_page');
    });
  });
}
