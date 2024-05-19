import 'package:flutter/material.dart';
import 'package:talkio/pages/home_page/widgets/chat_tile.dart';
import 'package:talkio/pages/home_page/widgets/message_card.dart';
import 'package:talkio/pages/profile/profile_page.dart';
import 'package:talkio/styles/app_theme.dart';
import 'package:talkio/widgets/expandable_fab.dart';

class HomePage extends StatefulWidget {
  static const String route = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController _chatScrollController = ScrollController();
  bool fabOpen = false;

  @override
  void dispose() {
    _chatScrollController.removeListener(_scrollListener);
    _chatScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _chatScrollController.addListener(_scrollListener);
    super.initState();
  }
  void _scrollListener() {
    if (!_chatScrollController.position.isScrollingNotifier.value) {
      // Calculate the position of the nearest full item
      double itemHeight = 120;
      double offset = _chatScrollController.offset;
      double itemPosition = offset / itemHeight;
      int nearestItemIndex = itemPosition.round();

      // Scroll to the nearest full item
      _chatScrollController.animateTo(
        nearestItemIndex * itemHeight,
        duration: const Duration(milliseconds: 500), // Adjust duration as needed
        curve: Curves.easeInOut,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffc5c5c5),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 120,
        title: const Text(
          "Welcome, John",
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, ProfilePage.route);
            },
            child: const CircleAvatar(
              radius: 28,
              backgroundColor: Colors.amber,
            ),
          ),
          const SizedBox(width: 12),
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
                    controller: _chatScrollController,
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
