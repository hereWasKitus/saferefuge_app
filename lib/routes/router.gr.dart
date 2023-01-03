// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i6;

import '../features/app/app.dart' as _i1;
import '../features/home/home.dart' as _i2;
import '../features/map/map.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreenView());
    },
    EntrypointRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    FiltersRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.FiltersView(),
          transitionsBuilder: _i5.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.MapScreen(
              key: args.key, onPointSelected: args.onPointSelected));
    },
    HomeRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    EmptyRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    POIListRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.POIListView());
    },
    SinglePOIRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SinglePOIRouteArgs>(
          orElse: () => SinglePOIRouteArgs(poiID: pathParams.getString('id')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.SinglePOIView(key: args.key, poiID: args.poiID));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i5.RouteConfig(EntrypointRoute.name, path: '/root', children: [
          _i5.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: EntrypointRoute.name,
              children: [
                _i5.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i5.RouteConfig(POIListRoute.name,
                    path: 'pois', parent: HomeRouter.name),
                _i5.RouteConfig(SinglePOIRoute.name,
                    path: 'pois/:id', parent: HomeRouter.name)
              ]),
          _i5.RouteConfig(EmptyRoute.name,
              path: 'empty', parent: EntrypointRoute.name)
        ]),
        _i5.RouteConfig(FiltersRoute.name, path: '/filters'),
        _i5.RouteConfig(MapRoute.name, path: '/map')
      ];
}

/// generated route for
/// [_i1.SplashScreenView]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i1.Entrypoint]
class EntrypointRoute extends _i5.PageRouteInfo<void> {
  const EntrypointRoute({List<_i5.PageRouteInfo>? children})
      : super(EntrypointRoute.name, path: '/root', initialChildren: children);

  static const String name = 'EntrypointRoute';
}

/// generated route for
/// [_i2.FiltersView]
class FiltersRoute extends _i5.PageRouteInfo<void> {
  const FiltersRoute() : super(FiltersRoute.name, path: '/filters');

  static const String name = 'FiltersRoute';
}

/// generated route for
/// [_i3.MapScreen]
class MapRoute extends _i5.PageRouteInfo<MapRouteArgs> {
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
/// [_i4.EmptyRouterPage]
class HomeRouter extends _i5.PageRouteInfo<void> {
  const HomeRouter({List<_i5.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class EmptyRoute extends _i5.PageRouteInfo<void> {
  const EmptyRoute() : super(EmptyRoute.name, path: 'empty');

  static const String name = 'EmptyRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.POIListView]
class POIListRoute extends _i5.PageRouteInfo<void> {
  const POIListRoute() : super(POIListRoute.name, path: 'pois');

  static const String name = 'POIListRoute';
}

/// generated route for
/// [_i2.SinglePOIView]
class SinglePOIRoute extends _i5.PageRouteInfo<SinglePOIRouteArgs> {
  SinglePOIRoute({_i7.Key? key, required String poiID})
      : super(SinglePOIRoute.name,
            path: 'pois/:id',
            args: SinglePOIRouteArgs(key: key, poiID: poiID),
            rawPathParams: {'id': poiID});

  static const String name = 'SinglePOIRoute';
}

class SinglePOIRouteArgs {
  const SinglePOIRouteArgs({this.key, required this.poiID});

  final _i7.Key? key;

  final String poiID;

  @override
  String toString() {
    return 'SinglePOIRouteArgs{key: $key, poiID: $poiID}';
  }
}
