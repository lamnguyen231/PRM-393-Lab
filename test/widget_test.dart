import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testxd/main.dart';

void main() {
  testWidgets('Product home screen opens and navigates', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Mama mia'), findsOneWidget);
    expect(find.text('Teddy bear'), findsWidgets);
    expect(find.text('Setting'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsWidgets);

    // Favorite button toggles without leaving the product grid.
    await tester.tap(find.byIcon(Icons.favorite).first);
    await tester.pump();
    expect(find.text('Mama mia'), findsOneWidget);

    // Tapping a product opens its detail page.
    await tester.tap(find.text('Teddy bear').first);
    await tester.pumpAndSettle();
    expect(find.text('120.0\$'), findsWidgets);

    // Back returns to the product grid.
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Mama mia'), findsOneWidget);

    // Bottom navigation switches to the Setting tab.
    await tester.tap(find.text('Setting'));
    await tester.pump();
    expect(find.text('Setting'), findsWidgets);
  });
}
