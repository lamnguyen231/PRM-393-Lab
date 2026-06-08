import 'package:flutter/material.dart';
import 'package:testxd/lab/lab1/lab1.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Detail page opened when a product card is tapped.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.network(
                product.image!,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const ColoredBox(
                    color: Color(0xFFE0E0E0),
                    child: Center(child: Icon(Icons.image_not_supported)),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${product.price.toString()}\$",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(product.description!, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
