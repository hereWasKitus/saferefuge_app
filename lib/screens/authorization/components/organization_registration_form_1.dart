import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/registration_form.model.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

class OrganizationRegistrationForm1 extends StatefulWidget {
  const OrganizationRegistrationForm1({Key? key}) : super(key: key);

  @override
  State<OrganizationRegistrationForm1> createState() =>
      _OrganizationRegistrationForm1State();
}

class _OrganizationRegistrationForm1State
    extends State<OrganizationRegistrationForm1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email = '';
  String? password = '';

  bool isFirstFormFilled() {
    return false;
    // return appStore.state.registrationForm.email != null &&
    //     appStore.state.registrationForm.email!.isNotEmpty;
  }

  // final _innerRouterKey = GlobalKey<AutoRouterState>();
  @override
  Widget build(BuildContext context) {
    if (isFirstFormFilled()) {
      context.router.replaceNamed('step2');
    } // is't bad, need to replace it with "good practice" later

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                MyFormField(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? value) => setState(() => email = value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }

                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) return 'Email is not valid!';

                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                MyFormField(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  isPassword: true,
                  onSaved: (String? value) => setState(() => password = value),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }

                    if (value.length < 6) return 'This field is required';

                    return null;
                  },
                ),
                const SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      // appStore
                      //     .dispatch(SetRegistrationFormAction(RegistrationForm(
                      //   email: email,
                      //   password: password,
                      // )));
                      context.router.pushNamed('step2');
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
