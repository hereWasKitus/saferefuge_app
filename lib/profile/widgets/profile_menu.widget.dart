import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/profile/bloc/profile_bloc.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        context: context,
        color: const Color(0xFFCCCCCC),
        tiles: [
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Personal information'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.router.push(const ProfilePersonalInformationRoute()),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user_outlined),
            title: const Text('Security'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.router.push(const ProfileSecurityRouter()),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () => context.read<ProfileBloc>().add(const ProfileLogoutRequest()),
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          ),
        ],
      ).toList(),
    );
  }
}
