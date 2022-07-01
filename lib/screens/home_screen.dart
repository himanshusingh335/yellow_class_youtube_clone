import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yellow_class_youtube_clone/models/my_media.dart';

import '../services/flick_video_player.dart';
import '../widgets/flick_multi_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.items}) : super(key: key);
  final List<MyMedia> items;

  static String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickMultiManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && mounted) {
          flickMultiManager.pause();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Youtube'),
        ),
        body: ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      margin: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FlickMultiPlayer(
                          url: widget.items[index].videoUrl!,
                          flickMultiManager: flickMultiManager,
                          image: widget.items[index].coverPicture,
                        ),
                      )),
                  ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    dense: true,
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.items[index].coverPicture!),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(widget.items[index].title!),
                    ),
                    subtitle: Text(
                        "${widget.items[index].title} . 20000 . 25/6/2022"),
                    trailing: Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        child: const Icon(Icons.more_vert)),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
