import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../models/my_media.dart';

class VideoListTile extends StatelessWidget {
  const VideoListTile({
    Key? key,
    required this.listData,
  }) : super(key: key);

  final MyMedia listData;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('Container'),
      onVisibilityChanged: (VisibilityInfo info) {
        var visiblePercentage = info.visibleFraction * 100;
        debugPrint('Widget ${info.key} is $visiblePercentage% visible');
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(listData.coverPicture!),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              dense: true,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(listData.coverPicture!),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(listData.title!),
              ),
              subtitle: Text("${listData.title} . 20000 . 25/6/2022"),
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
