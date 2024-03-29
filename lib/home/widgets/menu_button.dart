import 'package:flutter/material.dart';
import 'package:protect_ua_women/config/constants.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? icon;

  const MenuButton({Key? key, required this.onPressed, this.icon}) : super(key: key);

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
        icon: icon ?? const Icon(Icons.menu),
        color: Colors.white,
      ),
    );
  }
}
