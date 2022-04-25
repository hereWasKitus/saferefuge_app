import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:protect_ua_women/screens/home/components/menu_button.dart';

class AuthorizationScreenWrapper extends StatefulWidget {
  const AuthorizationScreenWrapper({Key? key}) : super(key: key);

  @override
  State<AuthorizationScreenWrapper> createState() => _AuthorizationScreenWrapperState();
}

class _AuthorizationScreenWrapperState extends State<AuthorizationScreenWrapper> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {
                  context.router.pop();
                },
              ),
            ),
          ),
        ],
      ),
      body: const AutoRouter(),
    );
  }
}
