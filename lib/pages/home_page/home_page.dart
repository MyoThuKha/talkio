import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkio/pages/profile/profile_page_code.dart';
import 'package:talkio/widgets/auto_sized_box.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String name = "Myo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        toolbarHeight: 120,
        title: Text(
          "Welcome, $name",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        scrolledUnderElevation: 0,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, ProfilePage.route);
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              radius: 30,
            ),
          )
        ],
      ),

      body: Stack(
        children: [
          Column(
            children: [
              // --------------------- Unread Messages Section ----------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(child: "Unread Messages"),
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).width / 2.5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                width: MediaQuery.sizeOf(context).width / 2.5,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              );
                            }
                        ),
                      ),
              
                      //arrow indicator
                    ],
                  ),
                ],
              ),
          
              // --------------------- Chat Section ----------------------
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Chat Section: Title Bar
                      const Row(
                        children: [
                          SectionTitle(child: "Chat"),
                        ],
                      ),
                  
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              // Chat Section : Chat Item
                              return Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(31),
                                ),
                                height: MediaQuery.sizeOf(context).width / 3.5,
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Chat Item: profile picture
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.secondary,
                                        borderRadius: BorderRadius.circular(27),
                                      ),
                                      width: MediaQuery.sizeOf(context).width / 3.5,
                                    ),
                          
                                    const AutoSizedBox(width: 12),
                          
                                    // Chat Item: name and latest text
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "User",
                                            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.surface),
                                          ),
                                          Text(
                                            "Lorem ipsum",
                                            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Theme.of(context).colorScheme.surface),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Theme.of(context).colorScheme.surface,
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 4),
                                              child: Text(
                                                "Yesterday",
                                                style: Theme.of(context).textTheme.labelSmall,
                                              ),
                                            ),
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Theme.of(context).colorScheme.secondary,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          //------------------ Custom FAB ------------------------
          Positioned(
            bottom: 50,
            right: 2,
            child: GestureDetector(
              onTap: onClickFAB,
              onHorizontalDragStart: (details) {
                onClickFAB();
              },
              child: Container(
                width: 12,
                height: MediaQuery.sizeOf(context).width / 4.2,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  color: Theme.of(context).colorScheme.primary,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }

  void onClickFAB (){
    print("hllo worl");
  }
}


class SectionTitle extends StatelessWidget {
  final String child;
  const SectionTitle({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Text(child, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
