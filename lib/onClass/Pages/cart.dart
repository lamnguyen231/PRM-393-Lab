import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testxd/onClass/shares/system_provider.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the cart provider so this page updates after add/remove actions.
    final cart = ref.watch(myCartProvider);

    return cart.isEmpty
        ? const Center(
            child: Text("Cart is empty", style: TextStyle(fontSize: 18)),
          )
        : ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final product = cart[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: SizedBox(
                    width: 60,
                    height: 60,
                    child: (product.image ?? "").startsWith("assets/")
                        ? Image.asset(product.image ?? "", fit: BoxFit.cover)
                        : Image.network(
                            product.image ?? "",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const ColoredBox(
                                color: Color(0xFFE0E0E0),
                                child: Center(
                                  child: Icon(Icons.image_not_supported),
                                ),
                              );
                            },
                          ),
                  ),
                  title: Text(product.name ?? ""),
                  subtitle: Text("${product.price?.toStringAsFixed(2) ?? 0}\$"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Remove the matching product from the cart by id.
                      ref.read(myCartProvider.notifier).remove(product);
                    },
                  ),
                ),
              );
            },
          );
  }
}
