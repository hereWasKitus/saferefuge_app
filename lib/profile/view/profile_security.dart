import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

class ProfileSecurityView extends StatelessWidget {
  const ProfileSecurityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Security'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: grey,
        ),
        titleSpacing: defaultPadding,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.router.pop(),
            color: grey,
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ListView(
          shrinkWrap: true,
          children: ListTile.divideTiles(
            context: context,
            color: const Color(0xFFCCCCCC),
            tiles: [
              ListTile(
                leading: const Icon(Icons.key_outlined),
                title: const Text('Change password'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  log(context.router.current.name);
                  context.router.push(const ProfileChangePasswordRoute());
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email address'),
                trailing: const Icon(Icons.arrow_forward_ios),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                onTap: () => context.router.push(const ProfileChangeEmailRoute()),
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete account'),
                trailing: const Icon(Icons.arrow_forward_ios),
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                onTap: () => context.router.push(const ProfileDeleteRoute()),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
