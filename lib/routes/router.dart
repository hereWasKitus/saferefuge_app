import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/app/app.dart';
import 'package:protect_ua_women/login/login.dart';
import 'package:protect_ua_women/map/map.dart';
import 'package:protect_ua_women/password_reset/view/view.dart';
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
          page: EmptyRouterPage,
          path: 'profile',
          name: 'ProfileRouter',
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: defaultAnimationDuration,
          children: [
            CustomRoute(
              page: ProfileView,
              path: '',
              children: [
                CustomRoute(
                  path: 'menu',
                  name: 'ProfileMenuRoute',
                  page: ProfileMenu,
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
            CustomRoute(
              path: 'personal-information',
              name: 'ProfilePersonalInformationRoute',
              page: ProfilePersonalInformationView,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              durationInMilliseconds: defaultAnimationDuration,
            ),
            CustomRoute(
              path: 'security',
              name: 'ProfileSecurityRouter',
              page: EmptyRouterPage,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              durationInMilliseconds: defaultAnimationDuration,
              children: [
                AutoRoute(
                  path: '',
                  page: ProfileSecurityView,
                ),
                CustomRoute(
                  path: 'change-password',
                  name: 'ProfileChangePasswordRoute',
                  page: ProfileChangePasswordView,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                  durationInMilliseconds: defaultAnimationDuration,
                ),
                CustomRoute(
                  path: 'change-email',
                  name: 'ProfileChangeEmailRoute',
                  page: ProfileChangeEmailView,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                  durationInMilliseconds: defaultAnimationDuration,
                ),
                CustomRoute(
                  path: 'delete',
                  name: 'ProfileDeleteRoute',
                  page: ProfileDeleteView,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                  durationInMilliseconds: defaultAnimationDuration,
                ),
              ],
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
      page: PasswordResetWrapperView,
      path: '/password-reset',
      name: 'PasswordResetRouter',
      transitionsBuilder: TransitionsBuilders.slideLeft,
      children: [
        AutoRoute(
          path: '',
          name: 'PasswordResetEmailFormRoute',
          page: PasswordResetEmailFormView,
        ),
        AutoRoute(
          path: 'code-form',
          name: 'PasswordResetCodeFormRoute',
          page: PasswordResetCodeFormView,
        ),
        AutoRoute(
          path: 'password-form',
          name: 'PasswordResetPasswordFormRoute',
          page: PasswordResetPasswordFormView,
        ),
      ],
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
