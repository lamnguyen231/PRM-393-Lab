import 'package:flutter/material.dart';

class Exercise2InputControls extends StatefulWidget {
  const Exercise2InputControls({super.key});

  @override
  State<Exercise2InputControls> createState() => _Exercise2InputControlsState();
}

class _Exercise2InputControlsState extends State<Exercise2InputControls> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double _rating = 3;
  bool _available = true;
  String _category = 'Laptop';
  String _summary = 'No value yet';

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Trang này minh hoạ cách các widget nhập liệu phối hợp trong Form.
    return Scaffold(
      appBar: AppBar(
        // Tên bài để người học biết đây là phần input.
        title: const Text('Exercise 2 - Input Controls'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Dòng giới thiệu cho bài tập này.
            const Text(
              'This screen demonstrates Flutter input widgets.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // TextFormField dùng để nhập thông tin sản phẩm cơ bản.
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Product name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                // Kiểm tra không được để trống.
                if (value == null || value.trim().isEmpty) {
                  return 'Enter a product name';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                // Giá phải là số dương hợp lệ.
                final parsed = double.tryParse(value ?? '');
                if (parsed == null || parsed <= 0) {
                  return 'Enter a valid price';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Slider tạo điều khiển số đơn giản cho mức đánh giá.
            Text('Rating: ${_rating.toStringAsFixed(0)}'),
            Slider(
              value: _rating,
              min: 1,
              max: 5,
              divisions: 4,
              label: _rating.toStringAsFixed(0),
              onChanged: (value) {
                setState(() => _rating = value);
              },
            ),
            // SwitchListTile kết hợp nhãn và công tắc bật/tắt.
            SwitchListTile(
              value: _available,
              title: const Text('Available now'),
              onChanged: (value) {
                setState(() => _available = value);
              },
            ),
            const SizedBox(height: 8),
            // RadioListTile cho phép chọn 1 mục trong nhóm lựa chọn.
            const Text('Category'),
            RadioListTile<String>(
              value: 'Laptop',
              groupValue: _category,
              title: const Text('Laptop'),
              onChanged: (value) {
                setState(() => _category = value!);
              },
            ),
            RadioListTile<String>(
              value: 'Accessory',
              groupValue: _category,
              title: const Text('Accessory'),
              onChanged: (value) {
                setState(() => _category = value!);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Chỉ khi form hợp lệ thì mới tạo chuỗi kết quả.
                if (_formKey.currentState!.validate()) {
                  // Đọc giá trị hiện tại và hiển thị kết quả bên dưới.
                  setState(() {
                    _summary =
                        '${_nameController.text} | ${_priceController.text} | rating ${_rating.toStringAsFixed(0)} | available $_available | category $_category';
                  });
                }
              },
              child: const Text('Submit input'),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Result: $_summary'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
