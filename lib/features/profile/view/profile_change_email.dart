import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'package:protect_ua_women/features/profile/profile.dart';
import 'package:protect_ua_women/core/widgets/form/my_form_field.dart';

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
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((ProfileBloc bloc) => bloc.state.formStatus == FormStatus.loading);

    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.formStatus == FormStatus.updateSucceed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Email updated successfully!'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: green,
              ),
            );
        } else if (state.formStatus == FormStatus.updateFail) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Failed to update email!'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: red,
              ),
            );
        }
      },
      listenWhen: (previous, current) => previous.formStatus != current.formStatus,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            MyFormField(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
              // initialValue: context.select((ProfileBloc bloc) => bloc.state.email),
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
              onPressed: isLoading ? () {} : _onSave,
              child: isLoading ? const SpinKitCircle(color: Colors.white) : const Text('Save'),
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
      ),
    );
  }

  void _onSave() {
    context.read<ProfileBloc>().add(ProfileEmailChanged(_emailController.text));
  }
}
