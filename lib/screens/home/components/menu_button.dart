import 'package:flutter/material.dart';
import 'package:protect_ua_women/constants.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MenuButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: primaryColor,
        shape: CircleBorder(),
      ),
      child: IconButton(
          splashRadius: 23,
          onPressed: onPressed,
          icon: const Icon(Icons.menu),
          color: Colors.white),
    );
  }
}
