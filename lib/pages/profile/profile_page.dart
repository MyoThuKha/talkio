import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talkio/animation/animated_button.dart';
import 'package:talkio/animation/animated_transition.dart';
import 'package:talkio/pages/profile/info_section.dart';
import 'package:talkio/pages/profile/widgets/add_button.dart';
import 'package:talkio/services/auth_service.dart';
import 'package:talkio/styles/clippings/profile_clipping.dart';
import 'package:talkio/widgets/glassmorphism_widget.dart';
import 'package:talkio/widgets/main_btn.dart';
import 'package:talkio/widgets/vertical_expand_fab.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const String route = "/profile";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int currIndex = 1;
  bool goBack = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BackTransition(
        btn: GestureDetector(
          onTap: ()async{
            setState(() {
              goBack = true;
            });
            await Future.delayed(const Duration(seconds: 3));
            setState(() {
              goBack = false;
            });
          },
          child: Container(
            width:  80,
            height:  80,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ).animate(
            target: goBack ? 1 : 0,
          ).scale(
            duration: const Duration(milliseconds: 400),
            begin: const Offset(1, 1),
            end: const Offset(20, 20),
            // width: goBack ? 80000: 80,
            // height: goBack ? 80000: 80,

          ),
        ),
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
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Theme.of(context).colorScheme.primary,
                            //     // borderRadius: BorderRadius.circular(40),
                            //     image: const DecorationImage(
                            //       image: NetworkImage(
                            //         "https://impulse.aarafacademy.com/uploads/samples/g1.jpg",
                            //       ),
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            //   child: Image.asset("assets/profile_frame.png"),
                            // ),

                            ClipPath(
                              clipper: ProfileClipper(),
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.network(
                                  "https://images.pexels.com/photos/14755738/pexels-photo-14755738.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                    fit: BoxFit.cover,
                                ),
                              
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              // right: 15,
                              child: AddButton(),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 100,
                            horizontal: MediaQuery.of(context).size.width / 20
                          ),
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
                                      color: Colors.amber.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    tabs: const [
                                      Tab(child: Icon(Icons.people)),
                                      Tab(child: Icon(CupertinoIcons.signature,size: 30,)),
                                      Tab(child: FaIcon(FontAwesomeIcons.hammer,size: 18,)),
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
                    child: const TabBarView(
                      children: [
                        InfoSection(),
                        InfoSection(),
                        InfoSection(),
                      ],
                    ),
                  ),
                ),
        
        
        
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 12),
      //       child: SafeArea(
      //         child: AnimatedButton(
      //           onTap: (){
      //             Navigator.pop(context);
      //           },
      //           child: const CircleAvatar(
      //             radius: 30,
      //             child: Icon(Icons.arrow_back),
      //           ),
      //         ),
      //       ),
      //     ).animate().slideY(
      //           end: 0,
      //           begin: 10,
      //           duration: const Duration(milliseconds: 1500),
      //           curve: Curves.easeOut,
      //         ),
      //   ],
      // ),
    );
  }
}
