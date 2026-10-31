import 'package:flutter/material.dart';

import 'TrangHoSo.dart';
import 'Trang1.dart';
import 'Trang2.dart';
import 'Trang4.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ho So Ca Nhan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const TrangChu(),
    );
  }
}

class TrangChu extends StatefulWidget {
  const TrangChu({super.key});

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  // Lưu mục menu đang được chọn
  int selectedIndex = 0;

  // Danh sách các màn hình hiển thị trong body
  final List<Widget> pages = [TrangHoSo(), Trang1(), Trang2(), Trang4()];

  // Danh sách tên menu
  final List<String> menuItems = ['Home', 'Trang1', 'Trang2','Trang 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hồ Sơ Cá Nhân', 
        style: TextStyle(fontSize: 40, fontFamily: 'Northwell'),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      // Thanh menu
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                'MENU',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            // Tạo các mục menu
            ...List.generate(menuItems.length, (index) {
              return ListTile(
                leading: Icon(
                  index == 0
                      ? Icons.home
                      : index == 1
                      ? Icons.looks_one
                      : Icons.looks_two,
                ),
                title: Text(menuItems[index]),
                selected: selectedIndex == index,
                selectedTileColor: Colors.indigo.shade100,

                // Xử lý sự kiện click
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });

                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),

      // Nội dung thay đổi theo menu được chọn
      body: pages[selectedIndex],
    );
  }
}
