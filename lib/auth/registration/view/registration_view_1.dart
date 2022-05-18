import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

import '../registration.dart';

class RegistrationView1 extends StatefulWidget {
  const RegistrationView1({Key? key}) : super(key: key);

  @override
  State<RegistrationView1> createState() => _RegistrationView1State();
}

class _RegistrationView1State extends State<RegistrationView1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 64,
          left: defaultPadding,
          right: defaultPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const _EmailField(),
                  const SizedBox(height: 24),
                  const _PasswordField(),
                  const SizedBox(
                    height: 48,
                  ),
                  BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<RegistrationBloc>().add(const RegistrationFirstStepCompleted(true));
                          }
                        },
                        child: const Text('Create account'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 60),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(defaultBorderRadius),
                            ),
                          ),
                          primary: const Color.fromRGBO(27, 50, 132, 1),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: const Text(
                  //         'Have an account?',
                  //         style: TextStyle(
                  //           color: Color.fromRGBO(71, 66, 221, 0.7),
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: const Text(
                  //         'Log in',
                  //         style: TextStyle(
                  //           color: Color(0xFF1B3284),
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return MyFormField(
          labelText: 'Email',
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          onChanged: (String? value) {
            context.read<RegistrationBloc>().add(RegistrationEmailChanged(value ?? ''));
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            if (!state.isEmailValid) {
              return 'Email is not valid!';
            }

            return null;
          },
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return MyFormField(
          labelText: 'Password',
          hintText: 'Enter your password',
          isPassword: true,
          onChanged: (String? value) => context.read<RegistrationBloc>().add(RegistrationPasswordChanged(value ?? '')),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            if (!state.isPasswordValid) {
              return 'Password need to be at least 6 characters length';
            }

            return null;
          },
        );
      },
    );
  }
}
