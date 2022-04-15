import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:protect_ua_women/screens/home/components/menu_button.dart';

class AuthorizationScreenWrapper extends StatelessWidget {
  const AuthorizationScreenWrapper({Key? key}) : super(key: key);

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
            child: MenuButton(
              onPressed: () {
                context.router.pop();
                // context.router.navigateNamed('/home');
              },
            ),
          ),
        ],
      ),
      body: const AutoRouter(),
    );
  }
}
