import 'package:flutter/material.dart';

class FittedBoxScreen extends StatelessWidget {
  const FittedBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รูปวงกลม'),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          height: 200,
          width: 200,
          child: const FittedBox(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('ข้อความ'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
