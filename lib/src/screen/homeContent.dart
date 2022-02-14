import 'package:flutter/material.dart';
import 'package:openchat/data/mockdata.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mockupData = MockupData().data;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'OPENTALK',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 16),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                color: Colors.orange,
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  var data = MockupData().data[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset('lib/images/iconlandingpage.png'),
                      title: Text(data['name'].toString()),
                      subtitle: Text(
                          '${data['category'].toString()} \n ${data['countMember'].toString()} members'),
                    ),
                  );
                },
                itemCount: mockupData.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
