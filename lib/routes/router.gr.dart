// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i11;

import '../entrypoint.dart' as _i1;
import '../models/poi.model.dart' as _i10;
import '../screens/authorization/authorization_wrapper.dart' as _i4;
import '../screens/authorization/components/organization_registration_form_1.dart'
    as _i6;
import '../screens/authorization/components/organization_registration_form_2.dart'
    as _i7;
import '../screens/authorization/registration_screen.dart' as _i5;
import '../screens/home/home_screen.dart' as _i2;
import '../screens/organization_list_screen/organization_list_screen.dart'
    as _i3;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    Entrypoint.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    MapSample.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    OrganizationListScreen.name: (routeData) {
      final args = routeData.argsAs<OrganizationListScreenArgs>();
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.OrganizationListScreen(
              key: args.key,
              pois: args.pois,
              currentPosition: args.currentPosition),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    AuthorizationRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AuthorizationScreenWrapper());
    },
    RegistrationRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i5.OrganizationRegistrationScreen());
    },
    RegistrationFirstStepRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i6.OrganizationRegistrationForm1());
    },
    RegistrationFirstSecondRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i7.OrganizationRegistrationForm2());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(Entrypoint.name, path: '/', fullMatch: true),
        _i8.RouteConfig(MapSample.name, path: '/home'),
        _i8.RouteConfig(OrganizationListScreen.name, path: '/organizations'),
        _i8.RouteConfig(AuthorizationRoute.name,
            path: '/authorization',
            children: [
              _i8.RouteConfig('#redirect',
                  path: '',
                  parent: AuthorizationRoute.name,
                  redirectTo: 'registration',
                  fullMatch: true),
              _i8.RouteConfig(RegistrationRoute.name,
                  path: 'registration',
                  parent: AuthorizationRoute.name,
                  children: [
                    _i8.RouteConfig('#redirect',
                        path: '',
                        parent: RegistrationRoute.name,
                        redirectTo: 'step1',
                        fullMatch: true),
                    _i8.RouteConfig(RegistrationFirstStepRoute.name,
                        path: 'step1', parent: RegistrationRoute.name),
                    _i8.RouteConfig(RegistrationFirstSecondRoute.name,
                        path: 'step2', parent: RegistrationRoute.name)
                  ])
            ])
      ];
}

/// generated route for
/// [_i1.Entrypoint]
class Entrypoint extends _i8.PageRouteInfo<void> {
  const Entrypoint() : super(Entrypoint.name, path: '/');

  static const String name = 'Entrypoint';
}

/// generated route for
/// [_i2.HomeScreen]
class MapSample extends _i8.PageRouteInfo<void> {
  const MapSample() : super(MapSample.name, path: '/home');

  static const String name = 'MapSample';
}

/// generated route for
/// [_i3.OrganizationListScreen]
class OrganizationListScreen
    extends _i8.PageRouteInfo<OrganizationListScreenArgs> {
  OrganizationListScreen(
      {_i9.Key? key,
      required List<_i10.POI> pois,
      required _i11.LatLng currentPosition})
      : super(OrganizationListScreen.name,
            path: '/organizations',
            args: OrganizationListScreenArgs(
                key: key, pois: pois, currentPosition: currentPosition));

  static const String name = 'OrganizationListScreen';
}

class OrganizationListScreenArgs {
  const OrganizationListScreenArgs(
      {this.key, required this.pois, required this.currentPosition});

  final _i9.Key? key;

  final List<_i10.POI> pois;

  final _i11.LatLng currentPosition;

  @override
  String toString() {
    return 'OrganizationListScreenArgs{key: $key, pois: $pois, currentPosition: $currentPosition}';
  }
}

/// generated route for
/// [_i4.AuthorizationScreenWrapper]
class AuthorizationRoute extends _i8.PageRouteInfo<void> {
  const AuthorizationRoute({List<_i8.PageRouteInfo>? children})
      : super(AuthorizationRoute.name,
            path: '/authorization', initialChildren: children);

  static const String name = 'AuthorizationRoute';
}

/// generated route for
/// [_i5.OrganizationRegistrationScreen]
class RegistrationRoute extends _i8.PageRouteInfo<void> {
  const RegistrationRoute({List<_i8.PageRouteInfo>? children})
      : super(RegistrationRoute.name,
            path: 'registration', initialChildren: children);

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i6.OrganizationRegistrationForm1]
class RegistrationFirstStepRoute extends _i8.PageRouteInfo<void> {
  const RegistrationFirstStepRoute()
      : super(RegistrationFirstStepRoute.name, path: 'step1');

  static const String name = 'RegistrationFirstStepRoute';
}

/// generated route for
/// [_i7.OrganizationRegistrationForm2]
class RegistrationFirstSecondRoute extends _i8.PageRouteInfo<void> {
  const RegistrationFirstSecondRoute()
      : super(RegistrationFirstSecondRoute.name, path: 'step2');

  static const String name = 'RegistrationFirstSecondRoute';
}
