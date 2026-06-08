import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        actions: [IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.home))],
        title: Center(child: Text("About Page")),
      ),
      body: Center(child: Text("About Author")),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile "),
      ]),
    );
  }
}