import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
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
              CarouselSlider(
                options: CarouselOptions(
                  disableCenter: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                ),
                items: imgList
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CachedNetworkImage(
                          imageUrl: item.toString(),
                          placeholder: (_, __) => const SkeletonAvatar(),
                          errorWidget: (_, __, ___) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )
                    .toList(),
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
