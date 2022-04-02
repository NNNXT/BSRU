import 'package:flutter/material.dart';
import 'package:openchat/data/mockdata.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mockupData = MockupData().data;
    double width = MediaQuery.of(context).size.width;
    double widthwithoutPadding = width - (18 * 2);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SelectableText(
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  var data = MockupData().data[index];
                  return Card(
                    color: index % 2 == 0 ? Colors.red : Colors.green,
                    child: Row(
                      children: [
                        Image.asset(
                          'lib/images/iconlandingpage.png',
                          width: widthwithoutPadding * 0.25,
                          height: widthwithoutPadding * 0.25,
                        ),
                        SizedBox(
                          width: widthwithoutPadding * 0.7,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data['name'].toString()),
                                  const Text('19.13'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: widthwithoutPadding * 0.6,
                                    child: const Text(
                                      '(Last message) BusinessBringing you closer to the people',
                                      maxLines: 1,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(12, 4, 12, 4),
                                      child: Text(
                                        '5',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
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
