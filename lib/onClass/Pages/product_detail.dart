import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testxd/onClass/entities/Product.dart';
import 'package:testxd/onClass/shares/system_provider.dart';

class ProductDetail extends ConsumerWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Product product = ref.watch(selectedProduct);

    // Detail page opened when a product card is tapped.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        foregroundColor: Colors.white,
        title: Text(product.name ?? ""),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: (product.image ?? "").startsWith("assets/")
                  ? Image.asset(
                      product.image ?? "",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      product.image ?? "",
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
              product.name ?? "",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${product.price.toString()}\$",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(product.description ?? "", style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
