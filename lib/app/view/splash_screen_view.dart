import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protect_ua_women/config/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _heading = const TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 36,
    );

    // TextStyle _headingYellow = const TextStyle(
    //   color: yellow,
    //   fontWeight: FontWeight.w500,
    //   fontSize: 36,
    // );

    // TextStyle _subtitle = const TextStyle(
    //   color: Colors.white,
    //   fontSize: 24,
    // );

    return Scaffold(
      // backgroundColor: const Color.fromRGBO(71, 66, 221, 1),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text(
              'Refugee Safeway\r\n+',
              style: _heading,
              textAlign: TextAlign.center,
            ),
            SvgPicture.asset(
              'assets/icons/purple_vest_mission.svg',
              width: 200,
              height: 200,
            )
            // Row(
            //   children: [
            //     Text(
            //       'Women',
            //       style: _headingYellow,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 8, right: 8),
            //       child: Text(
            //         '&',
            //         style: _heading,
            //       ),
            //     ),
            //     Text(
            //       'Children',
            //       style: _headingYellow,
            //     ),
            //   ],
            //   mainAxisAlignment: MainAxisAlignment.center,
            // ),
            // const SizedBox(
            //   height: 24,
            // ),
            // Text(
            //   'Let\'s find your safe way',
            //   style: _subtitle,
            // ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
