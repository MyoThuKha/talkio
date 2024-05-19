import 'package:flutter/material.dart';
import 'package:talkio/widgets/auto_sized_box.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("ABOUT ME",
              style: Theme.of(context).textTheme.displayMedium),
        ),


        const AutoSizedBox(height: 12),

        Divider(indent: 50,endIndent: 50,),
        Text("Myo Thu Kha", style: TextStyle(fontSize: 18),),
        Divider(indent: 50,endIndent: 50,),
        Text(
          "Hi, my name is myo thu kha. and my favorite sentence is lorem ipsum.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
