import 'package:flutter/material.dart';

class TrangHoSo extends StatelessWidget {
  const TrangHoSo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ho So Sinh Vien'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA2fWj8r.img?w=768&h=512&m=6&x=120&y=120&s=280&d=280',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nguyen Van A',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('Lop: CNTT-K20'),
          ],
        ),
      ),
    );
  }
}
