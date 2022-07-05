import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:protect_ua_women/config/constants.dart';
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
            const _YourPosition(),
            const SizedBox(height: 8),
            const _OrganizationName(),
            const SizedBox(height: 8),
            const _OrganizationCountry(),
            const SizedBox(height: 24),
            BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (previous, current) => previous.formStatus != current.formStatus,
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (state.formStatus == FormStatus.changed || state.formStatus == FormStatus.updateFail) {
                      context.read<ProfileBloc>().add(const ProfileUpdateRequest());
                    }
                  },
                  child: state.formStatus == FormStatus.loading
                      ? const SpinKitCircle(color: Colors.white)
                      : const Text('Save'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(defaultBorderRadius),
                      ),
                    ),
                    splashFactory:
                        state.formStatus == FormStatus.changed ? InkRipple.splashFactory : NoSplash.splashFactory,
                    primary: state.formStatus == FormStatus.changed
                        ? const Color.fromRGBO(27, 50, 132, 1)
                        : const Color.fromRGBO(27, 50, 132, .7),
                  ),
                );
              },
            )
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
        return MyFormField(
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
          enabled: false,
          labelText: 'Organization name',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(organizationName: value)),
          initialValue: state.organizationName,
        );
      },
    );
  }
}

class _OrganizationCountry extends StatelessWidget {
  const _OrganizationCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => previous.organizationCountry != current.organizationCountry,
      builder: (context, state) {
        return MyFormField(
          enabled: false,
          labelText: 'Organization country',
          onChanged: (value) => context.read<ProfileBloc>().add(ProfileFormChangedEvent(organizationCountry: value)),
          initialValue: state.organizationCountry,
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
