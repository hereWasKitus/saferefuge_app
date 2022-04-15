import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:protect_ua_women/constants.dart';

class OrganizationRegistrationScreen extends StatelessWidget {
  const OrganizationRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0),
      child: AutoRouter(),
    );
  }
}
