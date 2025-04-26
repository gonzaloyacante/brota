// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:brota/main.dart';

void main() {
  testWidgets('Brota app test de navegación básica', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verifica que estamos en la pantalla de inicio
    expect(find.text('Inicio'), findsOneWidget);

    // Verifica que existe la barra de navegación
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verifica que existen los tres items de navegación
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.local_florist), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);

    // Navega al catálogo
    await tester.tap(find.byIcon(Icons.local_florist));
    await tester.pumpAndSettle();
    expect(find.text('Catálogo'), findsOneWidget);

    // Navega a configuración
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    expect(find.text('Configuración'), findsOneWidget);

    // Verifica elementos de la pantalla de configuración
    expect(find.text('Tema'), findsOneWidget);
    expect(find.text('Idioma'), findsOneWidget);
  });
}
