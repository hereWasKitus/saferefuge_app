import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'package:protect_ua_women/core/widgets/form/my_form_field.dart';

class ProfileChangePasswordView extends StatelessWidget {
  const ProfileChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Change password'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: grey,
        ),
        titleSpacing: defaultPadding,
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
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
        ),
        child: _PasswordForm(),
      ),
    );
  }
}

class _PasswordForm extends StatefulWidget {
  const _PasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<_PasswordForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const MyFormField(
            labelText: 'Current password',
            isPassword: true,
          ),
          const SizedBox(height: 16),
          const MyFormField(
            labelText: 'New password',
            isPassword: true,
          ),
          const SizedBox(height: 16),
          const MyFormField(
            labelText: 'Confirm password',
            isPassword: true,
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Save password'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(defaultBorderRadius),
                ),
              ),
              primary: const Color.fromRGBO(27, 50, 132, 1),
            ),
          ),
        ],
      ),
    );
  }
}
