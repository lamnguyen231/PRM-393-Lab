import 'package:flutter/material.dart';

class Exercise5CommonUiFixes extends StatelessWidget {
  const Exercise5CommonUiFixes({super.key});

  @override
  Widget build(BuildContext context) {
    // Màn hình này cho thấy cách xử lý các lỗi bố cục thường gặp.
    return Scaffold(
      appBar: AppBar(
        // Đây là bài cuối về sửa lỗi giao diện.
        title: const Text('Exercise 5 - Common UI Fixes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Dòng giới thiệu cho bài sửa giao diện.
          const Text(
            'This screen shows common UI improvements and fixes.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // Column giữ mọi thứ theo chiều dọc như một card sản phẩm.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AspectRatio giữ ảnh không bị quá cao.
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/kirby-xd.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // maxLines + ellipsis giúp không bị tràn chữ.
                  const Text(
                    'Responsive product title that will not overflow on smaller screens.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This description is intentionally longer so you can see how maxLines and ellipsis help prevent overflow in cards and lists.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  // Chip giúp phần hiển thị gọn hơn text thô.
                  Row(
                    children: [
                      // Chip nhỏ dùng để minh hoạ nhãn trạng thái.
                      Chip(
                        label: const Text('Safe spacing'),
                        backgroundColor: Colors.green.shade100,
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: const Text('No overflow'),
                        backgroundColor: Colors.blue.shade100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Tách giá và nút ra cho dễ nhìn.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Giá nằm bên trái, nút hành động nằm bên phải.
                      const Text('Price: 1,200,000'),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Buy now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                // Tạo từng dòng động thay vì viết lặp thủ công.
                return ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text('UI fix ${index + 1}'),
                  subtitle: const Text('Padding, overflow, and theme cleanup.'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
