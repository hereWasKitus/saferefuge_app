// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i13;

import '../entrypoint.dart' as _i1;
import '../models/poi.model.dart' as _i12;
import '../screens/authorization/authorization_wrapper.dart' as _i5;
import '../screens/authorization/components/organization_registration_form_1.dart'
    as _i7;
import '../screens/authorization/components/organization_registration_form_2.dart'
    as _i8;
import '../screens/authorization/components/thank_you.dart' as _i9;
import '../screens/authorization/registration_screen.dart' as _i6;
import '../screens/home/home_screen.dart' as _i2;
import '../screens/map/map_screen.dart' as _i4;
import '../screens/organization_list/organization_list_screen.dart' as _i3;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    Entrypoint.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    HomeScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    OrganizationListScreen.name: (routeData) {
      final args = routeData.argsAs<OrganizationListScreenArgs>();
      return _i10.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.OrganizationListScreen(
              key: args.key,
              pois: args.pois,
              currentPosition: args.currentPosition),
          transitionsBuilder: _i10.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.MapScreen(
              key: args.key, onAddressFound: args.onAddressFound));
    },
    AuthorizationRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AuthorizationScreenWrapper());
    },
    RegistrationRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i6.OrganizationRegistrationScreen());
    },
    RegistrationFirstStepRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i7.OrganizationRegistrationForm1());
    },
    RegistrationSecondStepRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i8.OrganizationRegistrationForm2());
    },
    ThankYouRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ThankYou());
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(Entrypoint.name, path: '/', fullMatch: true),
        _i10.RouteConfig(HomeScreen.name, path: '/home'),
        _i10.RouteConfig(OrganizationListScreen.name, path: '/organizations'),
        _i10.RouteConfig(MapScreenRoute.name, path: '/choosePoint'),
        _i10.RouteConfig(AuthorizationRoute.name,
            path: '/authorization',
            children: [
              _i10.RouteConfig('#redirect',
                  path: '',
                  parent: AuthorizationRoute.name,
                  redirectTo: 'registration',
                  fullMatch: true),
              _i10.RouteConfig(RegistrationRoute.name,
                  path: 'registration',
                  parent: AuthorizationRoute.name,
                  children: [
                    _i10.RouteConfig(RegistrationFirstStepRoute.name,
                        path: 'step1', parent: RegistrationRoute.name),
                    _i10.RouteConfig(RegistrationSecondStepRoute.name,
                        path: 'step2', parent: RegistrationRoute.name),
                    _i10.RouteConfig(ThankYouRoute.name,
                        path: 'thank-you', parent: RegistrationRoute.name)
                  ])
            ])
      ];
}

/// generated route for
/// [_i1.Entrypoint]
class Entrypoint extends _i10.PageRouteInfo<void> {
  const Entrypoint() : super(Entrypoint.name, path: '/');

  static const String name = 'Entrypoint';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i10.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i3.OrganizationListScreen]
class OrganizationListScreen
    extends _i10.PageRouteInfo<OrganizationListScreenArgs> {
  OrganizationListScreen(
      {_i11.Key? key,
      required List<_i12.POI> pois,
      required _i13.LatLng currentPosition})
      : super(OrganizationListScreen.name,
            path: '/organizations',
            args: OrganizationListScreenArgs(
                key: key, pois: pois, currentPosition: currentPosition));

  static const String name = 'OrganizationListScreen';
}

class OrganizationListScreenArgs {
  const OrganizationListScreenArgs(
      {this.key, required this.pois, required this.currentPosition});

  final _i11.Key? key;

  final List<_i12.POI> pois;

  final _i13.LatLng currentPosition;

  @override
  String toString() {
    return 'OrganizationListScreenArgs{key: $key, pois: $pois, currentPosition: $currentPosition}';
  }
}

/// generated route for
/// [_i4.MapScreen]
class MapScreenRoute extends _i10.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute(
      {_i11.Key? key,
      required void Function(Map<String, dynamic>, _i13.LatLng) onAddressFound})
      : super(MapScreenRoute.name,
            path: '/choosePoint',
            args: MapScreenRouteArgs(key: key, onAddressFound: onAddressFound));

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({this.key, required this.onAddressFound});

  final _i11.Key? key;

  final void Function(Map<String, dynamic>, _i13.LatLng) onAddressFound;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, onAddressFound: $onAddressFound}';
  }
}

/// generated route for
/// [_i5.AuthorizationScreenWrapper]
class AuthorizationRoute extends _i10.PageRouteInfo<void> {
  const AuthorizationRoute({List<_i10.PageRouteInfo>? children})
      : super(AuthorizationRoute.name,
            path: '/authorization', initialChildren: children);

  static const String name = 'AuthorizationRoute';
}

/// generated route for
/// [_i6.OrganizationRegistrationScreen]
class RegistrationRoute extends _i10.PageRouteInfo<void> {
  const RegistrationRoute({List<_i10.PageRouteInfo>? children})
      : super(RegistrationRoute.name,
            path: 'registration', initialChildren: children);

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i7.OrganizationRegistrationForm1]
class RegistrationFirstStepRoute extends _i10.PageRouteInfo<void> {
  const RegistrationFirstStepRoute()
      : super(RegistrationFirstStepRoute.name, path: 'step1');

  static const String name = 'RegistrationFirstStepRoute';
}

/// generated route for
/// [_i8.OrganizationRegistrationForm2]
class RegistrationSecondStepRoute extends _i10.PageRouteInfo<void> {
  const RegistrationSecondStepRoute()
      : super(RegistrationSecondStepRoute.name, path: 'step2');

  static const String name = 'RegistrationSecondStepRoute';
}

/// generated route for
/// [_i9.ThankYou]
class ThankYouRoute extends _i10.PageRouteInfo<void> {
  const ThankYouRoute() : super(ThankYouRoute.name, path: 'thank-you');

  static const String name = 'ThankYouRoute';
}
