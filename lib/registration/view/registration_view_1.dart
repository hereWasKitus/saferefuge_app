import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/routes/router.gr.dart';
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
        title: const Text(
          'Registration',
          style: TextStyle(
            color: grey,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: grey,
              ),
              onPressed: () {
                context.router.pop();
              },
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
            left: defaultPadding,
            right: defaultPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/logo-alt.svg'),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const _NameField(),
                    const SizedBox(height: 8),
                    const _EmailField(),
                    const SizedBox(height: 8),
                    const _PasswordField(),
                    const SizedBox(height: 16),
                    const _UserTypeRadio(),
                    const SizedBox(height: 24),
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
                            color: grey2,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // context.watchTabsRouter.navigate(const LoginRoute());
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

class _UserTypeRadio extends StatefulWidget {
  const _UserTypeRadio({Key? key}) : super(key: key);

  @override
  State<_UserTypeRadio> createState() => __UserTypeRadioState();
}

class __UserTypeRadioState extends State<_UserTypeRadio> {
  int _type = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: _type,
              onChanged: (int? value) {
                // setState(() {
                //   if (value == null) return;
                //   _type = value;
                // });
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text('Coming soon!'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: grey2,
                    ),
                  );
              },
            ),
            const Text(
              'I\'m private volunteer / refugee',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: grey2,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: _type,
              onChanged: (int? value) {
                setState(() {
                  if (value == null) return;
                  _type = value;
                });
              },
              fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                // if (states.contains(MaterialState.disabled)) {
                //   return Colors.orange.withOpacity(.32);
                // }
                return primaryColor;
              }),
            ),
            const Text(
              'I\'m NGO\'s member',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: grey2,
              ),
            ),
          ],
        )
      ],
    );
  }
}
