// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i9;

import '../app/app.dart' as _i1;
import '../auth/login/login.dart' as _i4;
import '../auth/registration/registration.dart' as _i3;
import '../home/home.dart' as _i2;
import '../profile/profile.dart' as _i6;
import '../profile/view/profile_view.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    Entrypoint.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    HomeScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    SplashScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    OrganizationListRoute.name: (routeData) {
      final args = routeData.argsAs<OrganizationListRouteArgs>();
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.OrganizationListView(
              key: args.key,
              pois: args.pois,
              currentPosition: args.currentPosition),
          transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i3.MapView(key: args.key, onAddressFound: args.onAddressFound));
    },
    LoginRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.LoginView(),
          transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    RegistrationRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.RegistrationView(),
          transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.ProfileView(),
          transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    RegistrationFirstStepRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegistrationView1());
    },
    RegistrationSecondStepRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegistrationView2());
    },
    RegistrationThirdStepRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegistrationView3());
    },
    ThankYouRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ThankYouView());
    },
    ProfileFormRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.ProfileForm(),
          transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileRequestsRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.Requests(),
          transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileBranchesRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.BranchesList(),
          transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(Entrypoint.name, path: '/', fullMatch: true),
        _i7.RouteConfig(HomeScreenRoute.name, path: '/home'),
        _i7.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i7.RouteConfig(OrganizationListRoute.name, path: '/organizations'),
        _i7.RouteConfig(MapScreenRoute.name, path: '/choosePoint'),
        _i7.RouteConfig(LoginRoute.name, path: '/login'),
        _i7.RouteConfig(RegistrationRoute.name,
            path: '/registration',
            children: [
              _i7.RouteConfig(RegistrationFirstStepRoute.name,
                  path: 'step1', parent: RegistrationRoute.name),
              _i7.RouteConfig(RegistrationSecondStepRoute.name,
                  path: 'step2', parent: RegistrationRoute.name),
              _i7.RouteConfig(RegistrationThirdStepRoute.name,
                  path: 'step3', parent: RegistrationRoute.name),
              _i7.RouteConfig(ThankYouRoute.name,
                  path: 'thank-you', parent: RegistrationRoute.name)
            ]),
        _i7.RouteConfig(ProfileRoute.name, path: '/profile', children: [
          _i7.RouteConfig(ProfileFormRoute.name,
              path: '', parent: ProfileRoute.name),
          _i7.RouteConfig(ProfileRequestsRoute.name,
              path: 'requests', parent: ProfileRoute.name),
          _i7.RouteConfig(ProfileBranchesRoute.name,
              path: 'branches', parent: ProfileRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.Entrypoint]
class Entrypoint extends _i7.PageRouteInfo<void> {
  const Entrypoint() : super(Entrypoint.name, path: '/');

  static const String name = 'Entrypoint';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/home');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.OrganizationListView]
class OrganizationListRoute
    extends _i7.PageRouteInfo<OrganizationListRouteArgs> {
  OrganizationListRoute(
      {_i8.Key? key,
      required List<_i2.POI> pois,
      required _i9.LatLng currentPosition})
      : super(OrganizationListRoute.name,
            path: '/organizations',
            args: OrganizationListRouteArgs(
                key: key, pois: pois, currentPosition: currentPosition));

  static const String name = 'OrganizationListRoute';
}

class OrganizationListRouteArgs {
  const OrganizationListRouteArgs(
      {this.key, required this.pois, required this.currentPosition});

  final _i8.Key? key;

  final List<_i2.POI> pois;

  final _i9.LatLng currentPosition;

  @override
  String toString() {
    return 'OrganizationListRouteArgs{key: $key, pois: $pois, currentPosition: $currentPosition}';
  }
}

/// generated route for
/// [_i3.MapView]
class MapScreenRoute extends _i7.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute(
      {_i8.Key? key,
      required void Function(Map<String, dynamic>, _i9.LatLng) onAddressFound})
      : super(MapScreenRoute.name,
            path: '/choosePoint',
            args: MapScreenRouteArgs(key: key, onAddressFound: onAddressFound));

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({this.key, required this.onAddressFound});

  final _i8.Key? key;

  final void Function(Map<String, dynamic>, _i9.LatLng) onAddressFound;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, onAddressFound: $onAddressFound}';
  }
}

/// generated route for
/// [_i4.LoginView]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegistrationView]
class RegistrationRoute extends _i7.PageRouteInfo<void> {
  const RegistrationRoute({List<_i7.PageRouteInfo>? children})
      : super(RegistrationRoute.name,
            path: '/registration', initialChildren: children);

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i5.ProfileView]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(ProfileRoute.name, path: '/profile', initialChildren: children);

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.RegistrationView1]
class RegistrationFirstStepRoute extends _i7.PageRouteInfo<void> {
  const RegistrationFirstStepRoute()
      : super(RegistrationFirstStepRoute.name, path: 'step1');

  static const String name = 'RegistrationFirstStepRoute';
}

/// generated route for
/// [_i3.RegistrationView2]
class RegistrationSecondStepRoute extends _i7.PageRouteInfo<void> {
  const RegistrationSecondStepRoute()
      : super(RegistrationSecondStepRoute.name, path: 'step2');

  static const String name = 'RegistrationSecondStepRoute';
}

/// generated route for
/// [_i3.RegistrationView3]
class RegistrationThirdStepRoute extends _i7.PageRouteInfo<void> {
  const RegistrationThirdStepRoute()
      : super(RegistrationThirdStepRoute.name, path: 'step3');

  static const String name = 'RegistrationThirdStepRoute';
}

/// generated route for
/// [_i3.ThankYouView]
class ThankYouRoute extends _i7.PageRouteInfo<void> {
  const ThankYouRoute() : super(ThankYouRoute.name, path: 'thank-you');

  static const String name = 'ThankYouRoute';
}

/// generated route for
/// [_i6.ProfileForm]
class ProfileFormRoute extends _i7.PageRouteInfo<void> {
  const ProfileFormRoute() : super(ProfileFormRoute.name, path: '');

  static const String name = 'ProfileFormRoute';
}

/// generated route for
/// [_i6.Requests]
class ProfileRequestsRoute extends _i7.PageRouteInfo<void> {
  const ProfileRequestsRoute()
      : super(ProfileRequestsRoute.name, path: 'requests');

  static const String name = 'ProfileRequestsRoute';
}

/// generated route for
/// [_i6.BranchesList]
class ProfileBranchesRoute extends _i7.PageRouteInfo<void> {
  const ProfileBranchesRoute()
      : super(ProfileBranchesRoute.name, path: 'branches');

  static const String name = 'ProfileBranchesRoute';
}
