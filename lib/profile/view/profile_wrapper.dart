import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/profile/view/profile_view.dart';
import 'package:protect_ua_women/registration/view/registration_view.dart';

class ProfileWrapper extends StatelessWidget {
  const ProfileWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state.formChanged) {
        return const ProfileView();
      } else {
        return const RegistrationView();
      }
    });
  }
}
