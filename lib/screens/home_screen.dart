import 'package:flutter/material.dart';
import 'package:yellow_class_youtube_clone/models/my_media.dart';
import 'package:yellow_class_youtube_clone/widgets/video_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.items}) : super(key: key);
  final List<MyMedia> items;

  static String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youtube'),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return VideoListTile(
            item: widget.items[index],
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 1.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
