import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostAPI extends StatefulWidget {
  const PostAPI({Key? key}) : super(key: key);

  @override
  State<PostAPI> createState() => _PostAPIState();
}

class _PostAPIState extends State<PostAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การ Post API'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Dio dio = Dio();
            dio.options.contentType = Headers.formUrlEncodedContentType;
            var formData = FormData.fromMap({'message': 'สวัสดี'});
            dio.post('https://notify-api.line.me/api/notify',
                data: formData,
                options: Options(headers: {
                  "authorization":
                      "Bearer bkhDRx5Xb9xmc89KNLHcxhvqygE1FnjiwDTkxqWz9RO"
                }));
          },
          child: const Text('กดสิ'),
        ),
      ),
    );
  }
}
