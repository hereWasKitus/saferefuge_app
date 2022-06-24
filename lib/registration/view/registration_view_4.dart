import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/profile/profile.dart';

import '../registration.dart';

class RegistrationView4 extends StatefulWidget {
  const RegistrationView4({Key? key}) : super(key: key);

  @override
  State<RegistrationView4> createState() => _RegistrationView4State();
}

class _RegistrationView4State extends State<RegistrationView4> {
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
                  // context.router.pop();
                },
              ),
            ),
          ),
        ],
      ),
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state.registrationStatus == RegistrationStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
                backgroundColor: red,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: defaultPadding,
            right: defaultPadding,
            bottom: 60,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                // width: (MediaQuery.of(context).size.width / 100) * 42.6,
                width: 160,
                child: Text(
                  'Please fill your branch details',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              BranchForm(
                submitButtonText: 'Finish registration',
                branch: context.read<RegistrationBloc>().state.branch,
                onSubmit: (branch) {
                  context.read<RegistrationBloc>().add(const RegistrationOrganizationCreationRequest());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
