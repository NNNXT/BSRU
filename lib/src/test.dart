import 'package:flutter/material.dart';

class TestColumn extends StatefulWidget {
  const TestColumn({Key? key}) : super(key: key);

  @override
  State<TestColumn> createState() => _TestColumnState();
}

class _TestColumnState extends State<TestColumn> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
        const Text('data'),
      ],
    );
  }
}
