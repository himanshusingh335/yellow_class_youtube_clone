import 'package:flutter/material.dart';
import 'package:yellow_class_youtube_clone/screens/navigation_screen.dart';

void main() {
  runApp(const YellowClassYoutube());
}

class YellowClassYoutube extends StatelessWidget {
  const YellowClassYoutube({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.yellow),
      darkTheme: ThemeData.dark(),
      initialRoute: MyNavigationBar.routeName,
      routes: {
        MyNavigationBar.routeName: (context) => const MyNavigationBar(),
      },
    );
  }
}
