import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/bloc/map/map_bloc.dart';
import 'package:protect_ua_women/screens/home/home_screen.dart';
import 'package:protect_ua_women/screens/splash_screen/splash_screen.dart';

class Entrypoint extends StatelessWidget {
  const Entrypoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (previous, current) =>
          previous.poisLoaded != current.poisLoaded,
      builder: (context, state) {
        if (state.poisLoaded) {
          return const HomeScreen();
        }

        return const SplashScreen();
      },
    );
  }
}
