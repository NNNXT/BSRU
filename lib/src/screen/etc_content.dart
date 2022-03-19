import 'package:flutter/material.dart';
import 'package:openchat/src/screen/etc/get_api.dart';
import 'package:openchat/src/screen/etc/image_picker.dart';
import 'package:openchat/src/screen/etc/localization.dart';
import 'package:openchat/src/screen/etc/post_api.dart';

class ETCContent extends StatelessWidget {
  const ETCContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const GetApi())),
              title: const Text('การเชื่อมต่อ API แบบ Get'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PostAPI())),
              title: const Text('การเชื่อมต่อ API แบบ Post'),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Localization())),
              title: const Text('การเปลี่ยนภาษา'),
            ),
          ),
        ],
      ),
    );
  }
}
