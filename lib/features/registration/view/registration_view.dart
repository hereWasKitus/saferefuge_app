import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/features/profile/profile.dart';
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
    Set<String> onboardingStatus = context.select((ProfileBloc bloc) => bloc.state.onboardingStatus);
    POI branch = context.select((RegistrationBloc bloc) => bloc.state.branch);
    String lastAddedStatus = onboardingStatus.isNotEmpty ? onboardingStatus.last : 'INITIAL';

    return AutoRouter.declarative(routes: (_) {
      return [
        if (lastAddedStatus == 'INITIAL') const RegistrationFirstStepRoute(),
        if (lastAddedStatus == 'ORGANIZATION_ASSIGNMENT') const RegistrationSecondStepRoute(),
        if (lastAddedStatus == 'BRANCH_REGISTRATION') const RegistrationThirdStepRoute(),
        if (branch.name.isNotEmpty) const RegistrationFourthStepRoute(),
        if (lastAddedStatus == 'FINISHED') const ThankYouRoute(),
      ];
    });
  }
}
