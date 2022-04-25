import 'package:flutter/material.dart';
import 'package:protect_ua_women/config/constants.dart';

class MessagePopup extends StatelessWidget {
  final String msg;

  const MessagePopup({Key? key, this.msg = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      backgroundColor: primaryColor,
    );
  }
}
