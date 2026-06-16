import 'package:flutter/material.dart';
import 'package:testxd/onClass/widgets/HomepageNavigationBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // HomePage now delegates the full scaffold to the bottom navigation widget.
    return const Homepagenavigationbar();
  }
}
