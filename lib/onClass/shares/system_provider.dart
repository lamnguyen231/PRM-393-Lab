import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testxd/onClass/entities/Product.dart';

class MyCartNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() => [];

  // Add a product to the shared cart list.
  void add(Product product) {
    state = [...state, product];
  }

  // Remove a product from the shared cart list by id.
  void remove(Product product) {
    state = state.where((e) => e.id != product.id).toList();
  }
}

class SelectedProductNotifier extends Notifier<Product> {
  @override
  Product build() => Product.products.first;

  // Update the product shown by the detail page.
  void select(Product product) {
    state = product;
  }
}

// Stores products the user has added to the cart/favourite list.
final myCartProvider = NotifierProvider<MyCartNotifier, List<Product>>(
  MyCartNotifier.new,
);

// Stores the product selected from the list before opening the detail page.
final selectedProduct = NotifierProvider<SelectedProductNotifier, Product>(
  SelectedProductNotifier.new,
);
