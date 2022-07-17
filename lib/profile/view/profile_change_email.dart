import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

class ProfileChangeEmailView extends StatelessWidget {
  const ProfileChangeEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Change email'),
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
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: _EmailForm(),
      ),
    );
  }
}

class _EmailForm extends StatefulWidget {
  const _EmailForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<_EmailForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          MyFormField(
            labelText: 'Email',
            hintText: 'Enter your email',
            initialValue: context.select((ProfileBloc bloc) => bloc.state.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please enter your email';
              }

              return null;
            },
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Save'),
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
