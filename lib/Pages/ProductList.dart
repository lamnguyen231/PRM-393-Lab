import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:testxd/lab/lab1/lab1.dart';
import 'package:testxd/widgets/ProductWidget.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});

  final List<Product> products = Product.products;

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder lets the grid change column count based on screen width.
    return LayoutBuilder(
      builder: (context, constraints) {
        return MasonryGridView.count(
          crossAxisCount: constraints.maxWidth < 450 ? 1 : 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: products.length,
          itemBuilder: (context, index) {
            // ProductWidget renders each product card in the masonry grid.
            return ProductWidget(product: products[index]);
          },
        );
      },
    );
  }
}
