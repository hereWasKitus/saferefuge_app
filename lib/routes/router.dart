import 'package:auto_route/auto_route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/entrypoint.dart';
import 'package:protect_ua_women/screens/authorization/authorization_wrapper.dart';
import 'package:protect_ua_women/screens/authorization/components/organization_registration_form_1.dart';
import 'package:protect_ua_women/screens/authorization/components/organization_registration_form_2.dart';
import 'package:protect_ua_women/screens/authorization/components/thank_you.dart';
import 'package:protect_ua_women/screens/authorization/registration_screen.dart';
import 'package:protect_ua_women/screens/home/home_screen.dart';
import 'package:protect_ua_women/screens/map/map_screen.dart';
import 'package:protect_ua_women/screens/organization_list/organization_list_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: Entrypoint,
      path: '/',
      initial: true,
      fullMatch: true,
    ),
    AutoRoute(
      page: HomeScreen,
      path: '/home',
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      page: OrganizationListScreen,
      path: '/organizations',
      durationInMilliseconds: defaultAnimationDuration,
    ),
    AutoRoute(
      page: MapScreen,
      name: 'MapScreenRoute',
      path: '/choosePoint',
    ),
    AutoRoute(
      page: AuthorizationScreenWrapper,
      name: 'AuthorizationRoute',
      path: '/authorization',
      children: [
        AutoRoute(
          path: 'registration',
          name: 'RegistrationRoute',
          page: OrganizationRegistrationScreen,
          initial: true,
          children: [
            AutoRoute(
              path: 'step1',
              name: 'RegistrationFirstStepRoute',
              page: OrganizationRegistrationForm1,
            ),
            AutoRoute(
              path: 'step2',
              name: 'RegistrationSecondStepRoute',
              page: OrganizationRegistrationForm2,
            ),
            AutoRoute(
              path: 'thank-you',
              name: 'ThankYouRoute',
              page: ThankYou,
            )
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
