import 'package:flutter/material.dart';

import '../models/my_media.dart';
import '../widgets/video_list_tile.dart';

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
          return VideoListTile(listData: listData[index]);
        },
        separatorBuilder: (context, index) => const Divider(
          height: 10.0,
          color: Colors.grey,
        ),
        itemCount: listData.length,
      ),
    );
  }
}
