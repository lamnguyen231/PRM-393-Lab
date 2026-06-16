import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testxd/onClass/Pages/product_detail.dart';
import 'package:testxd/onClass/entities/Product.dart';
import 'package:testxd/onClass/shares/system_provider.dart';

class ProductWidget extends ConsumerStatefulWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  ConsumerState<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends ConsumerState<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    // The heart icon reflects whether this product is currently in the cart.
    final cart = ref.watch(myCartProvider);
    final bool isFavourite = cart.any((e) => e.id == widget.product.id);

    // InkWell makes the whole card tappable and opens the detail page.
    return InkWell(
      onTap: () {
        ref.read(selectedProduct.notifier).select(widget.product);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProductDetail()),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: (widget.product.image ?? "").startsWith("assets/")
                        ? Image.asset(
                            widget.product.image ?? "",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            widget.product.image ?? "",
                            width: double.infinity,
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
                  Positioned(
                    top: 10,
                    right: 10,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: isFavourite ? Colors.red : Colors.blue,
                      ),
                      onPressed: () {
                        final cartNotifier = ref.read(myCartProvider.notifier);
                        if (isFavourite) {
                          cartNotifier.remove(widget.product);
                        } else {
                          cartNotifier.add(widget.product);
                        }
                      },
                      child: const Text("Add to cart"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.product.name ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text("${widget.product.price.toString()}\$"),
                  ],
                ),
              ),
              Text(
                widget.product.description ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
