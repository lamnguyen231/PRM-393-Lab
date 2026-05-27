import 'package:flutter/material.dart';

import 'exercise1_core_widgets.dart';
import 'exercise2_input_controls.dart';
import 'exercise3_layout_demo.dart';
import 'exercise4_app_structure_theme.dart';
import 'exercise5_common_ui_fixes.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Đây là trang chính của toàn bộ lab.
    return Scaffold(
      appBar: AppBar(
        // AppBar giúp người học biết đang ở menu nào.
        title: const Text('Lab 4 - Flutter UI Fundamentals'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Dòng giới thiệu ngắn cho màn hình menu.
          const Text(
            'Tap an exercise to open its demo screen.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          // Mỗi mục menu mở một bài tập riêng.
          _MenuTile(
            title: 'Exercise 1 - Core Widgets',
            subtitle: 'Text, image, icon, card, list tile',
            icon: Icons.widgets,
            page: const Exercise1CoreWidgets(),
          ),
          _MenuTile(
            title: 'Exercise 2 - Input Controls',
            subtitle: 'Slider, switch, radio, picker',
            icon: Icons.tune,
            page: const Exercise2InputControls(),
          ),
          _MenuTile(
            title: 'Exercise 3 - Layout Demo',
            subtitle: 'Column, row, padding, list view',
            icon: Icons.view_column,
            page: const Exercise3LayoutDemo(),
          ),
          _MenuTile(
            title: 'Exercise 4 - App Structure & Theme',
            subtitle: 'Scaffold, AppBar, ThemeData',
            icon: Icons.palette,
            page: const Exercise4AppStructureTheme(),
          ),
          _MenuTile(
            title: 'Exercise 5 - Common UI Fixes',
            subtitle: 'Spacing, overflow, responsiveness',
            icon: Icons.build_circle,
            page: const Exercise5CommonUiFixes(),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.page,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    // Card + ListTile giúp từng mục menu rõ ràng và dễ bấm.
    return Card(
      // Margin tạo khoảng cách giữa các mục trong danh sách.
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        // Icon + text giúp người học nhận ra nội dung bài nhanh hơn.
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Mở màn hình bài tập đã chọn.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
