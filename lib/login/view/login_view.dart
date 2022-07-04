import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:protect_ua_women/login/login.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/routes/router.gr.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.authorized) {
          context.router.navigate(const EntrypointRoute(children: [
            ProfileRoute(),
          ]));
        }
      },
      listenWhen: (previous, current) => previous.authStatus != current.authStatus,
      child: Scaffold(
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
                  icon: const Icon(Icons.close),
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
                    const SizedBox(height: 16),
                    const _PasswordField(),
                    const SizedBox(height: 24),
                    _LoginButton(formKey: _formKey),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Color.fromRGBO(71, 66, 221, 0.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.router.replace(const RegistrationRoute());
                          },
                          child: const Text(
                            'Sign up',
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
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginStatus == LoginStatus.failed) {
          _showSnackBar(context, text: state.errorMessage);
        } else if (state.loginStatus == LoginStatus.success) {
          context.read<ProfileBloc>().add(const ProfileTryGetUser());
        }
      },
      listenWhen: (old, current) => old.loginStatus != current.loginStatus,
      buildWhen: (old, current) => old.loginStatus != current.loginStatus,
      builder: (BuildContext context, LoginState state) {
        return ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(
                    LoginRequestEvent(
                      email: context.read<LoginBloc>().state.emailField,
                      password: context.read<LoginBloc>().state.passwordField,
                    ),
                  );
            }
          },
          child: context.read<LoginBloc>().state.loginStatus == LoginStatus.loading
              ? const SpinKitCircle(
                  color: Colors.white,
                )
              : const Text('Log in'),
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
    );
  }

  void _showSnackBar(BuildContext context, {String text = ''}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        backgroundColor: red,
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.emailField != current.emailField,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Email or username',
          hintText: 'Enter your email or username',
          keyboardType: TextInputType.emailAddress,
          initialValue: state.emailField,
          onChanged: (String? value) {
            context.read<LoginBloc>().add(LoginEmailChangedEvent(value ?? ''));
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            // if (!state.isEmailValid) {
            //   return 'Email is not valid!';
            // }

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
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return MyFormField(
          labelText: 'Password',
          hintText: 'Enter your password',
          isPassword: true,
          initialValue: state.passwordField,
          onChanged: (String? value) => context.read<LoginBloc>().add(LoginPasswordChangedEvent(value ?? '')),
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
