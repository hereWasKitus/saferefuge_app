import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'package:protect_ua_women/core/widgets/form/my_form_field.dart';

import '../bloc/password_reset_bloc.dart';

class PasswordResetEmailFormView extends StatelessWidget {
  const PasswordResetEmailFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.router.pop(),
            color: grey,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Forgot password?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Reset password in two quick steps',
              style: TextStyle(
                fontSize: 14,
                color: grey2,
              ),
            ),
            SizedBox(height: 32),
            _EmailForm(),
          ],
        ),
      ),
    );
  }
}

class _EmailForm extends StatelessWidget {
  const _EmailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isEmailValid = context.select((PasswordResetBloc bloc) => bloc.state.isEmailValid);

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          MyFormField(
            labelText: 'Email address',
            hintText: 'Enter your email address',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => context.read<PasswordResetBloc>().add(PasswordResetEmailChanged(value ?? '')),
            validator: (value) {
              if (isEmailValid) {
                return null;
              }

              return 'Email is not valid';
            },
            // errorText: _formKey.currentContext. isEmailValid ? null : 'Email is not valid',
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: isEmailValid ? () => context.read<PasswordResetBloc>().add(const PasswordResetRequest()) : () {},
            child: const Text('Reset password'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(defaultBorderRadius),
                ),
              ),
              primary: isEmailValid ? actionColor : grey2,
            ),
          ),
        ],
      ),
    );
  }
}
