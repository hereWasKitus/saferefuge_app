import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/widgets/menu_button.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

import '../registration.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userName = context.select((ProfileBloc bloc) => bloc.state.name);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: RotatedBox(
              quarterTurns: 1,
              child: MenuButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  AutoRouter.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          bottom: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 36),
                children: [
                  TextSpan(
                    text: userName,
                    style: const TextStyle(color: Color(0xFF1B3284), fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: ', \r\nwelcome to\r\nSafeWay community!',
                    style: TextStyle(color: Color.fromRGBO(93, 84, 84, 1)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 36),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF5E5555),
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Now you have access to '),
                  TextSpan(
                    text: '68',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(71, 66, 221, 0.7),
                    ),
                  ),
                  TextSpan(text: ' organizations!'),
                ],
              ),
            ),
            const SizedBox(height: 36),
            const Text(
              'We are here to help!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.router.navigate(
                  const EntrypointRoute(
                    children: [
                      ProfileRouter(),
                    ],
                  ),
                );
              },
              child: const Text('Go to profile'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(defaultBorderRadius),
                  ),
                ),
                primary: const Color.fromRGBO(27, 50, 132, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
