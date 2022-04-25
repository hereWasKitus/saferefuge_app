import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/bloc/registration_form/registrationform_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

class OrganizationRegistrationScreen extends StatefulWidget {
  const OrganizationRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationRegistrationScreen> createState() => _OrganizationRegistrationScreenState();
}

class _OrganizationRegistrationScreenState extends State<OrganizationRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationFormBloc, RegistrationFormState>(
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
    );
  }
}
