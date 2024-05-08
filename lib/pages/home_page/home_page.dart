import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talkio/pages/home_page/widgets/chat_tile.dart';
import 'package:talkio/pages/home_page/widgets/message_card.dart';
import 'package:talkio/styles/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:talkio/widgets/expandable_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool fabOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc5c5c5),
      appBar: AppBar(
        toolbarHeight: 120,
        title: const Text("Welcome, John"),
        backgroundColor: const Color(0xffc5c5c5),
        actions: const [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.amber,
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: screenPadding,
                  child: Text(
                    "Unread Messages",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 2.3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => const MessageCard(message: "Lorem ipsum", profile: "https://impulse.aarafacademy.com/uploads/samples/g1.jpg"),
                  ),
                ),
                Padding(
                  padding: screenPadding,
                  child: Text(
                    "Chats",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 50,
                    itemBuilder: (context, index) => ChatTile(
                      index: index,
                      profile: "https://impulse.aarafacademy.com/uploads/samples/g1.jpg",
                      username: "Lucy",
                      description: "Lorem ipsum",
                      time: "yestarday",
                      isNew: index % 2 == 0 ? true : false,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const ExpandableFab(),
    );
  }
}
