import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/app/app.dart';
import 'package:protect_ua_women/auth/registration/registration.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';

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
      name: 'HomeScreenRoute',
    ),
    AutoRoute(
      page: SplashScreen,
      path: '/splash',
      name: 'SplashScreenRoute',
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      page: OrganizationListView,
      name: 'OrganizationListRoute',
      path: '/organizations',
      durationInMilliseconds: defaultAnimationDuration,
    ),
    AutoRoute(
      page: MapView,
      name: 'MapScreenRoute',
      path: '/choosePoint',
    ),
    CustomRoute(
      path: '/registration',
      name: 'RegistrationRoute',
      page: OrganizationRegistrationView,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: defaultAnimationDuration,
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
)
class $AppRouter {}
