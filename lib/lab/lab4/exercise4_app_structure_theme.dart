import 'package:flutter/material.dart';

class Exercise4AppStructureTheme extends StatelessWidget {
  const Exercise4AppStructureTheme({super.key});

  @override
  Widget build(BuildContext context) {
    // Đọc theme hiện tại để có thể mở rộng nó.
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Theme(
      // Theme cục bộ này chỉ thay đổi giao diện của riêng màn hình này.
      data: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.indigo,
          secondary: Colors.orange,
          primaryContainer: Colors.indigo.shade100,
          secondaryContainer: Colors.orange.shade100,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      child: Scaffold(
        // Nền nhạt hơn giúp khối màu tím nổi bật hơn.
        backgroundColor: colorScheme.primaryContainer.withValues(alpha: 0.12),
        appBar: AppBar(
          // AppBar cũng lấy màu từ theme cục bộ.
          title: const Text('Exercise 4 - App Structure & Theme'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                // DrawerHeader là phần đầu của ngăn kéo điều hướng.
                child: Text('Lab navigation'),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home menu'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.palette),
                title: const Text('Exercise 4 theme demo'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text style lấy từ theme hiện tại.
              Text(
                'Theme-aware text',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                'This screen uses Theme.of(context) so the widgets follow the same app colors.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              // Đây là khối màu tím để nhìn theme rõ hơn.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  // Màu chính của theme hiển thị rõ ở đây.
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: DefaultTextStyle(
                  // Đổi text thành trắng để nổi trên nền tím.
                  style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Theme color block',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        // Mô tả ngắn để người học hiểu khối này làm gì.
                        'This block uses the primary theme color so the theme is easy to see.',
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          // Chip nhỏ để show style trong cùng theme block.
                          Chip(
                            label: Text('Primary'),
                            backgroundColor: Colors.white24,
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          Chip(
                            label: Text('Theme demo'),
                            backgroundColor: Colors.white24,
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Các nút này dùng màu trong colorScheme để thấy theme thay đổi.
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  // Ba nút này giúp thấy theme ảnh hưởng đến button styles.
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    label: const Text('Primary button'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility),
                    label: const Text('Outlined button'),
                  ),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.star),
                    label: const Text('Filled button'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Card gom phần demo cấu trúc vào một khối.
              Card(
                // Card này dùng secondaryContainer để cho thấy theme đổi màu diện rộng.
                color: colorScheme.secondaryContainer,
                child: ListTile(
                  leading: Icon(Icons.palette, color: colorScheme.primary),
                  title: const Text('AppBar + Drawer + ThemeData'),
                  subtitle: const Text('These are common app structure widgets.'),
                  trailing: Icon(Icons.chevron_right, color: colorScheme.primary),
                ),
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                // Thanh tiến trình dùng primary/secondary để dễ nhận ra theme.
                value: 0.6,
                backgroundColor: colorScheme.secondaryContainer,
                color: colorScheme.primary,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // BottomNavigationBar là widget cấu trúc app rất phổ biến.
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Theme'),
          ],
        ),
      ),
    );
  }
}
