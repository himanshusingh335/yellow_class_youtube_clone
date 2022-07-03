import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yellow_class_youtube_clone/models/my_media.dart';

import '../services/flick_video_player.dart';
import '../widgets/flick_multi_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.items, required this.title})
      : super(key: key);
  final List<MyMedia> items;
  final String title;

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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.network(
                  'https://images.yourstory.com/cs/images/companies/ce4c89ff9d3d-YellowClassLogo-1611551749492.jpg',
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_box),
                title: const Text('My Account'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on),
                title: const Text('Purchases and Memberships'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cast),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
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
                      child: Text(
                        widget.items[index].title!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: const Text(
                      "20k views . 25/6/2022",
                    ),
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
