import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/app/app.dart';

import '../../home/home.dart';

class Entrypoint extends StatefulWidget {
  const Entrypoint({Key? key}) : super(key: key);

  @override
  State<Entrypoint> createState() => _EntrypointState();
}

class _EntrypointState extends State<Entrypoint> {
  bool isReady = false;

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isReady = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isReady) {
      return const SplashScreen();
    } else {
      return const HomeScreen();
    }
  }
}
