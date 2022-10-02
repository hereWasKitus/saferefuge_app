import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

class Entrypoint extends StatefulWidget {
  const Entrypoint({Key? key}) : super(key: key);

  @override
  State<Entrypoint> createState() => _EntrypointState();
}

class _EntrypointState extends State<Entrypoint> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        // HomeRoute(),
        HomeRouter(),
        EmptyRoute(),
      ],
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
              icon: Icon(Icons.emergency_share),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'About',
            ),
          ],
          currentIndex: tabsRouter.activeIndex,
        );
      },
    );
  }
}
