import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
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
              color: Colors.green,
            ),
          ),
          child: const Icon(
            Icons.check,
            color: Colors.green,
            size: 40,
          ),
        ),
      ),
    );
  }
}
