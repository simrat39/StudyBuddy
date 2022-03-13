import 'package:flutter/material.dart';

class BuddyRow extends StatelessWidget {
  const BuddyRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "assets/buddy1.png",
          width: 52,
          height: 52,
        ),
        Image.asset(
          "assets/buddy2.png",
          width: 52,
          height: 52,
        ),
        Image.asset(
          "assets/buddy3.png",
          width: 52,
          height: 52,
        ),
        Image.asset(
          "assets/buddy4.png",
          width: 52,
          height: 52,
        ),
      ],
    );
  }
}
