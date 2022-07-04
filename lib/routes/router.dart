import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/app/app.dart';
import 'package:protect_ua_women/login/login.dart';
import 'package:protect_ua_women/map/map.dart';
import 'package:protect_ua_women/registration/registration.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/profile/profile.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      path: '/',
      name: 'SplashScreenRoute',
      initial: true,
    ),
    AutoRoute(
      page: Entrypoint,
      path: '/root',
      name: 'EntrypointRoute',
      children: [
        AutoRoute(
          page: HomeScreen,
          path: 'home',
          name: 'HomeRoute',
        ),
        AutoRoute(
          page: EmptyRouterPage,
          path: 'empty',
          name: 'EmptyRoute',
        ),
        CustomRoute(
          page: ProfileView,
          path: 'profile',
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
            ),
          ],
        ),
      ],
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
          path: 'step4',
          name: 'RegistrationFourthStepRoute',
          page: RegistrationView4,
        ),
        AutoRoute(
          path: 'thank-you',
          name: 'ThankYouRoute',
          page: ThankYouView,
        )
      ],
    ),
    CustomRoute(
      page: LoginView,
      path: '/login',
      name: 'LoginRoute',
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: defaultAnimationDuration,
    ),
    CustomRoute(
      transitionsBuilder: TransitionsBuilders.slideLeft,
      page: OrganizationListView,
      name: 'OrganizationListRoute',
      path: '/organizations',
      durationInMilliseconds: defaultAnimationDuration,
    ),
    AutoRoute(
      // remove this later
      page: MapView,
      name: 'MapScreenRoute',
      path: '/choosePoint',
    ),
    AutoRoute(
      page: MapScreen,
      name: 'MapRoute',
      path: '/map',
    ),
    AutoRoute(
      page: AddBranchView,
      name: 'AddBranchRoute',
      path: '/add-branch',
    ),
  ],
)
class $AppRouter {}
