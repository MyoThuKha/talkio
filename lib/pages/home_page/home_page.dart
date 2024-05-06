
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc5c5c5),
      appBar: AppBar(
        title: const Text("Welcome, John"),
        backgroundColor: const Color(0xffc5c5c5),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Expanded(
          //   child: Container(
          //   ),
          // ),
          // const Divider(),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Unread Messages",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 2.3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(4),
                      width: MediaQuery.of(context).size.width / 2.3,
                      // height: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      ),
                      // child: Text(index.toString()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                              // height: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                // borderRadius: BorderRadius.circular(25),
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10),top: Radius.circular(25),),
                              ),
                              child: Center(
                                child: Text(
                                  "Hi, Good Morning Nice to meet youm y e",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.amber,
                            backgroundImage: NetworkImage("https://impulse.aarafacademy.com/uploads/samples/g1.jpg"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Text(
                  "Chats",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Expanded(
                   child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 50,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 6,right: 15,left: 15),
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(28),
                                  image: const DecorationImage(
                                    image: NetworkImage("https://impulse.aarafacademy.com/uploads/samples/g1.jpg"),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hi, Good morning"),
                                  Text(
                                    "Yestarday",
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
         
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}