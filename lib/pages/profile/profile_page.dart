import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talkio/animation/animated_button.dart';
import 'package:talkio/pages/profile/widgets/add_button.dart';
import 'package:talkio/widgets/glassmorphism_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const String route = "/profile";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int currIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 30),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(40),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                "https://impulse.aarafacademy.com/uploads/samples/g1.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 300,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 100),
                                    width: 100,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(40)),
                                    ),
                                  )
                                ],
                              ),
                          const Positioned(
                            top: 0,
                            right: 0,
                            child: AddButton()),
                            ],
                          ),
                        ],
                      ),
                  
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height / 100),
                        child: Stack(
                          children: [
                            GlassmorphismWidget(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 11,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  // borderRadius: BorderRadius.circular(12),
                                ),

                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 11,
                              child: TabBar(
                                  indicatorColor: Colors.transparent,
                                  dividerColor: Colors.transparent,

                                  indicator: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  tabs: const [
                                    Tab(
                                      child: Icon(Icons.people),
                                    ),
                                    Tab(
                                      child: Icon(Icons.people),
                                    ),
                                    Tab(
                                      child: Icon(Icons.people),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      )
                            
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedButton(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}