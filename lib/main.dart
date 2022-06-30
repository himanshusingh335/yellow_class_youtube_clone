import 'package:flutter/material.dart';
import 'package:yellow_class_youtube_clone/models/my_media.dart';
import 'package:yellow_class_youtube_clone/screens/home_screen.dart';
import 'package:yellow_class_youtube_clone/services/fetch_video_list.dart';

void main() {
  runApp(const YellowClassYoutube());
}

class YellowClassYoutube extends StatelessWidget {
  const YellowClassYoutube({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<MyMedia> data = getList(jsonStringList);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(
              listData: data,
            ),
      },
    );
  }
}
