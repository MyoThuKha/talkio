import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkio/pages/profile/profile_page_code.dart';

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

      body: Column(
        children: [
          // --------------------- Unread Messages Section ----------------------
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(child: "Unread Messages"),
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 2.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width / 2.5,
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      SectionTitle(child: "Chat"),
                    ],
                  ),
              
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(31),
                          ),
                          height: MediaQuery.of(context).size.width / 3.5,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: GestureDetector(
        onHorizontalDragStart: (details) {
          print("Hello world");
        },
        child: Container(
          width: 18,
          height: MediaQuery.of(context).size.width / 4.5,
          decoration: BoxDecoration(
            // color: Colors.red,
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}


class SectionTitle extends StatelessWidget {
  final String child;
  const SectionTitle({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(child, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
