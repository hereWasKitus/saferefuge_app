import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/widgets/menu_button.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/routes/router.gr.dart';
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: RotatedBox(
              quarterTurns: 1,
              child: MenuButton(
                onPressed: () {
                  context.router.pop();
                },
              ),
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
            context.read<ProfileBloc>().add(const ProfileTryGetUser());
            context.read<RegistrationBloc>().add(const RegistrationSecondStepCompleted(true));
          }
        },
        listenWhen: (previous, current) =>
            previous.organizationRegistrationStatus != current.organizationRegistrationStatus,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
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
                    SizedBox(height: _gap),
                    const _NGONameField(),
                    SizedBox(height: _gap),
                    _PositionInNGOField(),
                    SizedBox(height: _gap),
                    _NGOAddressField(),
                    SizedBox(height: _gap),
                    _NGOEmailField(),
                    SizedBox(height: _gap),
                    _NGOIDField(),
                    SizedBox(height: _gap),
                    _NGOPhoneField(),
                    SizedBox(height: _gap),
                    _NGOTelegramField(),
                    SizedBox(height: _gap),
                    _NGOWhatsappField(),
                    SizedBox(height: _gap),
                    const _NGOServices(),
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
    );
  }

  _handleRegistration() async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // context.read<RegistrationBloc>().add(const RegistrationSecondStepCompleted(true));
      // context.read<RegistrationBloc>().add(const RegistrationFormChangedEvent());
      // context.read<RegistrationBloc>().add(const RegistrationOrganizationCreationRequest());
    }
  }
}

class _NGONameField extends StatelessWidget {
  const _NGONameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
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

                if (!state.isOrganizationNameValid) {
                  return 'This field need to contain at least 3 characters';
                }

                return null;
              },
            );
          },
        );

        // return DropdownSearch();
      },
    );
  }
}

class _NGOAddressField extends StatelessWidget {
  _NGOAddressField({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        _controller.text = state.organizationAddress;
      },
      listenWhen: (previous, current) => previous.organizationAddress != current.organizationAddress,
      buildWhen: (previous, current) => previous.organizationAddress != current.organizationAddress,
      builder: (context, state) {
        return MyFormField(
          controller: _controller,
          labelText: 'NGO\'s address*',
          hintText: 'e.g  Poland, Krakow, Zwiska str, 14',
          onSaved: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(organizationAddress: value ?? '')),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }

            if (!state.isOrganizationAddressValid) {
              return 'This field need to contain at least 3 characters';
            }

            return null;
          },
          suffixIcon: IconButton(
            icon: SvgPicture.asset('assets/icons/adress_action_button.svg'),
            onPressed: () async {
              AutoRouter.of(context).push(
                MapScreenRoute(
                  onAddressFound: (Map<String, dynamic> address, LatLng latLng) {
                    context
                        .read<RegistrationBloc>()
                        .add(RegistrationFormChangedEvent(organizationAddress: address['formatted_address']));
                    // controller.text = address['formatted_address'];

                    context.read<RegistrationBloc>().add(RegistrationPositionChanged(latLng));
                  },
                ),
              );
            },
          ),
        );
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
        _controller.text = state.positionInOrganization;
      },
      listenWhen: (previous, current) => previous.positionInOrganization != current.positionInOrganization,
      buildWhen: (previous, current) => previous.positionInOrganization != current.positionInOrganization,
      builder: (context, state) {
        return Column(
          children: [
            MyFormField(
              controller: _controller,
              labelText: 'Your position in NGO',
              hintText: 'Enter your position',
              onSaved: (String? value) => context
                  .read<RegistrationBloc>()
                  .add(RegistrationFormChangedEvent(positionInOrganization: value ?? '')),
              validator: (value) {
                if (value != null && value.isNotEmpty && value.length < 3) {
                  return 'This field need to contain at least 3 characters';
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

class _NGOEmailField extends StatelessWidget {
  _NGOEmailField({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        _controller.text = state.organizationEmail;
      },
      listenWhen: (previous, current) => previous.organizationEmail != current.organizationEmail,
      buildWhen: (previous, current) => previous.organizationEmail != current.organizationEmail,
      builder: (context, state) {
        return MyFormField(
          controller: _controller,
          labelText: 'NGO\' email*',
          hintText: 'Enter email',
          onSaved: (String? value) {
            context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(organizationEmail: value ?? ''));
          },
          validator: (value) {
            if (!state.isNGOEmailValid) {
              return 'Email is not valid!';
            }

            return null;
          },
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
        _controller.text = state.organizationID;
      },
      listenWhen: (previous, current) => previous.organizationID != current.organizationID,
      buildWhen: (previous, current) => previous.organizationID != current.organizationID,
      builder: (context, state) {
        return MyFormField(
          controller: _controller,
          labelText: 'NGO\' ID number',
          hintText: 'ID number',
          onSaved: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(organizationID: value ?? '')),
          validator: (value) {
            if (value != null && value.isNotEmpty && value.length < 3) {
              return 'This field need to contain at least 3 characters';
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
        _controller.text = state.organizationPhone;
      },
      listenWhen: (previous, current) => previous.organizationPhone != current.organizationPhone,
      buildWhen: (previous, current) => previous.organizationPhone != current.organizationPhone,
      builder: (context, state) {
        return MyFormField(
          controller: _controller,
          labelText: 'NGO\'s phone number*',
          hintText: 'Enter your organization\'s phone number',
          keyboardType: TextInputType.phone,
          onSaved: (String? value) =>
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

class _NGOServices extends StatelessWidget {
  const _NGOServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(services: categories));
          },
        )
      ],
    );
  }
}

class _NGOTelegramField extends StatelessWidget {
  _NGOTelegramField({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        _controller.text = state.organizationTelegram;
      },
      listenWhen: (previous, current) => previous.organizationTelegram != current.organizationTelegram,
      buildWhen: (previous, current) => previous.organizationTelegram != current.organizationTelegram,
      builder: (context, state) {
        return MyFormField(
          controller: _controller,
          labelText: 'NGO\'s telegram number',
          hintText: 'Enter your organization\'s telegram number',
          keyboardType: TextInputType.phone,
          onSaved: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(organizationTelegram: value ?? '')),
          validator: (value) {
            return null;
          },
        );
      },
    );
  }
}

class _NGOWhatsappField extends StatelessWidget {
  _NGOWhatsappField({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        _controller.text = state.organizationWhatsapp;
      },
      listenWhen: (previous, current) => previous.organizationWhatsapp != current.organizationWhatsapp,
      buildWhen: (previous, current) => previous.organizationWhatsapp != current.organizationWhatsapp,
      builder: (context, state) {
        return MyFormField(
          controller: _controller,
          labelText: 'NGO\'s whatsapp number',
          hintText: 'Enter your organization\'s whatsapp number',
          keyboardType: TextInputType.phone,
          onSaved: (String? value) =>
              context.read<RegistrationBloc>().add(RegistrationFormChangedEvent(organizationWhatsapp: value ?? '')),
          validator: (value) {
            return null;
          },
        );
      },
    );
  }
}
