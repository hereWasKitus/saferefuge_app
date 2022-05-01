import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

import '../registration.dart';

class OrganizationRegistrationView extends StatefulWidget {
  const OrganizationRegistrationView({Key? key}) : super(key: key);

  @override
  State<OrganizationRegistrationView> createState() => _OrganizationRegistrationViewState();
}

class _OrganizationRegistrationViewState extends State<OrganizationRegistrationView> {
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
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        buildWhen: (prev, curr) =>
            prev.firstStepCompleted != curr.firstStepCompleted ||
            prev.registrationCompleted != curr.registrationCompleted,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, 0),
            child: AutoRouter.declarative(routes: (_) {
              return [
                const RegistrationFirstStepRoute(),
                if (state.firstStepCompleted) const RegistrationSecondStepRoute(),
                if (state.registrationCompleted) const ThankYouRoute(),
              ];
            }),
          );
        },
      ),
    );
  }
}
