import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        children: [
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
          Image.asset('lib/images/iconlandingpage.png'),
        ],
      ),
    );
  }
}
