import 'package:flutter/material.dart';

class ReichText extends StatelessWidget {
  const ReichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การเน้นข้อความ'),
      ),
      body: Center(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: <TextSpan>[
              TextSpan(text: 'ยกตัวอย่าง '),
              TextSpan(
                text: 'ข้อความที่อยากเน้น',
                style: TextStyle(color: Colors.blue, fontSize: 24),
              ),
              TextSpan(text: ' ยกตัวอย่าง'),
            ],
          ),
        ),
      ),
    );
  }
}
