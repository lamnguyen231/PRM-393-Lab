import 'package:flutter/material.dart';
import 'package:testxd/lab/lab1/lab1.dart';
import 'package:testxd/Pages/product_detail.dart';

class ProductWidget extends StatefulWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    // InkWell makes the whole card tappable and opens the detail page.
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetail(product: widget.product),
          ),
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
                    child: Image.network(
                      widget.product.image!,
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
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: isFavourite ? Colors.red : Colors.grey,
                      ),
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
                        widget.product.name,
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
                widget.product.description!,
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
