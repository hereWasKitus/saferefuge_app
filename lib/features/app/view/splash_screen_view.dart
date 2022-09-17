import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protect_ua_women/features/profile/profile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.authStatus != AuthStatus.unknown) {
          Timer(const Duration(seconds: 1), () {
            context.router.replace(const EntrypointRoute());
          });
        }
      },
      listenWhen: (previous, current) => previous.authStatus != current.authStatus,
      child: Scaffold(
        // backgroundColor: const Color.fromRGBO(71, 66, 221, 1),
        backgroundColor: Colors.white,
        body: Center(
          child: SvgPicture.asset('assets/logo.svg'),
        ),
      ),
    );
  }
}
