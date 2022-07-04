import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.authStatus != AuthStatus.unknown) {
          context.router.replace(const EntrypointRoute());
        }
      },
      listenWhen: (previous, current) => previous.authStatus != current.authStatus,
      child: Scaffold(
        // backgroundColor: const Color.fromRGBO(71, 66, 221, 1),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const Text(
                'Refugee Safeway\r\n+',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 36,
                ),
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset(
                'assets/icons/purple_vest_mission.svg',
                width: 200,
                height: 200,
              )
              // Row(
              //   children: [
              //     Text(
              //       'Women',
              //       style: _headingYellow,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 8, right: 8),
              //       child: Text(
              //         '&',
              //         style: _heading,
              //       ),
              //     ),
              //     Text(
              //       'Children',
              //       style: _headingYellow,
              //     ),
              //   ],
              //   mainAxisAlignment: MainAxisAlignment.center,
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // Text(
              //   'Let\'s find your safe way',
              //   style: _subtitle,
              // ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
