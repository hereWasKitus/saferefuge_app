import 'package:auto_route/auto_route.dart';
import 'package:protect_ua_women/features/app/app.dart';
import 'package:protect_ua_women/features/map/map.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'package:protect_ua_women/features/home/home.dart';

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
      page: MapScreen,
      name: 'MapRoute',
      path: '/map',
    ),
  ],
)
class $AppRouter {}
