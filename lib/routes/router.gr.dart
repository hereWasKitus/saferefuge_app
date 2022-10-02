// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i7;

import '../features/app/app.dart' as _i1;
import '../features/home/home.dart' as _i4;
import '../features/home/view/poi_list.view.dart' as _i5;
import '../features/map/map.dart' as _i2;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreenView());
    },
    EntrypointRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.MapScreen(
              key: args.key, onPointSelected: args.onPointSelected));
    },
    HomeRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    EmptyRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeView());
    },
    POIListRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.POIListView());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i6.RouteConfig(EntrypointRoute.name, path: '/root', children: [
          _i6.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: EntrypointRoute.name,
              children: [
                _i6.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i6.RouteConfig(POIListRoute.name,
                    path: 'poi-list', parent: HomeRouter.name)
              ]),
          _i6.RouteConfig(EmptyRoute.name,
              path: 'empty', parent: EntrypointRoute.name)
        ]),
        _i6.RouteConfig(MapRoute.name, path: '/map')
      ];
}

/// generated route for
/// [_i1.SplashScreenView]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i1.Entrypoint]
class EntrypointRoute extends _i6.PageRouteInfo<void> {
  const EntrypointRoute({List<_i6.PageRouteInfo>? children})
      : super(EntrypointRoute.name, path: '/root', initialChildren: children);

  static const String name = 'EntrypointRoute';
}

/// generated route for
/// [_i2.MapScreen]
class MapRoute extends _i6.PageRouteInfo<MapRouteArgs> {
  MapRoute(
      {_i7.Key? key,
      required void Function(Map<String, dynamic>, _i7.BuildContext)
          onPointSelected})
      : super(MapRoute.name,
            path: '/map',
            args: MapRouteArgs(key: key, onPointSelected: onPointSelected));

  static const String name = 'MapRoute';
}

class MapRouteArgs {
  const MapRouteArgs({this.key, required this.onPointSelected});

  final _i7.Key? key;

  final void Function(Map<String, dynamic>, _i7.BuildContext) onPointSelected;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, onPointSelected: $onPointSelected}';
  }
}

/// generated route for
/// [_i3.EmptyRouterPage]
class HomeRouter extends _i6.PageRouteInfo<void> {
  const HomeRouter({List<_i6.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class EmptyRoute extends _i6.PageRouteInfo<void> {
  const EmptyRoute() : super(EmptyRoute.name, path: 'empty');

  static const String name = 'EmptyRoute';
}

/// generated route for
/// [_i4.HomeView]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.POIListView]
class POIListRoute extends _i6.PageRouteInfo<void> {
  const POIListRoute() : super(POIListRoute.name, path: 'poi-list');

  static const String name = 'POIListRoute';
}
