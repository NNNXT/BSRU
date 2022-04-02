import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openchat/src/screen/etc/circleavatar.dart';
import 'package:openchat/src/screen/etc/cupertino_widget.dart';
import 'package:openchat/src/screen/etc/expanded.dart';
import 'package:openchat/src/screen/etc/fittedbox_screen.dart';
import 'package:openchat/src/screen/etc/flexible.dart';
import 'package:openchat/src/screen/etc/get_api.dart';
import 'package:openchat/src/screen/etc/gridview_screen.dart';
import 'package:openchat/src/screen/etc/hero_screen.dart';
import 'package:openchat/src/screen/etc/localization.dart';
import 'package:openchat/src/screen/etc/placeholder_screen.dart';
import 'package:openchat/src/screen/etc/post_api.dart';
import 'package:openchat/src/screen/etc/rich_text.dart';
import 'package:openchat/src/screen/etc/snackbar_screen.dart';
import 'package:openchat/src/screen/etc/wrap_screen.dart';

class ETCContent extends StatelessWidget {
  const ETCContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const HeroScreen()),
                );
              },
              child: Hero(
                tag: "hero",
                child: Image.asset('lib/images/iconlandingpage.png'),
              ),
            ),
            const Divider(
              color: Colors.red,
              thickness: 3,
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GetApi())),
                title: Text(
                  'การเชื่อมต่อ API แบบ Get',
                  style: GoogleFonts.prompt(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            const Divider(
              color: Colors.red,
              thickness: 3,
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PostAPI())),
                title: const Text('การเชื่อมต่อ API แบบ Post'),
              ),
            ),
            const Divider(
              color: Colors.red,
              thickness: 3,
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Localization())),
                title: const Text('การเปลี่ยนภาษา'),
              ),
            ),
            const Divider(
              color: Colors.red,
              thickness: 3,
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ReichText())),
                title: const Text('การเน้นข้อความ'),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FlexibleScreen())),
                title: const Text('การแบ่งขนาดหน้าจอ'),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExpandedScreen())),
                title: const Text('Expanded'),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CircleAvatarScreen())),
                title: const Text('CircleAvatar'),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WrapScreen())),
                title: const Text('Wrap widget'),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FittedBoxScreen())),
                title: const Text('Fitted Box widget'),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SnackBarScreen())),
                title: const Text('Snackbar Widget'),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CupertinoScreen())),
                title: const Text('Cupertino Widget'),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlaceHolderScreen())),
                title: const Text('PlaceHolder'),
              ),
            ),
            GestureDetector(
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GridViewScreen())),
                title: const Text('Gridview'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
