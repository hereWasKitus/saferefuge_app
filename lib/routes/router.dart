import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/app/app.dart';
import 'package:protect_ua_women/auth/registration/registration.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/profile/view/profile_view.dart';

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
      page: RegistrationView,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: defaultAnimationDuration,
      children: [
        AutoRoute(
          path: 'step1',
          name: 'RegistrationFirstStepRoute',
          page: RegistrationView1,
        ),
        AutoRoute(
          path: 'step2',
          name: 'RegistrationSecondStepRoute',
          page: RegistrationView2,
        ),
        AutoRoute(
          path: 'step3',
          name: 'RegistrationThirdStepRoute',
          page: RegistrationView3,
        ),
        AutoRoute(
          path: 'thank-you',
          name: 'ThankYouRoute',
          page: ThankYouView,
        )
      ],
    ),
    CustomRoute(
      page: ProfileView,
      path: '/profile',
      name: 'ProfileRoute',
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: defaultAnimationDuration,
      children: [
        CustomRoute(
          path: '',
          name: 'ProfileFormRoute',
          page: ProfileForm,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: defaultAnimationDuration,
        ),
        CustomRoute(
          path: 'requests',
          name: 'ProfileRequestsRoute',
          page: Requests,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: defaultAnimationDuration,
        ),
        CustomRoute(
          path: 'branches',
          name: 'ProfileBranchesRoute',
          page: BranchesList,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: defaultAnimationDuration,
        )
      ],
    )
  ],
)
class $AppRouter {}
