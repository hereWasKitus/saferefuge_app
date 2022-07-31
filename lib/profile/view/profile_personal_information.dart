import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/profile/profile.dart';

class ProfilePersonalInformationView extends StatelessWidget {
  const ProfilePersonalInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Edit personal information'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: grey,
        ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 42,
              backgroundColor: Color(0xFFD9D9D9),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text('Coming soon!'),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: grey2,
                    ),
                  );
              },
              child: const Text(
                'Change profile photo',
                style: TextStyle(color: actionColor, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 32),
            const ProfileForm(),
          ],
        ),
      ),
    );
  }
}
