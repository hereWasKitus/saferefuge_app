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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.authStatus != current.authStatus,
      builder: (context, state) {
        List<PageRouteInfo<dynamic>> _routes = [
          const HomeRoute(),
          // mb add dump route here, remove later
          const EmptyRoute(),
          const ProfileRouter(),
        ];

        return AutoTabsScaffold(
          routes: _routes,
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: primaryColor,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add point',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: tabsRouter.activeIndex,
              onTap: (int index) {
                // this is shit, refactor it
                if (index == 1) {
                  if (state.authStatus != AuthStatus.authorized) {
                    context.navigateTo(const RegistrationRoute());
                  } else {
                    context.navigateTo(AddBranchRoute());
                  }

                  return;
                }

                if (index == _routes.length - 1 && state.authStatus != AuthStatus.authorized) {
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
