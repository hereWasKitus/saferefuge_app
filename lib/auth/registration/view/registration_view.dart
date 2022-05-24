import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

import '../registration.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (prev, curr) =>
          prev.firstStepCompleted != curr.firstStepCompleted ||
          prev.registrationCompleted != curr.registrationCompleted,
      builder: (context, state) {
        return AutoRouter.declarative(routes: (_) {
          return [
            const RegistrationFirstStepRoute(),
            // const RegistrationThirdStepRoute(),
            if (state.firstStepCompleted) const RegistrationSecondStepRoute(),
            if (state.registrationCompleted) const ThankYouRoute(),
          ];
        });
      },
    );
  }
}