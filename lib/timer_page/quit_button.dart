import 'package:flutter/material.dart';

class QuitButton extends StatelessWidget {
  const QuitButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: onTap,
        child: Container(
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
        ),
      ),
    );
  }
}
