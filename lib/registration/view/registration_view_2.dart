import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';
import 'package:protect_ua_women/widgets/form/text_dropdown.widget.dart';

import '../registration.dart';

class RegistrationView2 extends StatefulWidget {
  const RegistrationView2({Key? key}) : super(key: key);

  @override
  State<RegistrationView2> createState() => _RegistrationView2State();
}

class _RegistrationView2State extends State<RegistrationView2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double _gap = 16;

  List<String>? services;

  @override
  void initState() {
    super.initState();

    var state = context.read<RegistrationBloc>().state;

    if (state.organizationsLoaded == false) {
      context.read<RegistrationBloc>().add(const RegistrationGetOrganizationsList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Registration',
          style: TextStyle(
            color: grey,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: grey,
              ),
              onPressed: () {
                context.router.pop();
              },
            ),
          ),
        ],
      ),
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state.organizationRegistrationStatus == NGORegistrationStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
                backgroundColor: red,
              ),
            );
          }

          if (state.organizationRegistrationStatus == NGORegistrationStatus.success) {
            context.read<ProfileBloc>().add(const ProfileTryGetUser()); // get user with organizatio fields
            context.read<RegistrationBloc>().add(const RegistrationSecondStepCompleted(true));
          }
        },
        listenWhen: (previous, current) =>
            previous.organizationRegistrationStatus != current.organizationRegistrationStatus,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 16,
              left: defaultPadding,
              right: defaultPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Registrations for NGO\'s member',
                        style: TextStyle(
                          color: black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: _gap),
                      const _NGONameField(),
                      SizedBox(height: _gap),
                      _PositionInNGOField(),
                      SizedBox(height: _gap),
                      _NGOCountry(),
                      SizedBox(height: _gap),
                      _NGOPhoneField(),
                      SizedBox(height: _gap),
                      _NGOWebsite(),
                      SizedBox(height: _gap),
                      _NGOIDField(),
                      SizedBox(height: _gap),
                      BlocBuilder<RegistrationBloc, RegistrationState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: state.organizationRegistrationStatus == NGORegistrationStatus.loading
                                ? () {}
                                : _handleRegistration,
                            child: state.organizationRegistrationStatus == NGORegistrationStatus.loading
                                ? const SpinKitCircle(
                                    color: Colors.white,
                                  )
                                : const Text('Next step'),
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
          ),
        ),
      ),
    );
  }

  _handleRegistration() async {
    if (_formKey.currentState!.validate()) {
      // context.read<RegistrationBloc>().add(const RegistrationSecondStepCompleted(true));
      // context.read<RegistrationBloc>().add(const RegistrationFormChangedEvent());
      context.read<RegistrationBloc>().add(const RegistrationOrganizationCreationRequest());
    }
  }
}

class _NGONameField extends StatelessWidget {
  const _NGONameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) =>
          (previous.isLoading != current.isLoading) || (previous.organizations != current.organizations),
      builder: (context, state) {
        return TextDropdown(
          hideDropdown: state.isLoading,
          label: 'NGO\'s name*',
          hintText: 'Enter your organization name',
          items: state.organizations.map((org) => DropdownItemModel(title: org.name, value: org.id)).toList(),
          onChange: (value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(organizationName: value ?? '')),
          onItemSelect: (item) {
            Organization org = state.organizations.firstWhere((org) => org.id == item.value);
            context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(
                  organizationAddress: org.address,
                  organizationCountry: org.country,
                  website: org.website,
                  organizationPhone: org.phone,
                  organizationEmail: org.email,
                  organizationID: org.formalID,
                  organizationName: org.name,
                  organizationTelegram: org.telegram,
                  organizationWhatsapp: org.whatsapp,
                ));
          },
          suffixIcon: state.isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return SpinKitCircle(
                      color: primaryColor,
                      size: constraints.maxWidth / 2,
                    );
                  }),
                )
              : null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            return null;
          },
        );
      },
    );

    // return DropdownSearch();
  }
}

class _NGOCountry extends StatelessWidget {
  _NGOCountry({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (_controller.text != state.organizationCountry) {
          _controller.text = state.organizationCountry;
        }
      },
      listenWhen: (previous, current) => previous.organizationCountry != current.organizationCountry,
      buildWhen: (previous, current) => (previous.organizationCountry != current.organizationCountry),
      builder: (context, state) {
        return TextDropdown(
          controller: _controller,
          hideDropdown: state.isLoading,
          label: 'NGO\'s country*',
          hintText: 'Enter your organization country',
          items: countryList
              .map((country) => DropdownItemModel(title: country['name']!, value: country['code']!))
              .toList(),
          onChange: (value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(organizationCountry: value ?? '')),
          onItemSelect: (item) {},
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

        // return DropdownSearch();
      },
    );
  }
}

class _PositionInNGOField extends StatelessWidget {
  _PositionInNGOField({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (_controller.text != state.positionInOrganization) {
          _controller.text = state.positionInOrganization;
        }
      },
      listenWhen: (previous, current) => previous.positionInOrganization != current.positionInOrganization,
      buildWhen: (previous, current) => previous.positionInOrganization != current.positionInOrganization,
      builder: (context, state) {
        return Column(
          children: [
            MyFormField(
              controller: _controller,
              labelText: 'Your position in NGO*',
              hintText: 'Enter your position',
              onChanged: (String? value) => context
                  .read<RegistrationBloc>()
                  .add(RegistrationFormChangedEvent(positionInOrganization: value ?? '')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }

                return null;
              },
            ),
          ],
        );
      },
    );
  }
}

class _NGOIDField extends StatelessWidget {
  _NGOIDField({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (_controller.text != state.organizationID) {
          _controller.text = state.organizationID;
        }
      },
      listenWhen: (previous, current) => previous.organizationID != current.organizationID,
      buildWhen: (previous, current) => previous.organizationID != current.organizationID,
      builder: (context, state) {
        return MyFormField(
          controller: _controller,
          labelText: 'NGO\' ID number*',
          hintText: 'ID number',
          onChanged: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(organizationID: value ?? '')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            return null;
          },
        );
      },
    );
  }
}

class _NGOPhoneField extends StatelessWidget {
  _NGOPhoneField({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (_controller.text != state.organizationPhone) {
          _controller.text = state.organizationPhone;
        }
      },
      listenWhen: (previous, current) => previous.organizationPhone != current.organizationPhone,
      buildWhen: (previous, current) => previous.organizationPhone != current.organizationPhone,
      builder: (context, state) {
        return MyFormField(
          controller: _controller,
          labelText: 'NGO\'s phone number*',
          hintText: 'Enter your organization\'s phone number',
          keyboardType: TextInputType.phone,
          onChanged: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(organizationPhone: value ?? '')),
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
}

class _NGOWebsite extends StatelessWidget {
  _NGOWebsite({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (_controller.text != state.website) {
          _controller.text = state.website;
        }
      },
      listenWhen: (previous, current) => previous.website != current.website,
      buildWhen: (previous, current) => previous.website != current.website,
      builder: (context, state) {
        return MyFormField(
          controller: _controller,
          labelText: 'NGO\'s website',
          hintText: 'Enter your organization\'s website url',
          keyboardType: TextInputType.url,
          onChanged: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(website: value ?? '')),
          validator: (value) {
            return null;
          },
        );
      },
    );
  }
}
