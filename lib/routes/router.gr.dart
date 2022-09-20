// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../features/app/app.dart' as _i1;
import '../features/home/home.dart' as _i3;
import '../features/map/map.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreenView());
    },
    EntrypointRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.MapScreen(
              key: args.key, onPointSelected: args.onPointSelected));
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeView());
    },
    EmptyRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i4.RouteConfig(EntrypointRoute.name, path: '/root', children: [
          _i4.RouteConfig(HomeRoute.name,
              path: 'home', parent: EntrypointRoute.name),
          _i4.RouteConfig(EmptyRoute.name,
              path: 'empty', parent: EntrypointRoute.name)
        ]),
        _i4.RouteConfig(MapRoute.name, path: '/map')
      ];
}

/// generated route for
/// [_i1.SplashScreenView]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i1.Entrypoint]
class EntrypointRoute extends _i4.PageRouteInfo<void> {
  const EntrypointRoute({List<_i4.PageRouteInfo>? children})
      : super(EntrypointRoute.name, path: '/root', initialChildren: children);

  static const String name = 'EntrypointRoute';
}

/// generated route for
/// [_i2.MapScreen]
class MapRoute extends _i4.PageRouteInfo<MapRouteArgs> {
  MapRoute(
      {_i5.Key? key,
      required void Function(Map<String, dynamic>, _i5.BuildContext)
          onPointSelected})
      : super(MapRoute.name,
            path: '/map',
            args: MapRouteArgs(key: key, onPointSelected: onPointSelected));

  static const String name = 'MapRoute';
}

class MapRouteArgs {
  const MapRouteArgs({this.key, required this.onPointSelected});

  final _i5.Key? key;

  final void Function(Map<String, dynamic>, _i5.BuildContext) onPointSelected;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, onPointSelected: $onPointSelected}';
  }
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class EmptyRoute extends _i4.PageRouteInfo<void> {
  const EmptyRoute() : super(EmptyRoute.name, path: 'empty');

  static const String name = 'EmptyRoute';
}
