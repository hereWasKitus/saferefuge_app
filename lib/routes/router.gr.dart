// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'dart:async' as _i11;

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i12;
import 'package:map_repository/map_repository.dart' as _i10;

import '../app/app.dart' as _i1;
import '../home/home.dart' as _i4;
import '../login/login.dart' as _i3;
import '../map/map.dart' as _i5;
import '../profile/profile.dart' as _i7;
import '../profile/view/profile_view.dart' as _i6;
import '../registration/registration.dart' as _i2;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    Entrypoint.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    RegistrationRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.RegistrationView(),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.LoginView(),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    OrganizationListRoute.name: (routeData) {
      final args = routeData.argsAs<OrganizationListRouteArgs>();
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.OrganizationListView(
              key: args.key,
              pois: args.pois,
              currentPosition: args.currentPosition),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i2.MapView(key: args.key, onAddressFound: args.onAddressFound));
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.MapScreen(
              key: args.key, onPointSelected: args.onPointSelected));
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.ProfileView(),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileFormRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.ProfileForm(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileRequestsRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.Requests(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileBranchesRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.BranchesList(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    RegistrationFirstStepRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationView1());
    },
    RegistrationSecondStepRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationView2());
    },
    RegistrationThirdStepRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationView3());
    },
    RegistrationFourthStepRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationView4());
    },
    ThankYouRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ThankYouView());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(Entrypoint.name, path: '/', children: [
          _i8.RouteConfig(HomeRoute.name,
              path: 'home', parent: Entrypoint.name),
          _i8.RouteConfig(ProfileRoute.name,
              path: 'profile',
              parent: Entrypoint.name,
              children: [
                _i8.RouteConfig(ProfileFormRoute.name,
                    path: '', parent: ProfileRoute.name),
                _i8.RouteConfig(ProfileRequestsRoute.name,
                    path: 'requests', parent: ProfileRoute.name),
                _i8.RouteConfig(ProfileBranchesRoute.name,
                    path: 'branches', parent: ProfileRoute.name)
              ])
        ]),
        _i8.RouteConfig(RegistrationRoute.name,
            path: '/registration',
            children: [
              _i8.RouteConfig(RegistrationFirstStepRoute.name,
                  path: 'step1', parent: RegistrationRoute.name),
              _i8.RouteConfig(RegistrationSecondStepRoute.name,
                  path: 'step2', parent: RegistrationRoute.name),
              _i8.RouteConfig(RegistrationThirdStepRoute.name,
                  path: 'step3', parent: RegistrationRoute.name),
              _i8.RouteConfig(RegistrationFourthStepRoute.name,
                  path: 'step4', parent: RegistrationRoute.name),
              _i8.RouteConfig(ThankYouRoute.name,
                  path: 'thank-you', parent: RegistrationRoute.name)
            ]),
        _i8.RouteConfig(LoginRoute.name, path: '/login'),
        _i8.RouteConfig(OrganizationListRoute.name, path: '/organizations'),
        _i8.RouteConfig(MapScreenRoute.name, path: '/choosePoint'),
        _i8.RouteConfig(MapRoute.name, path: '/map')
      ];
}

/// generated route for
/// [_i1.Entrypoint]
class Entrypoint extends _i8.PageRouteInfo<void> {
  const Entrypoint({List<_i8.PageRouteInfo>? children})
      : super(Entrypoint.name, path: '/', initialChildren: children);

  static const String name = 'Entrypoint';
}

/// generated route for
/// [_i2.RegistrationView]
class RegistrationRoute extends _i8.PageRouteInfo<void> {
  const RegistrationRoute({List<_i8.PageRouteInfo>? children})
      : super(RegistrationRoute.name,
            path: '/registration', initialChildren: children);

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.OrganizationListView]
class OrganizationListRoute
    extends _i8.PageRouteInfo<OrganizationListRouteArgs> {
  OrganizationListRoute(
      {_i9.Key? key,
      required List<_i10.POI> pois,
      required _i11.Future<_i12.LatLng> currentPosition})
      : super(OrganizationListRoute.name,
            path: '/organizations',
            args: OrganizationListRouteArgs(
                key: key, pois: pois, currentPosition: currentPosition));

  static const String name = 'OrganizationListRoute';
}

