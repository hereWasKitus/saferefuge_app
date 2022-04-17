import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/entrypoint.dart';
import 'package:protect_ua_women/screens/authorization/authorization_wrapper.dart';
import 'package:protect_ua_women/screens/authorization/components/organization_registration_form_1.dart';
import 'package:protect_ua_women/screens/authorization/components/organization_registration_form_2.dart';
import 'package:protect_ua_women/screens/authorization/registration_screen.dart';
import 'package:protect_ua_women/screens/home/home_screen.dart';
import 'package:protect_ua_women/screens/organization_list_screen/organization_list_screen.dart';

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
      // initial: true,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      page: OrganizationListScreen,
      path: '/organizations',
      durationInMilliseconds: defaultAnimationDuration,
      // initial: true,
    ),
    // AutoRoute(
    //   page: AuthorizationScreenWrapper,
    //   name: 'AuthorizationRoute',
    //   path: '/authorization',
    //   children: [
    //     AutoRoute(
    //       path: 'registration',
    //       name: 'RegistrationRoute',
    //       page: OrganizationRegistrationScreen,
    //       initial: true,
    //       children: [
    //         AutoRoute(
    //           path: 'step1',
    //           name: 'RegistrationFirstStepRoute',
    //           page: OrganizationRegistrationForm1,
    //           initial: true,
    //         ),
    //         AutoRoute(
    //           path: 'step2',
    //           name: 'RegistrationFirstSecondRoute',
    //           page: OrganizationRegistrationForm2,
    //         )
    //       ],
    //     ),
    //   ],
    // ),
  ],
)
class $AppRouter {}
