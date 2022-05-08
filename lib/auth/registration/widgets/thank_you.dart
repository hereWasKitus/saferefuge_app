import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';

import '../registration.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: defaultPadding,
            right: defaultPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 36),
                  children: [
                    TextSpan(
                      text: state.fullName,
                      style: const TextStyle(color: Color(0xFF1B3284), fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: ', \r\nwelcome to\r\nSafeWay community!',
                      style: TextStyle(color: Color.fromRGBO(93, 84, 84, 1)),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 36),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF5E5555),
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Now you have access to '),
                    TextSpan(
                      text: '68',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(71, 66, 221, 0.7),
                      ),
                    ),
                    TextSpan(text: ' organizations!'),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              const Text(
                'We are here to help!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
