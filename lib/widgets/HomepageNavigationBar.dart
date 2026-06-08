import 'package:flutter/material.dart';
import 'package:testxd/Pages/ProductList.dart';

class Homepagenavigationbar extends StatefulWidget {
  const Homepagenavigationbar({super.key});

  @override
  State<Homepagenavigationbar> createState() => _HomepagenavigationbarState();
}

class _HomepagenavigationbarState extends State<Homepagenavigationbar> {
  int _selectedIndex = 0;
  final List<Widget> pages = [
    ProductList(),
    const Text("Setting"),
    const Text("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        title: const Text("Mama mia"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurpleAccent,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
