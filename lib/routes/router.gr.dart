// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'dart:async' as _i6;

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:map_repository/map_repository.dart' as _i7;

import '../features/app/app.dart' as _i1;
import '../features/home/home.dart' as _i2;
import '../features/map/map.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    EntrypointRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    OrganizationListRoute.name: (routeData) {
      final args = routeData.argsAs<OrganizationListRouteArgs>();
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.OrganizationListView(key: args.key, pois: args.pois),
          transitionsBuilder: _i4.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.MapScreen(
              key: args.key, onPointSelected: args.onPointSelected));
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
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
        _i4.RouteConfig(OrganizationListRoute.name, path: '/organizations'),
        _i4.RouteConfig(MapRoute.name, path: '/map')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
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
/// [_i2.OrganizationListView]
class OrganizationListRoute
    extends _i4.PageRouteInfo<OrganizationListRouteArgs> {
  OrganizationListRoute({_i5.Key? key, required _i6.Future<List<_i7.POI>> pois})
      : super(OrganizationListRoute.name,
            path: '/organizations',
            args: OrganizationListRouteArgs(key: key, pois: pois));

  static const String name = 'OrganizationListRoute';
}

class OrganizationListRouteArgs {
  const OrganizationListRouteArgs({this.key, required this.pois});

  final _i5.Key? key;

  final _i6.Future<List<_i7.POI>> pois;

  @override
  String toString() {
    return 'OrganizationListRouteArgs{key: $key, pois: $pois}';
  }
}

/// generated route for
/// [_i3.MapScreen]
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
/// [_i2.HomeScreen]
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
