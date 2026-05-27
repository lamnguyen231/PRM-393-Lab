import 'package:flutter/material.dart';
import 'package:testxd/widgets/ProductionWidget.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 1 ; i <= 5; i++) Productionwidget()
      ],
    );
  }
}