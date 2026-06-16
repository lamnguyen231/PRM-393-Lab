import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testxd/main.dart';

void main() {
  testWidgets('Product home screen opens and navigates', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    expect(find.text('Product List'), findsOneWidget);
    expect(find.text('Kirby'), findsWidgets);
    expect(find.text('Meta Knight'), findsOneWidget);
    expect(find.text('King Dedede'), findsOneWidget);
    expect(find.text('Waddle Dee'), findsOneWidget);
    expect(find.text('Cart'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('add to cart'), findsWidgets);

    // Favorite button adds the product to the shared cart.
    await tester.tap(find.text('add to cart').first);
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    // Bottom navigation switches to the cart tab and shows the added product.
    await tester.tap(find.text('Cart'));
    await tester.pump();
    expect(find.text('My Cart'), findsOneWidget);
    expect(find.byIcon(Icons.delete), findsOneWidget);

    // Removing from cart returns the page to its empty state.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();
    expect(find.text('Cart is empty'), findsOneWidget);

    // Go back to the product list for the detail navigation check.
    await tester.tap(find.text('Home'));
    await tester.pump();
    expect(find.text('Product List'), findsOneWidget);

    // Tapping a product opens its detail page.
    await tester.tap(find.text('Kirby').first);
    await tester.pumpAndSettle();
    expect(find.text('120.0\$'), findsWidgets);

    // Back returns to the product grid.
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Product List'), findsOneWidget);
  });
}
