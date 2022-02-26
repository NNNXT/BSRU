import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Localization extends StatefulWidget {
  const Localization({Key? key}) : super(key: key);

  @override
  State<Localization> createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ระบบเปลี่ยนภาษา'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (context.locale.toString() == 'th') {
            context.setLocale(const Locale('en'));
          } else {
            context.setLocale(const Locale('th'));
          }
        },
        child: const Icon(Icons.language),
      ),
      body: Column(
        children: [
          Text(
            'language'.tr(),
            style: const TextStyle(fontSize: 32),
          ),
          Text(
            'title'.tr(),
            style: const TextStyle(fontSize: 32),
          ),
          Text(
            'bath'.plural(500),
            style: const TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }
}
