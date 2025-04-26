import 'package:brota/models/plant.dart';
import 'package:brota/widgets/custom_button.dart';
import 'package:brota/widgets/custom_text_field.dart';
import 'package:brota/widgets/plant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:brota_app/widgets/custom_button.dart';
// import 'package:brota_app/widgets/custom_text_field.dart';
// import 'package:brota_app/widgets/plant_card.dart';
// import 'package:brota_app/models/plant.dart';

void main() {
  group('Widget Tests', () {
    testWidgets('CustomButton test', (WidgetTester tester) async {
      bool buttonPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: CustomButton(
            text: 'Test Button',
            onPressed: () => buttonPressed = true,
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
      await tester.tap(find.byType(ElevatedButton));
      expect(buttonPressed, true);
    });

    testWidgets('CustomTextField test', (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              controller: controller,
              hintText: 'Test Hint',
            ),
          ),
        ),
      );

      expect(find.text('Test Hint'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'Test Input');
      expect(controller.text, 'Test Input');
    });

    testWidgets('PlantCard test', (WidgetTester tester) async {
      final plant = Plant(name: 'Rosa', type: 'Flor');
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: PlantCard(plant: plant))),
      );

      expect(find.text('Rosa'), findsOneWidget);
      expect(find.text('Tipo: Flor'), findsOneWidget);
      expect(find.byIcon(Icons.local_florist), findsOneWidget);
    });
  });
}
