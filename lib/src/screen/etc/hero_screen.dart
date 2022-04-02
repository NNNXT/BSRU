import 'package:flutter/material.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({Key? key}) : super(key: key);

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen>
    with SingleTickerProviderStateMixin {
  bool isChanged = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    void trigger() {
      setState(() {
        isChanged = !isChanged;
        isChanged ? controller.forward() : controller.reverse();
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Column(
          children: [
            Hero(
              tag: "hero",
              child: Image.asset('lib/images/iconlandingpage.png'),
            ),
            IconButton(
              iconSize: 150,
              onPressed: trigger,
              icon: AnimatedIcon(
                icon: AnimatedIcons.pause_play,
                progress: controller,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
