import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final String profile;
  const MessageCard({super.key, required this.message, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              decoration: const BoxDecoration(
                color: Colors.black,
                // borderRadius: BorderRadius.circular(25),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10), top: Radius.circular(25)),
              ),
              child: Center(
                child: Text(
                  message,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.amber,
                backgroundImage: NetworkImage(profile),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3,right: 3),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.yellow[300],
                  child: const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
