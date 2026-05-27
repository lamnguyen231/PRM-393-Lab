import 'package:flutter/material.dart';

class Exercise1CoreWidgets extends StatelessWidget {
  const Exercise1CoreWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold tạo khung trang riêng cho bài tập này.
    return Scaffold(
      appBar: AppBar(
        // Tiêu đề màn hình để biết đây là bài nào.
        title: const Text('Exercise 1 - Core Widgets'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Dòng giới thiệu cho biết bài này minh hoạ gì.
          const Text(
            'This screen demonstrates the core widgets used in the lab.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // Căn trái để nội dung trông giống một thẻ sản phẩm.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text dùng để hiển thị tiêu đề của card.
                  const Text(
                    'Kirby Demo Product',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  // Image.asset lấy ảnh từ thư mục assets.
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/kirby-xd.jpg',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      // Icon thêm một dấu hiệu trực quan nhỏ.
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Icon widget'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Đoạn text ngắn này giải thích vai trò của nhóm widget bên trên.
                  const Text(
                    'Card + Row + Column + Padding help organize a clean UI.',
                  ),
                  const SizedBox(height: 12),
                  // ListTile rất hợp cho nội dung ngắn, có cấu trúc.
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.shopping_bag),
                    title: Text('ListTile example'),
                    subtitle: Text('Useful for menu rows and item summaries.'),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    // Nút này chỉ là ví dụ cho button có icon.
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Action button'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
