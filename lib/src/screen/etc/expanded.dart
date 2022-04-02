import 'dart:ui';

import 'package:flutter/material.dart';

class ExpandedScreen extends StatelessWidget {
  const ExpandedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การเน้นข้อความ'),
      ),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Expanded(
            child: Text(
              'วิตเจ็ตตัวแรก',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: Text(
              'วิตเจ็ตตัวสอง',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
