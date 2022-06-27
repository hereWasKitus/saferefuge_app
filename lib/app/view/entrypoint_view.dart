import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

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
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.authStatus != current.authStatus,
      builder: (context, state) {
        List<PageRouteInfo<dynamic>> _routes = [
          const HomeRoute(),
          const ProfileRoute(),
        ];

        return AutoTabsScaffold(
          routes: _routes,
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              selectedItemColor: primaryColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: tabsRouter.activeIndex,
              onTap: (int index) {
                if (index == _routes.length - 1 && state.authStatus != AuthStatus.authorized) {
                  // context.router.topRoute.;
                  context.navigateTo(const RegistrationRoute());
                } else {
                  tabsRouter.setActiveIndex(index);
                }
              },
            );
          },
        );
      },
    );
  }
}
