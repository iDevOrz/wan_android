import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wan_android/main.dart';

void main() {
  group('GoldenBuilder', () {
    testGoldens('Scenario Builder example', (tester) async {
      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1,
      )
        ..addScenarioBuilder("Primary Color", (context) {
          var color = Theme.of(context).colorScheme.primary;
          return Container(
            color: color,
          );
        })
        ..addScenarioBuilder("Secondary Color", (context) {
          var color = Theme.of(context).colorScheme.primary;
          return Container(
            color: color,
          );
        });
      await tester.pumpWidgetBuilder(builder.build());
      await screenMatchesGolden(tester, 'golden_builder_theme');
    });

    testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
        (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.iphone11,
        ])
        ..addScenario(
          widget: const MyApp(),
          name: 'default page',
        )
        ..addScenario(
          widget: const MyApp(),
          name: 'tap once',
          onCreate: (scenarioWidgetKey) async {
            final finder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byIcon(Icons.add),
            );
            expect(finder, findsOneWidget);
            await tester.tap(finder);
          },
        )
        ..addScenario(
          widget: const MyApp(),
          name: 'tap five times',
          onCreate: (scenarioWidgetKey) async {
            final finder = find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byIcon(Icons.add),
            );
            expect(finder, findsOneWidget);

            await tester.tap(finder);
            await tester.tap(finder);
            await tester.tap(finder);
            await tester.tap(finder);
            await tester.tap(finder);
          },
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'flutter_demo_page_multiple_scenarios');
    });
  });
}
