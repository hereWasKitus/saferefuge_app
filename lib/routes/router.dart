import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:protect_ua_women/features/app/app.dart';
import 'package:protect_ua_women/features/home/view/poi_list.view.dart';
import 'package:protect_ua_women/features/map/map.dart';
import 'package:protect_ua_women/features/home/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreenView,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: Entrypoint,
      path: '/root',
      name: 'EntrypointRoute',
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          name: 'HomeRouter',
          path: 'home',
          children: [
            AutoRoute(
              page: HomeView,
              path: '',
            ),
            AutoRoute(
              page: POIListView,
              path: 'poi-list',
            )
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          path: 'empty',
          name: 'EmptyRoute',
        ),
      ],
    ),
    // CustomRoute(
    //   transitionsBuilder: TransitionsBuilders.slideLeft,
    //   page: OrganizationListView,
    //   name: 'OrganizationListRoute',
    //   path: '/organizations',
    //   durationInMilliseconds: defaultAnimationDuration,
    // ),
    AutoRoute(
      page: MapScreen,
      name: 'MapRoute',
      path: '/map',
    ),
  ],
)
class $AppRouter {}
