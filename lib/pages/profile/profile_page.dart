import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkio/services/auth_service.dart';
import 'package:talkio/widgets/pill_tag.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const String route = "/profile";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   decoration: const BoxDecoration(
                //   color: Colors.black,
                //   ),
                //   width: MediaQuery.of(context).size.width/ 1.2,
                //   height: MediaQuery.of(context).size.height / 2.8,
                //   child: Image.network("https://impulse.aarafacademy.com/uploads/samples/g1.jpg",fit: BoxFit.cover,),
                // ),
                Expanded(
                  child: Text(
                    "John Harvard",
                    style: GoogleFonts.roboto(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -4,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.amber,
                    child: Column(
                      children: [
                        FilledButton(onPressed: (){
                          final service = AuthService();
                          service.logout();

                        }, child: Text("Log out")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.width /2,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  "https://impulse.aarafacademy.com/uploads/samples/g1.jpg",
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: CircleAvatar(
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