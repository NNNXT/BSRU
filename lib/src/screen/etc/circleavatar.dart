import 'package:flutter/material.dart';

class CircleAvatarScreen extends StatelessWidget {
  const CircleAvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รูปวงกลม'),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 50,
          child: Image.asset('lib/images/iconlandingpage.png'
              // 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg',
              ),
        ),
      ),
    );
  }
}
