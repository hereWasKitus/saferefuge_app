import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({Key? key}) : super(key: key);

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  @override
  Widget build(BuildContext context) {
    // return AutoTabsScaffold(routes: routes)
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 64,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(defaultBorderRadius),
        ),
        color: Color(0xFF6461BC),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TabButton(
            text: AutoRouter.of(context).currentChild!.path,
            isActive: true,
            onPressed: () {
              AutoRouter.of(context).push(const ProfileRequestsRoute());
            },
          ),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          _TabButton(
            text: 'Profile',
            isActive: false,
            onPressed: () {
              AutoRouter.of(context).push(const ProfileFormRoute());
            },
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  _TabButton({Key? key, required this.text, this.isActive = false, required this.onPressed}) : super(key: key);

  final String text;
  final bool isActive;
  void Function() onPressed;

  final ButtonStyle _activeStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: const Color(0xFF7B61FF),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    elevation: 10,
  );

  final ButtonStyle _normalStyle = TextButton.styleFrom(
    primary: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Text(text),
        style: isActive ? _activeStyle : _normalStyle,
      ),
    );
  }
}
