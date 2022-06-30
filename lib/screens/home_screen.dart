import 'package:flutter/material.dart';

import '../models/my_media.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.listData}) : super(key: key);

  static String routeName = '/';
  final List<MyMedia> listData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Youtube"),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(listData[index].coverPicture!),
                      fit: BoxFit.cover),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                dense: true,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(listData[index].coverPicture!),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(listData[index].title!),
                ),
                subtitle: Text("${listData[index].title} . 20000 . 25/6/2022"),
                trailing: Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: const Icon(Icons.more_vert)),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: listData.length,
      ),
    );
  }
}
