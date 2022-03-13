import 'package:flutter/material.dart';

class QuitButton extends StatelessWidget {
  const QuitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          width: 2,
          color: Colors.red,
        ),
      ),
      child: const Icon(
        Icons.exit_to_app,
        color: Colors.red,
        size: 40,
      ),
    );
  }
}
