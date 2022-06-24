import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/routes/router.gr.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';
import 'package:protect_ua_women/widgets/form/text_dropdown.widget.dart';

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
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listenWhen: (previous, current) => previous.registrationStatus != current.registrationStatus,
        listener: (context, state) async {
          if (state.registrationStatus == RegistrationStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
                backgroundColor: red,
              ),
            );
          }

          if (state.registrationStatus == RegistrationStatus.success) {
            context.read<ProfileBloc>().add(const ProfileTryGetUser());
            context.read<RegistrationBloc>().add(const RegistrationFirstStepCompleted(true));
          }
        },
        // listenWhen: (old, current) => old.registrationStatus != current.registrationStatus,
        child: SingleChildScrollView(
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
                    const SizedBox(height: 24),
                    const _NameField(),
                    const SizedBox(height: 24),
                    const _EmailField(),
                    const SizedBox(height: 24),
                    const _PasswordField(),
                    const SizedBox(
                      height: 48,
                    ),
                    BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: _handleFormSubmit,
                          child: state.registrationStatus == RegistrationStatus.loading
                              ? const SpinKitCircle(
                                  color: Colors.white,
                                )
                              : const Text('Create account'),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Have an account?',
                          style: TextStyle(
                            color: Color.fromRGBO(71, 66, 221, 0.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.router.replace(const LoginRoute());
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              color: Color(0xFF1B3284),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleFormSubmit() async {
    if (_formKey.currentState!.validate()) {
      context.read<RegistrationBloc>().add(const RegistrationRequestEvent());
    }
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Email',
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          onChanged: (String? value) {
            context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(email: value ?? ''));
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
      buildWhen: (previos, current) => previos.password != current.password,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Password',
          hintText: 'Enter your password',
          isPassword: true,
          onChanged: (String? value) {
            context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(password: value ?? ''));
          },
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

class _NameField extends StatelessWidget {
  const _NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previos, current) => previos.fullName != current.fullName,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Full name',
          hintText: 'Enter your name',
          onChanged: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(name: value ?? '')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            if (!state.isNameValid) {
              return 'This field need to contain at least 3 characters';
            }

            return null;
          },
        );
      },
    );
  }
}
