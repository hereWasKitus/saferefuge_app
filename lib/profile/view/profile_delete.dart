import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

class ProfileDeleteView extends StatelessWidget {
  const ProfileDeleteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) => previous.deleteStatus != current.deleteStatus,
      listener: (context, state) {
        if (state.deleteStatus == DeleteStatus.fail) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: red,
            ),
          );
        }

        if (state.deleteStatus == DeleteStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account deleted'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: green,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Delete account'),
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
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.select((ProfileBloc bloc) => bloc.state.deleteStatus == DeleteStatus.loading);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          MyFormField(
            labelText: 'Enter your password',
            isPassword: true,
            controller: _passwordController,
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: isLoading
                ? () {}
                : () => context.read<ProfileBloc>().add(ProfileDeleteRequest(_passwordController.text)),
            child: isLoading ? const SpinKitCircle(color: Colors.white) : const Text('Delete account'),
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
