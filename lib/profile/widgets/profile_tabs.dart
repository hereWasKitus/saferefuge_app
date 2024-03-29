import 'package:flutter/material.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({Key? key, required this.activeIndex, required this.onClick}) : super(key: key);

  final int activeIndex;
  final Function(int index) onClick;

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  @override
  Widget build(BuildContext context) {
    // return AutoTabsScaffold(routes: routes)
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 44,
      ),
      // padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _TabButton(
            text: 'Profile',
            isActive: widget.activeIndex == 0,
            onPressed: () => widget.onClick(0),
          ),
          const SizedBox(width: 10),
          _TabButton(
            text: 'Branches',
            isActive: widget.activeIndex == 1,
            onPressed: () => widget.onClick(1),
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
  final void Function() onPressed;

  final ButtonStyle _activeStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: const Color.fromRGBO(54, 83, 185, 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  );

  final ButtonStyle _normalStyle = TextButton.styleFrom(
    primary: const Color.fromRGBO(54, 83, 185, 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
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
