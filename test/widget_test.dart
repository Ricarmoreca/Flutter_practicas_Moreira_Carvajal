import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taskflow/main.dart';

void main() {
  testWidgets('updates pending tasks and disables completion at zero', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TaskFlowApp());

    final addButton = find.widgetWithText(ElevatedButton, 'Agregar tarea');
    final completeButton = find.widgetWithText(
      OutlinedButton,
      'Completar una tarea',
    );

    expect(find.text('Tareas pendientes: 3'), findsOneWidget);
    expect(find.text('Aún tienes tareas por organizar.'), findsOneWidget);
    expect(tester.widget<ElevatedButton>(addButton).onPressed, isNotNull);
    expect(tester.widget<OutlinedButton>(completeButton).onPressed, isNotNull);

    await tester.tap(addButton);
    await tester.tap(addButton);
    await tester.pump();
    expect(find.text('Tareas pendientes: 5'), findsOneWidget);

    for (var i = 0; i < 5; i++) {
      await tester.tap(completeButton);
      await tester.pump();
    }

    expect(find.text('Tareas pendientes: 0'), findsOneWidget);
    expect(
      find.text('¡Excelente! No tienes tareas pendientes.'),
      findsOneWidget,
    );
    expect(tester.widget<ElevatedButton>(addButton).onPressed, isNotNull);
    expect(tester.widget<OutlinedButton>(completeButton).onPressed, isNull);

    await tester.tap(addButton);
    await tester.pump();

    expect(find.text('Tareas pendientes: 1'), findsOneWidget);
    expect(find.text('Aún tienes tareas por organizar.'), findsOneWidget);
    expect(tester.widget<OutlinedButton>(completeButton).onPressed, isNotNull);
  });
}
