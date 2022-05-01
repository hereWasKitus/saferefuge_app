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
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i6;

import '../app/app.dart' as _i1;
import '../auth/registration/registration.dart' as _i3;
import '../home/home.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Entrypoint.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    HomeScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    OrganizationListRoute.name: (routeData) {
      final args = routeData.argsAs<OrganizationListRouteArgs>();
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.OrganizationListView(
              key: args.key,
              pois: args.pois,
              currentPosition: args.currentPosition),
          transitionsBuilder: _i4.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i3.MapView(key: args.key, onAddressFound: args.onAddressFound));
    },
    RegistrationRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.OrganizationRegistrationView(),
          transitionsBuilder: _i4.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    RegistrationFirstStepRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i3.OrganizationRegistrationForm1());
    },
    RegistrationSecondStepRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i3.OrganizationRegistrationForm2());
    },
    ThankYouRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ThankYou());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(Entrypoint.name, path: '/', fullMatch: true),
        _i4.RouteConfig(HomeScreenRoute.name, path: '/home'),
        _i4.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i4.RouteConfig(OrganizationListRoute.name, path: '/organizations'),
        _i4.RouteConfig(MapScreenRoute.name, path: '/choosePoint'),
        _i4.RouteConfig(RegistrationRoute.name,
            path: '/registration',
            children: [
              _i4.RouteConfig(RegistrationFirstStepRoute.name,
                  path: 'step1', parent: RegistrationRoute.name),
              _i4.RouteConfig(RegistrationSecondStepRoute.name,
                  path: 'step2', parent: RegistrationRoute.name),
              _i4.RouteConfig(ThankYouRoute.name,
                  path: 'thank-you', parent: RegistrationRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.Entrypoint]
class Entrypoint extends _i4.PageRouteInfo<void> {
  const Entrypoint() : super(Entrypoint.name, path: '/');

  static const String name = 'Entrypoint';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i4.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.OrganizationListView]
class OrganizationListRoute
    extends _i4.PageRouteInfo<OrganizationListRouteArgs> {
  OrganizationListRoute(
      {_i5.Key? key,
      required List<_i2.POI> pois,
      required _i6.LatLng currentPosition})
      : super(OrganizationListRoute.name,
            path: '/organizations',
            args: OrganizationListRouteArgs(
                key: key, pois: pois, currentPosition: currentPosition));

  static const String name = 'OrganizationListRoute';
}

class OrganizationListRouteArgs {
  const OrganizationListRouteArgs(
      {this.key, required this.pois, required this.currentPosition});

  final _i5.Key? key;

  final List<_i2.POI> pois;

  final _i6.LatLng currentPosition;

  @override
  String toString() {
    return 'OrganizationListRouteArgs{key: $key, pois: $pois, currentPosition: $currentPosition}';
  }
}

/// generated route for
/// [_i3.MapView]
class MapScreenRoute extends _i4.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute(
      {_i5.Key? key,
      required void Function(Map<String, dynamic>, _i6.LatLng) onAddressFound})
      : super(MapScreenRoute.name,
            path: '/choosePoint',
            args: MapScreenRouteArgs(key: key, onAddressFound: onAddressFound));

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({this.key, required this.onAddressFound});

  final _i5.Key? key;

  final void Function(Map<String, dynamic>, _i6.LatLng) onAddressFound;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, onAddressFound: $onAddressFound}';
  }
}

/// generated route for
/// [_i3.OrganizationRegistrationView]
class RegistrationRoute extends _i4.PageRouteInfo<void> {
  const RegistrationRoute({List<_i4.PageRouteInfo>? children})
      : super(RegistrationRoute.name,
            path: '/registration', initialChildren: children);

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i3.OrganizationRegistrationForm1]
class RegistrationFirstStepRoute extends _i4.PageRouteInfo<void> {
  const RegistrationFirstStepRoute()
      : super(RegistrationFirstStepRoute.name, path: 'step1');

  static const String name = 'RegistrationFirstStepRoute';
}

/// generated route for
/// [_i3.OrganizationRegistrationForm2]
class RegistrationSecondStepRoute extends _i4.PageRouteInfo<void> {
  const RegistrationSecondStepRoute()
      : super(RegistrationSecondStepRoute.name, path: 'step2');

  static const String name = 'RegistrationSecondStepRoute';
}

/// generated route for
/// [_i3.ThankYou]
class ThankYouRoute extends _i4.PageRouteInfo<void> {
  const ThankYouRoute() : super(ThankYouRoute.name, path: 'thank-you');

  static const String name = 'ThankYouRoute';
}
