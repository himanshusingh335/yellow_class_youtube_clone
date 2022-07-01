import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter/material.dart';

import '../models/my_media.dart';
import '../services/flick_video_player.dart';
import 'flick_multi_player.dart';

class VideoListTile extends StatefulWidget {
  const VideoListTile({Key? key, required this.item}) : super(key: key);
  final MyMedia item;

  @override
  State<VideoListTile> createState() => _VideoListTileState();
}

class _VideoListTileState extends State<VideoListTile> {
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
        if (visibility.visibleFraction != 1 && mounted) {
          flickMultiManager.pause();
        }
      },
      child: Card(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                margin: const EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FlickMultiPlayer(
                    url: widget.item.videoUrl!,
                    flickMultiManager: flickMultiManager,
                    image: widget.item.coverPicture,
                  ),
                )),
            ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              dense: true,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.item.coverPicture!),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(widget.item.title!),
              ),
              subtitle: Text("${widget.item.title} . 20000 . 25/6/2022"),
              trailing: Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: const Icon(Icons.more_vert)),
            ),
          ],
        ),
      ),
    );
  }
}
