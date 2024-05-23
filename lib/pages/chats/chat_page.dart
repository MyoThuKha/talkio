import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:talkio/animation/route_animation.dart';
import 'package:talkio/models/chat_model.dart';
import 'package:talkio/pages/settings/settings_page.dart';
import 'package:talkio/styles/input_style.dart';
import 'package:talkio/widgets/auto_sized_box.dart';
import 'package:talkio/widgets/custom_appbar.dart';

class ChatPage extends StatefulWidget {
  static const route = "/chat";
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

List<ChatModel> datas = [
  ChatModel(message: "Hey", sender: "mg", reactions: [], state: [], date: ''),
  ChatModel(message: "Hey what up", sender: "me", reactions: [], state: [], date: ''),
  ChatModel(message: "Let go watch a movies.", sender: "mg", reactions: [], state: [], date: ''),
  ChatModel(message: "Sound fun when", sender: "me", reactions: [], state: [], date: ''),
  ChatModel(message: "How bout 10 pm? sound good?",sender: "mg", reactions: [], state: [], date: ''),
  ChatModel(message: "Ok I will meet you there", sender: "me", reactions: [], state: [], date: ''),
].reversed.toList();

class _ChatPageState extends State<ChatPage> {
final _inputController = TextEditingController();
final _chatController = ScrollController();

@override
  void initState() {
    super.initState();
  }


@override
  void dispose() {
    _chatController.dispose();
    _inputController.dispose();
    super.dispose();
  }


  void scrollToTheEnd() {
    //need to go to the top cause of reverse
    final end = _chatController.position.minScrollExtent;
    _chatController.animateTo(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      end,
    );
  }

  void onSendMessage() {
    if (_inputController.text.isEmpty) {
      return;
    }
    setState(() {
      datas = [
        ChatModel(
            message: _inputController.text,
            sender: "me",
            reactions: [],
            state: [],
            date: ''),
        ...datas,
      ];
    });
    scrollToTheEnd();
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(context: context, title: "Chat",actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, scaleCurveRoute(const SettingsPage()));
              },
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  "https://impulse.aarafacademy.com/uploads/samples/g1.jpg",
                ),
              ),
            ),
          ),
      
        ]),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _chatController,
                    reverse: true,
                    itemCount: datas.length,
                    itemBuilder: (context, index) => Align(
                      alignment: 
                      datas[index].sender == "me"?
                       Alignment.centerRight: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const AutoSizedBox(width: 20),
                          Container(
                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2),
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: datas[index].sender == "me"
                                  ? Colors.amber
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              datas[index].message,
                            ),
                          ),
      
                          //seen status
                          (datas[index].sender == "me" && (index == 0))
                              ? const SeenWidget()
                              : const AutoSizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: const Icon(
                        Icons.attach_file,
                      ),
                    ),
                    const AutoSizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _inputController,
                          decoration: sendInputStyle(
                            context,
                            suffix: InkWell(
                              onTap:
                              onSendMessage,
                              child: Ink(
                                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text("Send",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              )
              ],
            ),
          ),
        ),
      
      ),
    );
  }

}



class SeenWidget extends StatelessWidget {
  const SeenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 8,
      ),
    );
  }
}
