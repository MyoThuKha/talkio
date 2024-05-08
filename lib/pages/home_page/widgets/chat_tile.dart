import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChatTile extends StatelessWidget {
  final int index;
  final String profile;
  final String username;
  final String description;
  final String time;
  final bool isNew;
  const ChatTile({
    super.key,
    required this.index,
    required this.profile,
    required this.username,
    required this.description,
    required this.time,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6, right: 15, left: 15),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 120,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(28),
                    image: DecorationImage(
                      image: NetworkImage(profile),
                      fit: BoxFit.cover,
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username),
                  Text(description),
                ],
              )
            ],
          ),
          Positioned(
            right: 15,
            top: 15,
            child: Container(
              height: 28,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.white, fontSize: 8),
                  ),
                  const SizedBox(width: 4),
                  isNew
                      ? const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.amber,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    ).animate().fadeIn(
          begin: 0,
          delay: Duration(milliseconds: index * 200),
        );
  }
}
