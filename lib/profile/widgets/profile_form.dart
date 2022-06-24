import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/registration/registration.dart';
import 'package:protect_ua_women/widgets/form/my_form_field.dart';
import 'package:protect_ua_women/profile/profile.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        switch (state.formStatus) {
          case FormStatus.updateFail:
            _showSnackBar(text: state.errorMessage, color: red);
            break;
          case FormStatus.updateSucceed:
            _showSnackBar(text: 'Successfully updated!', color: green);
            break;
          default:
        }
      },
      listenWhen: (previous, current) => previous.formStatus != current.formStatus,
      child: Form(
        key: _formKey,
        onChanged: () {
          context.read<ProfileBloc>().add(const ProfileFormStatusChanged(FormStatus.changed));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _FullName(),
            const SizedBox(height: 8),
            const _OrganizationName(),
            const SizedBox(height: 8),
            const _OrganizationAddress(),
            const SizedBox(height: 8),
            const _OrganizationPhone(),
            const SizedBox(height: 8),
            const _OrganizationRegistrationNumber(),
            const SizedBox(height: 8),
            const _OrganizationEmail(),
            const SizedBox(height: 8),
            const _OrganizationWhatsapp(),
            const SizedBox(height: 8),
            const _OrganizationTelegram(),
            const SizedBox(height: 8),
            const _YourPosition(),
            const SizedBox(height: 8),
            const Text(
              'Services you provide',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (previous, current) => previous.services != current.services,
              builder: (context, state) {
                return CategoryList(
                  onSelected: (cats) {},
                  selected: state.services,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar({required String text, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color ?? primaryColor,
      ),
    );
  }
}

class _FullName extends StatelessWidget {
  const _FullName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return state.isLoading
            ? const SpinKitCircle(
                color: primaryColor,
              )
            : MyFormField(
                labelText: 'Your name',
                onChanged: (value) {
                  context.read<ProfileBloc>().add(ProfileFormChangedEvent(name: value));
                },
                initialValue: state.name,
              );
      },
    );
  }
}

class _OrganizationName extends StatelessWidget {
  const _OrganizationName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.organizationName != current.organizationName,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Organization name',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(organizationName: value)),
          initialValue: state.organizationName,
        );
      },
    );
  }
}

class _OrganizationAddress extends StatelessWidget {
  const _OrganizationAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.organizationAddress != current.organizationAddress,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Organization address',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(organizationAddress: value)),
          initialValue: state.organizationAddress,
        );
      },
    );
  }
}

class _OrganizationPhone extends StatelessWidget {
  const _OrganizationPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.organizationPhone != current.organizationPhone,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Organization phone',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(organizationPhone: value)),
          initialValue: state.organizationPhone,
        );
      },
    );
  }
}

class _OrganizationRegistrationNumber extends StatelessWidget {
  const _OrganizationRegistrationNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.registrationNumber != current.registrationNumber,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Registration number',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(registrationNumber: value)),
          initialValue: state.registrationNumber,
        );
      },
    );
  }
}

class _OrganizationEmail extends StatelessWidget {
  const _OrganizationEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.organizationEmail != current.organizationEmail,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Organization email',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(organizationEmail: value)),
          initialValue: state.organizationEmail,
        );
      },
    );
  }
}

class _OrganizationWhatsapp extends StatelessWidget {
  const _OrganizationWhatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.organizationWhatsapp != current.organizationWhatsapp,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Organization whatsapp',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(organizationWhatsapp: value)),
          initialValue: state.organizationWhatsapp,
        );
      },
    );
  }
}

class _OrganizationTelegram extends StatelessWidget {
  const _OrganizationTelegram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.organizationTelegram != current.organizationTelegram,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Organization telegram',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(organizationTelegram: value)),
          initialValue: state.organizationTelegram,
        );
      },
    );
  }
}

class _YourPosition extends StatelessWidget {
  const _YourPosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.organizationPosition != current.organizationPosition,
      builder: (context, state) {
        return MyFormField(
          labelText: 'Your position',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(organizationPosition: value)),
          initialValue: state.organizationPosition,
        );
      },
    );
  }
}