class OrganizationListRouteArgs {
  const OrganizationListRouteArgs(
      {this.key, required this.pois, required this.currentPosition});

  final _i9.Key? key;

  final List<_i10.POI> pois;

  final _i11.Future<_i12.LatLng> currentPosition;

  @override
  String toString() {
    return 'OrganizationListRouteArgs{key: $key, pois: $pois, currentPosition: $currentPosition}';
  }
}

/// generated route for
/// [_i2.MapView]
class MapScreenRoute extends _i8.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute(
      {_i9.Key? key,
      required void Function(Map<String, dynamic>, _i12.LatLng) onAddressFound})
      : super(MapScreenRoute.name,
            path: '/choosePoint',
            args: MapScreenRouteArgs(key: key, onAddressFound: onAddressFound));

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({this.key, required this.onAddressFound});

  final _i9.Key? key;

  final void Function(Map<String, dynamic>, _i12.LatLng) onAddressFound;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, onAddressFound: $onAddressFound}';
  }
}

/// generated route for
/// [_i5.MapScreen]
class MapRoute extends _i8.PageRouteInfo<MapRouteArgs> {
  MapRoute(
      {_i9.Key? key,
      required void Function(Map<String, dynamic>, _i9.BuildContext)
          onPointSelected})
      : super(MapRoute.name,
            path: '/map',
            args: MapRouteArgs(key: key, onPointSelected: onPointSelected));

  static const String name = 'MapRoute';
}

class MapRouteArgs {
  const MapRouteArgs({this.key, required this.onPointSelected});

  final _i9.Key? key;

  final void Function(Map<String, dynamic>, _i9.BuildContext) onPointSelected;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, onPointSelected: $onPointSelected}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.ProfileView]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(ProfileRoute.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i7.ProfileForm]
class ProfileFormRoute extends _i8.PageRouteInfo<void> {
  const ProfileFormRoute() : super(ProfileFormRoute.name, path: '');

  static const String name = 'ProfileFormRoute';
}

/// generated route for
/// [_i7.Requests]
class ProfileRequestsRoute extends _i8.PageRouteInfo<void> {
  const ProfileRequestsRoute()
      : super(ProfileRequestsRoute.name, path: 'requests');

  static const String name = 'ProfileRequestsRoute';
}

/// generated route for
/// [_i7.BranchesList]
class ProfileBranchesRoute extends _i8.PageRouteInfo<void> {
  const ProfileBranchesRoute()
      : super(ProfileBranchesRoute.name, path: 'branches');

  static const String name = 'ProfileBranchesRoute';
}

/// generated route for
/// [_i2.RegistrationView1]
class RegistrationFirstStepRoute extends _i8.PageRouteInfo<void> {
  const RegistrationFirstStepRoute()
      : super(RegistrationFirstStepRoute.name, path: 'step1');

  static const String name = 'RegistrationFirstStepRoute';
}

/// generated route for
/// [_i2.RegistrationView2]
class RegistrationSecondStepRoute extends _i8.PageRouteInfo<void> {
  const RegistrationSecondStepRoute()
      : super(RegistrationSecondStepRoute.name, path: 'step2');

  static const String name = 'RegistrationSecondStepRoute';
}

/// generated route for
/// [_i2.RegistrationView3]
class RegistrationThirdStepRoute extends _i8.PageRouteInfo<void> {
  const RegistrationThirdStepRoute()
      : super(RegistrationThirdStepRoute.name, path: 'step3');

  static const String name = 'RegistrationThirdStepRoute';
}

/// generated route for
/// [_i2.RegistrationView4]
class RegistrationFourthStepRoute extends _i8.PageRouteInfo<void> {
  const RegistrationFourthStepRoute()
      : super(RegistrationFourthStepRoute.name, path: 'step4');

  static const String name = 'RegistrationFourthStepRoute';
}

/// generated route for
/// [_i2.ThankYouView]
class ThankYouRoute extends _i8.PageRouteInfo<void> {
  const ThankYouRoute() : super(ThankYouRoute.name, path: 'thank-you');

  static const String name = 'ThankYouRoute';
}
