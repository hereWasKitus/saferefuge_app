import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/app/app.dart';

import '../../home/home.dart';

class Entrypoint extends StatelessWidget {
  const Entrypoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.poisLoaded != current.poisLoaded,
      builder: (context, state) {
        if (!state.poisLoaded) {
          return const SplashScreen();
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}
