import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';

class ChatPage extends StatefulWidget {
  static const route = "/chat";
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularText(children: [
                    TextItem(
                      text: const Text(
                        "MYO THU KHA",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      direction: CircularTextDirection.clockwise,
                      startAngle: 270,
                      startAngleAlignment: StartAngleAlignment.center,
                    )
                  ]),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.all(4),
                    width: 180,
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://impulse.aarafacademy.com/uploads/samples/g1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Hello world",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}