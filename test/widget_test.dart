import 'package:flutter_test/flutter_test.dart';

import 'package:mi_unad_project/main.dart';

void main() {
  testWidgets('shows the dashboard home', (WidgetTester tester) async {
    await tester.pumpWidget(const MiUnadApp());

    expect(find.text('Buenos días, Berny.'), findsOneWidget);
    expect(find.text('Resumen del estudiante'), findsOneWidget);
    expect(find.text('Acceso rápido'), findsOneWidget);
    expect(find.text('Pago de matrícula'), findsWidgets);
    expect(find.text('Biblioteca Virtual'), findsWidgets);
    expect(find.text('Inicio'), findsOneWidget);
    expect(find.text('Académico'), findsOneWidget);
    expect(find.text('Pagos'), findsOneWidget);
  });
}
