// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'dart:async' as _i10;

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i11;
import 'package:map_repository/map_repository.dart' as _i7;

import '../app/app.dart' as _i1;
import '../home/home.dart' as _i4;
import '../login/login.dart' as _i3;
import '../map/map.dart' as _i5;
import '../profile/profile.dart' as _i6;
import '../registration/registration.dart' as _i2;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    EntrypointRoute.name: (routeData) {
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
    AddBranchRoute.name: (routeData) {
      final args = routeData.argsAs<AddBranchRouteArgs>(
          orElse: () => const AddBranchRouteArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.AddBranchView(
              key: args.key, initialBranchState: args.initialBranchState));
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    EmptyRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.EmptyRouterPage());
    },
    ProfileRouter.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.EmptyRouterPage(),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileView.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.ProfileView(),
          opaque: true,
          barrierDismissible: false);
    },
    ProfilePersonalInformationRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.ProfilePersonalInformationView(),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileSecurityRouter.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.EmptyRouterPage(),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileMenuRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.ProfileMenu(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileBranchesRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.BranchesList(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileSecurityView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ProfileSecurityView());
    },
    ProfileChangePasswordRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.ProfileChangePasswordView(),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileChangeEmailRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.ProfileChangeEmailView(),
          transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
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
        _i8.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i8.RouteConfig(EntrypointRoute.name, path: '/root', children: [
          _i8.RouteConfig(HomeRoute.name,
              path: 'home', parent: EntrypointRoute.name),
          _i8.RouteConfig(EmptyRoute.name,
              path: 'empty', parent: EntrypointRoute.name),
          _i8.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: EntrypointRoute.name,
              children: [
                _i8.RouteConfig(ProfileView.name,
                    path: '',
                    parent: ProfileRouter.name,
                    children: [
                      _i8.RouteConfig(ProfileMenuRoute.name,
                          path: 'menu', parent: ProfileView.name),
                      _i8.RouteConfig(ProfileBranchesRoute.name,
                          path: 'branches', parent: ProfileView.name)
                    ]),
                _i8.RouteConfig(ProfilePersonalInformationRoute.name,
                    path: 'personal-information', parent: ProfileRouter.name),
                _i8.RouteConfig(ProfileSecurityRouter.name,
                    path: 'security',
                    parent: ProfileRouter.name,
                    children: [
                      _i8.RouteConfig(ProfileSecurityView.name,
                          path: '', parent: ProfileSecurityRouter.name),
                      _i8.RouteConfig(ProfileChangePasswordRoute.name,
                          path: 'change-password',
                          parent: ProfileSecurityRouter.name),
                      _i8.RouteConfig(ProfileChangeEmailRoute.name,
                          path: 'change-email',
                          parent: ProfileSecurityRouter.name)
                    ])
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
        _i8.RouteConfig(MapRoute.name, path: '/map'),
        _i8.RouteConfig(AddBranchRoute.name, path: '/add-branch')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i8.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i1.Entrypoint]
class EntrypointRoute extends _i8.PageRouteInfo<void> {
  const EntrypointRoute({List<_i8.PageRouteInfo>? children})
      : super(EntrypointRoute.name, path: '/root', initialChildren: children);

  static const String name = 'EntrypointRoute';
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
      required _i10.Future<List<_i7.POI>> pois,
      required _i10.Future<_i11.LatLng> currentPosition})
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

  final _i10.Future<List<_i7.POI>> pois;

  final _i10.Future<_i11.LatLng> currentPosition;

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
      required void Function(Map<String, dynamic>, _i11.LatLng) onAddressFound})
      : super(MapScreenRoute.name,
            path: '/choosePoint',
            args: MapScreenRouteArgs(key: key, onAddressFound: onAddressFound));

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({this.key, required this.onAddressFound});

  final _i9.Key? key;

  final void Function(Map<String, dynamic>, _i11.LatLng) onAddressFound;

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
/// [_i6.AddBranchView]
class AddBranchRoute extends _i8.PageRouteInfo<AddBranchRouteArgs> {
  AddBranchRoute({_i9.Key? key, _i7.POI initialBranchState = const _i7.POI()})
      : super(AddBranchRoute.name,
            path: '/add-branch',
            args: AddBranchRouteArgs(
                key: key, initialBranchState: initialBranchState));

  static const String name = 'AddBranchRoute';
}

class AddBranchRouteArgs {
  const AddBranchRouteArgs(
      {this.key, this.initialBranchState = const _i7.POI()});

  final _i9.Key? key;

  final _i7.POI initialBranchState;

  @override
  String toString() {
    return 'AddBranchRouteArgs{key: $key, initialBranchState: $initialBranchState}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class EmptyRoute extends _i8.PageRouteInfo<void> {
  const EmptyRoute() : super(EmptyRoute.name, path: 'empty');

  static const String name = 'EmptyRoute';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class ProfileRouter extends _i8.PageRouteInfo<void> {
  const ProfileRouter({List<_i8.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i6.ProfileView]
class ProfileView extends _i8.PageRouteInfo<void> {
  const ProfileView({List<_i8.PageRouteInfo>? children})
      : super(ProfileView.name, path: '', initialChildren: children);

  static const String name = 'ProfileView';
}

/// generated route for
/// [_i6.ProfilePersonalInformationView]
class ProfilePersonalInformationRoute extends _i8.PageRouteInfo<void> {
  const ProfilePersonalInformationRoute()
      : super(ProfilePersonalInformationRoute.name,
            path: 'personal-information');

  static const String name = 'ProfilePersonalInformationRoute';
}

/// generated route for
/// [_i8.EmptyRouterPage]
class ProfileSecurityRouter extends _i8.PageRouteInfo<void> {
  const ProfileSecurityRouter({List<_i8.PageRouteInfo>? children})
      : super(ProfileSecurityRouter.name,
            path: 'security', initialChildren: children);

  static const String name = 'ProfileSecurityRouter';
}

/// generated route for
/// [_i6.ProfileMenu]
class ProfileMenuRoute extends _i8.PageRouteInfo<void> {
  const ProfileMenuRoute() : super(ProfileMenuRoute.name, path: 'menu');

  static const String name = 'ProfileMenuRoute';
}

/// generated route for
/// [_i6.BranchesList]
class ProfileBranchesRoute extends _i8.PageRouteInfo<void> {
  const ProfileBranchesRoute()
      : super(ProfileBranchesRoute.name, path: 'branches');

  static const String name = 'ProfileBranchesRoute';
}

/// generated route for
/// [_i6.ProfileSecurityView]
class ProfileSecurityView extends _i8.PageRouteInfo<void> {
  const ProfileSecurityView() : super(ProfileSecurityView.name, path: '');

  static const String name = 'ProfileSecurityView';
}

/// generated route for
/// [_i6.ProfileChangePasswordView]
class ProfileChangePasswordRoute extends _i8.PageRouteInfo<void> {
  const ProfileChangePasswordRoute()
      : super(ProfileChangePasswordRoute.name, path: 'change-password');

  static const String name = 'ProfileChangePasswordRoute';
}

/// generated route for
/// [_i6.ProfileChangeEmailView]
class ProfileChangeEmailRoute extends _i8.PageRouteInfo<void> {
  const ProfileChangeEmailRoute()
      : super(ProfileChangeEmailRoute.name, path: 'change-email');

  static const String name = 'ProfileChangeEmailRoute';
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
