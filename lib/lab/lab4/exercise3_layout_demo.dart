import 'package:flutter/material.dart';

class Exercise3LayoutDemo extends StatelessWidget {
  const Exercise3LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Các widget bố cục dễ hiểu hơn khi được đặt cạnh nhau.
    return Scaffold(
      appBar: AppBar(
        // Tiêu đề giúp xác định đây là bài layout.
        title: const Text('Exercise 3 - Layout Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Dòng giới thiệu cho bài bố cục.
          const Text(
            'This screen shows common layout widgets.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // Column xếp các phần demo theo chiều dọc.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row sắp xếp widget theo chiều ngang.
                  const Text('Row + Column'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        // Expanded giúp mỗi ô chia đều không gian.
                        child: Container(
                          height: 80,
                          color: Colors.deepPurple.shade100,
                          alignment: Alignment.center,
                          child: const Text('Expanded box 1'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        // Ô thứ hai cũng chiếm phần không gian còn lại.
                        child: Container(
                          height: 80,
                          color: Colors.deepPurple.shade200,
                          alignment: Alignment.center,
                          child: const Text('Expanded box 2'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Padding tạo khoảng đệm xung quanh con.
                  const Text('Padding + Align'),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Align(
                      // Align canh khối con sang trái.
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        color: Colors.orange.shade100,
                        child: const Text('A padded content block'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Stack cho phép các widget chồng lên nhau.
                  const Text('Stack + Positioned'),
                  const SizedBox(height: 12),
                  ClipRRect(
                    // ClipRRect cắt bo góc cho ảnh và vùng overlay.
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 180,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Ảnh nền nằm dưới cùng trong Stack.
                          Image.asset('assets/kirby-xd.jpg', fit: BoxFit.cover),
                          Positioned(
                            // Label này được đặt đè lên ảnh.
                            bottom: 12,
                            right: 12,
                            child: Chip(
                              backgroundColor: Colors.black.withValues(alpha: 0.6),
                              label: const Text(
                                'Overlay label',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Wrap tự xuống dòng khi không đủ chỗ.
                  const Text('Wrap for responsive chips'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      // Wrap tự chuyển chip xuống dòng khi thiếu chỗ.
                      Chip(label: Text('Column')),
                      Chip(label: Text('Row')),
                      Chip(label: Text('Expanded')),
                      Chip(label: Text('ListView')),
                      Chip(label: Text('Stack')),
                    ],
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
