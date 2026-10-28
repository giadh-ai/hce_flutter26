import 'package:flutter/material.dart';

class CongViec {
  String tieuDe;
  bool hoanThanh;
  CongViec(this.tieuDe, {this.hoanThanh = false});
}

class Trang2 extends StatefulWidget {
  const Trang2({super.key});
  @override
  State<Trang2> createState() => _TrangTodoState();
}

class _TrangTodoState extends State<Trang2> {
  final List<CongViec> _dsCongViec = [
    CongViec('Hoc Dart co ban'),
    CongViec('Hoc Flutter widget'),
  ];
  final TextEditingController _controller = TextEditingController();
  void _themCongViec() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _dsCongViec.add(CongViec(_controller.text.trim()));
      _controller.clear();
    });
  }

  void _toggleHoanThanh(int index) {
    setState(() {
      _dsCongViec[index].hoanThanh = !_dsCongViec[index].hoanThanh;
    });
  }

  void _xoaCongViec(int index) {
    setState(() => _dsCongViec.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sach cong viec')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Nhap cong viec moi...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _themCongViec, child: Text('Them')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _dsCongViec.length,
              itemBuilder: (context, index) {
                final cv = _dsCongViec[index];
                return ListTile(
                  leading: Checkbox(
                    value: cv.hoanThanh,
                    onChanged: (_) => _toggleHoanThanh(index),
                  ),
                  title: Text(cv.tieuDe),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _xoaCongViec(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
