import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/bloc/registration_form/registrationform_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

class OrganizationRegistrationForm1 extends StatefulWidget {
  const OrganizationRegistrationForm1({Key? key}) : super(key: key);

  @override
  State<OrganizationRegistrationForm1> createState() => _OrganizationRegistrationForm1State();
}

class _OrganizationRegistrationForm1State extends State<OrganizationRegistrationForm1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Email field
  Widget _emailField() {
    return BlocBuilder<RegistrationFormBloc, RegistrationFormState>(
      builder: (context, state) {
        return MyFormField(
          labelText: 'Email',
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          onChanged: (String? value) {
            context.read<RegistrationFormBloc>().add(RegistrationEmailChanged(value ?? ''));
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

  // Password field
  Widget _passwordField() {
    return BlocBuilder<RegistrationFormBloc, RegistrationFormState>(
      builder: (context, state) {
        return MyFormField(
          labelText: 'Password',
          hintText: 'Enter your password',
          isPassword: true,
          onChanged: (String? value) =>
              context.read<RegistrationFormBloc>().add(RegistrationPasswordChanged(value ?? '')),
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                _emailField(),
                const SizedBox(height: 24),
                _passwordField(),
                const SizedBox(
                  height: 48,
                ),
                BlocBuilder<RegistrationFormBloc, RegistrationFormState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context.read<RegistrationFormBloc>().add(const RegistrationFirstStepCompleted(true));
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
