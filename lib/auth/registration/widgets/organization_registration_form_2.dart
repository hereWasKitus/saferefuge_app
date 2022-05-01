import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/routes/router.gr.dart';
import 'package:protect_ua_women/services/auth.service.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';

import '../registration.dart';

class OrganizationRegistrationForm2 extends StatefulWidget {
  const OrganizationRegistrationForm2({Key? key}) : super(key: key);

  @override
  State<OrganizationRegistrationForm2> createState() => _OrganizationRegistrationForm2State();
}

class _OrganizationRegistrationForm2State extends State<OrganizationRegistrationForm2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _gap = 16;

  List<String>? services;
  final _addressController = TextEditingController();

  Widget _nameField() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return MyFormField(
          labelText: 'Your name',
          hintText: 'Enter your name',
          onChanged: (String? value) => context.read<RegistrationBloc>().add(RegistrationFullNameChanged(value ?? '')),
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

  Widget _organizationNameField() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return MyFormField(
          labelText: 'Organization name',
          hintText: 'Enter your organization name',
          onChanged: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationOrganizationNameChanged(value ?? '')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            if (!state.isOrganizationNameValid) {
              return 'This field need to contain at least 3 characters';
            }

            return null;
          },
        );
      },
    );
  }

  Widget _organizationAddressField() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return MyFormField(
          controller: _addressController,
          labelText: 'Organization address',
          hintText: 'e.g  Poland, Krakow, Zwiska str, 14',
          onChanged: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationOrganizationAddressChanged(value ?? '')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            if (!state.isOrganizationAddressValid) {
              return 'This field need to contain at least 3 characters';
            }

            return null;
          },
        );
      },
    );
  }

  Widget _organizationPhoneField() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return MyFormField(
          labelText: 'Organization phone',
          hintText: 'Enter your organization\'s phone number',
          keyboardType: TextInputType.phone,
          onChanged: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationOrganizationPhoneChanged(value ?? '')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            if (!state.isOrganizationPhoneValid) {
              return 'Phone number is invalid';
            }

            return null;
          },
        );
      },
    );
  }

  Widget _organizationWebsiteField() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return MyFormField(
          labelText: 'Organization website',
          hintText: 'Enter your organization\'s website',
          keyboardType: TextInputType.url,
          onChanged: (String? value) => context.read<RegistrationBloc>().add(RegistrationWebsiteChanged(value ?? '')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            if (!state.isOrganizationPhoneValid) {
              return 'Url is invalid';
            }

            return null;
          },
        );
      },
    );
  }

  Widget _servicesField() {
    return Column(
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
            context.read<RegistrationBloc>().add(RegistrationServicesChanged(categories));
          },
        )
      ],
    );
  }

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
                _nameField(),
                SizedBox(height: _gap),
                _organizationNameField(),
                SizedBox(height: _gap),
                _organizationAddressField(),
                SizedBox(height: _gap / 2),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        AutoRouter.of(context).push(
                          MapScreenRoute(
                            onAddressFound: (Map<String, dynamic> address, LatLng latLng) {
                              context
                                  .read<RegistrationBloc>()
                                  .add(RegistrationOrganizationAddressChanged(address['formatted_address']));
                              _addressController.text = address['formatted_address'];

                              context.read<RegistrationBloc>().add(RegistrationPositionChanged(latLng));
                            },
                          ),
                        );
                      },
                      child: const Text('Choose on map'),
                      style: ElevatedButton.styleFrom(
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
                SizedBox(height: _gap),
                _organizationPhoneField(),
                SizedBox(height: _gap),
                _organizationWebsiteField(),
                SizedBox(height: _gap),
                _servicesField(),
                const SizedBox(height: 24),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.isLoading ? null : _handleRegistration,
                      child: state.isLoading
                          ? const SpinKitCircle(color: Colors.white)
                          : const Text('Register organization'),
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
                const SizedBox(height: 24)
              ],
            ),
          ),
        ],
      ),
    );
  }

  _handleRegistration() async {
    if (_formKey.currentState!.validate()) {
      RegistrationState registrationState = context.read<RegistrationBloc>().state;

      if (registrationState.services.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Choose at least 1 service you provide'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: primaryColor,
          ),
        );

        return;
      }

      context.read<RegistrationBloc>().add(const RegistrationLoading(true));

      ResponseData res = await AuthService().registerOrganization(
        name: registrationState.organizationName,
        email: registrationState.email,
        phone: registrationState.organizationPhone,
        address: registrationState.organizationAddress,
        categories: registrationState.services,
        position: registrationState.position,
      );

      context.read<RegistrationBloc>().add(const RegistrationLoading(false));

      if (res.statusCode == 201) {
        context.read<RegistrationBloc>().add(const RegistrationCompleted(true));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(res.data['detail']),
          behavior: SnackBarBehavior.floating,
          backgroundColor: red,
        ));
      }
    }
  }
}
