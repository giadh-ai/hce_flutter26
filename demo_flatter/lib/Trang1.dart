import 'package:flutter/material.dart';

class Trang1 extends StatelessWidget {
  const Trang1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('images/anh1.jpg'),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/anh2.jpg"),
          ),
          Text(
            'Xin chào Việt Nam',
            style: TextStyle(fontSize: 20, fontFamily: 'Northwell'),
            softWrap: true,
          ),

          Row(
            children: [
              Image.asset(
                'images/anh1.jpg',
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 50),
              Image.asset(
                'images/anh2.jpg',
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
