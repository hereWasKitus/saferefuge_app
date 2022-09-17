import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(71, 66, 221, 1),
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset('assets/logo.svg'),
      ),
    );
  }
}
