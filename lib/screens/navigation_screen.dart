import 'package:flutter/material.dart';
import 'package:yellow_class_youtube_clone/screens/home_screen.dart';
import '../services/fetch_video_list.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  MyNavigationBarState createState() => MyNavigationBarState();
}

class MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static List<Widget> widgetOptions = <Widget>[
    HomeScreen(
      items: getList(jsonStringList),
      title: 'Home',
    ),
    HomeScreen(items: getList(jsonStringList), title: 'Shorts'),
    HomeScreen(items: getList(jsonStringList), title: 'Create'),
    HomeScreen(items: getList(jsonStringList), title: 'Subscriptions'),
    HomeScreen(items: getList(jsonStringList), title: 'Library'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video),
                label: 'Shorts',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Create',
              backgroundColor: Colors.yellow,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions),
                label: 'Subscriptions',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                label: 'Library',
                backgroundColor: Colors.yellow),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 35,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
