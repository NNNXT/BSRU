import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  String imageUrl = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การ Get API'),
      ),
      body: Column(
        children: [
          if (imageUrl != '')
            loading
                ? const CircularProgressIndicator()
                : Image.network(imageUrl),
          ElevatedButton(
            onPressed: () async {
              setState(() {
                loading = true;
              });
              Dio dio = Dio();
              final response =
                  await dio.get('https://api.thecatapi.com/v1/images/search');
              setState(() {
                imageUrl = response.data[0]['url'];
                loading = false;
              });
            },
            child: const Text('กดสิ'),
          ),
        ],
      ),
    );
  }
}
