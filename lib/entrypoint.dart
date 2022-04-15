import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:protect_ua_women/redux/app_state.dart';
import 'package:protect_ua_women/screens/home/home_screen.dart';
import 'package:protect_ua_women/screens/splash_screen/splash_screen.dart';

class Entrypoint extends StatelessWidget {
  const Entrypoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      converter: (store) => store.state.isInitialized,
      builder: (context, bool isInitialized) {
        if (!isInitialized) {
          return const SplashScreen();
        } else {
          return const MapSample();
        }
      },
    );
  }
}
