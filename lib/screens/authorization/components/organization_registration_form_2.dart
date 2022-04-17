import 'package:flutter/material.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/registration_form.model.dart';
import 'package:protect_ua_women/services/auth.service.dart';
import 'package:protect_ua_women/widgets/category_list.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

class OrganizationRegistrationForm2 extends StatefulWidget {
  const OrganizationRegistrationForm2({Key? key}) : super(key: key);

  @override
  State<OrganizationRegistrationForm2> createState() =>
      _OrganizationRegistrationForm2State();
}

class _OrganizationRegistrationForm2State
    extends State<OrganizationRegistrationForm2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _gap = 16;

  String? name;
  String? organizationName;
  String? organizationAddress;
  String? organizationPhone;
  List<String>? services;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyFormField(
                  labelText: 'Your name',
                  hintText: 'Enter your name',
                  onSaved: (value) => setState(() => name = value),
                ),
                SizedBox(
                  height: _gap,
                ),
                MyFormField(
                  labelText: 'Organization name',
                  hintText: 'Enter your organization name',
                  onSaved: (value) => setState(() => organizationName = value),
                ),
                SizedBox(
                  height: _gap,
                ),
                MyFormField(
                  labelText: 'Organization address',
                  hintText: 'Enter your organization address',
                  onSaved: (value) =>
                      setState(() => organizationAddress = value),
                ),
                SizedBox(
                  height: _gap,
                ),
                MyFormField(
                  labelText: 'Organization phone',
                  hintText: 'Enter your organization phone',
                  onSaved: (value) => setState(() => organizationPhone = value),
                ),
                SizedBox(
                  height: _gap,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Services you provide',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    CategoryList(
                      onSelected: (List<String> categories) {
                        setState(() {
                          services = categories;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();

                      // RegistrationForm form =
                      //     appStore.state.registrationForm.copyWith(
                      //   name: name,
                      //   organizationName: organizationName,
                      //   address: organizationAddress,
                      //   phone: organizationPhone,
                      //   categories: services,
                      // );

                      // appStore.dispatch(SetRegistrationFormAction(form));

                      // AuthService().registerOrganization(form);
                    }
                  },
                  child: const Text('Register organization'),
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
