import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        var userData = data[index];
                        return Card(
                          child: ListTile(
                            onTap: () async {
                              if (userData['gender'] == 'F') {
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userData.id)
                                    .update({'gender': 'M'});
                              } else {
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userData.id)
                                    .update({'gender': 'F'});
                              }
                            },
                            leading: Image.network(userData['avatar']),
                            title: Row(
                              children: [
                                userData['gender'] == 'M'
                                    ? const Icon(
                                        Icons.male,
                                        color: Colors.blue,
                                      )
                                    : const Icon(
                                        Icons.female,
                                        color: Colors.pink,
                                      ),
                                Text(
                                  '${userData['first_name']} ${userData['last_name']}',
                                ),
                              ],
                            ),
                            subtitle: Text(userData['email']),
                            trailing: IconButton(
                              onPressed: () async {
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userData.id)
                                    .delete();
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        );
                      },
                      itemCount: data.length,
                    );
                  }
                  return const CircularProgressIndicator();
                },
              )
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (_, index) {
              //     var data = MockupData().data[index];
              //     return Card(
              //       child: ListTile(
              //         leading: Image.asset('lib/images/iconlandingpage.png'),
              //         title: Text(data['name'].toString()),
              //         subtitle: Text(
              //             '${data['category'].toString()} \n ${data['countMember'].toString()} members'),
              //       ),
              //     );
              //   },
              //   itemCount: mockupData.length,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
