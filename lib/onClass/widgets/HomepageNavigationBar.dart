import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testxd/onClass/Pages/ProductList.dart';
import 'package:testxd/onClass/Pages/cart.dart';
import 'package:testxd/onClass/shares/system_provider.dart';

class Homepagenavigationbar extends ConsumerStatefulWidget {
  const Homepagenavigationbar({super.key});

  @override
  ConsumerState<Homepagenavigationbar> createState() =>
      _HomepagenavigationbarState();
}

class _HomepagenavigationbarState extends ConsumerState<Homepagenavigationbar> {
  int _selectedIndex = 0;
  final titles = ["Product List", "My Cart", "Profile"];
  final List<Widget> pages = [
    ProductList(),
    const CartPage(),
    const Text("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    // Cart length is watched here so the badge updates when products are added.
    final cartLength = ref.watch(myCartProvider).length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        title: Text(titles[_selectedIndex]),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart_outlined),
                if (cartLength > 0)
                  Positioned(
                    right: -6,
                    top: -6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartLength.toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
              ],
            ),
            label: "Cart",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
