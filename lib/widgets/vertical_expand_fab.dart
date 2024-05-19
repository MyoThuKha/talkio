import 'package:flutter/material.dart';

class VerticalExpandFab extends StatefulWidget {
  const VerticalExpandFab({super.key});

  @override
  State<VerticalExpandFab> createState() => _VerticalExpandFabState();
}

class _VerticalExpandFabState extends State<VerticalExpandFab> {
  bool fabOpen = false;

  final radius = 30;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: fabOpen? 180: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: fabOpen? [
          CircleFabItem(
            backgroundColor: Colors.white,
            child: const Icon(Icons.logout,color: Colors.black,),
            onClick: () {},
          ),
          CircleFabItem(
            backgroundColor: Colors.white,
            child: const Icon(Icons.logout,color: Colors.black,),
            onClick: () {},
          ),
          CircleFabItem(
            child: const Icon(Icons.logout),
            onClick: () {
              setState(() {
                fabOpen = false;
              });
            },
          ),
        ]: 
        [
          CircleFabItem(
            child: const Icon(Icons.menu),
            onClick: () {
              setState(() {
                fabOpen = true;
              });
            },
          ),
        ]
        ,
      ),
    );

  }
}

class CircleFabItem extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final VoidCallback onClick;
  const CircleFabItem({super.key, required this.child, required this.onClick, this.backgroundColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: 30,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onClick,
        child: child,
      ),
    );
  }
}
