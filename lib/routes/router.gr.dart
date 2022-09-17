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

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i12;
import 'package:map_repository/map_repository.dart' as _i8;

import '../features/app/app.dart' as _i1;
import '../features/home/home.dart' as _i5;
import '../features/login/login.dart' as _i3;
import '../features/map/map.dart' as _i6;
import '../features/password_reset/view/view.dart' as _i4;
import '../features/profile/profile.dart' as _i7;
import '../features/registration/registration.dart' as _i2;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    EntrypointRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Entrypoint());
    },
    RegistrationRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.RegistrationView(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.LoginView(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    PasswordResetRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.PasswordResetWrapperView(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    OrganizationListRoute.name: (routeData) {
      final args = routeData.argsAs<OrganizationListRouteArgs>();
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.OrganizationListView(key: args.key, pois: args.pois),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    MapScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MapScreenRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i2.MapView(key: args.key, onAddressFound: args.onAddressFound));
    },
    MapRoute.name: (routeData) {
      final args = routeData.argsAs<MapRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.MapScreen(
              key: args.key, onPointSelected: args.onPointSelected));
    },
    AddBranchRoute.name: (routeData) {
      final args = routeData.argsAs<AddBranchRouteArgs>(
          orElse: () => const AddBranchRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.AddBranchView(
              key: args.key, initialBranchState: args.initialBranchState));
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomeScreen());
    },
    EmptyRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EmptyRouterPage());
    },
    ProfileRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.EmptyRouterPage(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileView.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.ProfileView(),
          opaque: true,
          barrierDismissible: false);
    },
    ProfilePersonalInformationRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.ProfilePersonalInformationView(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileSecurityRouter.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i9.EmptyRouterPage(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileMenuRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.ProfileMenu(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileBranchesRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.BranchesList(),
          transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileSecurityView.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfileSecurityView());
    },
    ProfileChangePasswordRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.ProfileChangePasswordView(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileChangeEmailRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.ProfileChangeEmailView(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileDeleteRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.ProfileDeleteView(),
          transitionsBuilder: _i9.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 150,
          opaque: true,
          barrierDismissible: false);
    },
    RegistrationFirstStepRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationView1());
    },
    RegistrationSecondStepRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationView2());
    },
    RegistrationThirdStepRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationView3());
    },
    RegistrationFourthStepRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationView4());
    },
    ThankYouRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ThankYouView());
    },
    PasswordResetEmailFormRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PasswordResetEmailFormView());
    },
    PasswordResetCodeFormRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PasswordResetCodeFormView());
    },
    PasswordResetPasswordFormRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i4.PasswordResetPasswordFormView());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i9.RouteConfig(EntrypointRoute.name, path: '/root', children: [
          _i9.RouteConfig(HomeRoute.name,
              path: 'home', parent: EntrypointRoute.name),
          _i9.RouteConfig(EmptyRoute.name,
              path: 'empty', parent: EntrypointRoute.name),
          _i9.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: EntrypointRoute.name,
              children: [
                _i9.RouteConfig(ProfileView.name,
                    path: '',
                    parent: ProfileRouter.name,
                    children: [
                      _i9.RouteConfig(ProfileMenuRoute.name,
                          path: 'menu', parent: ProfileView.name),
                      _i9.RouteConfig(ProfileBranchesRoute.name,
                          path: 'branches', parent: ProfileView.name)
                    ]),
                _i9.RouteConfig(ProfilePersonalInformationRoute.name,
                    path: 'personal-information', parent: ProfileRouter.name),
                _i9.RouteConfig(ProfileSecurityRouter.name,
                    path: 'security',
                    parent: ProfileRouter.name,
                    children: [
                      _i9.RouteConfig(ProfileSecurityView.name,
                          path: '', parent: ProfileSecurityRouter.name),
                      _i9.RouteConfig(ProfileChangePasswordRoute.name,
                          path: 'change-password',
                          parent: ProfileSecurityRouter.name),
                      _i9.RouteConfig(ProfileChangeEmailRoute.name,
                          path: 'change-email',
                          parent: ProfileSecurityRouter.name),
                      _i9.RouteConfig(ProfileDeleteRoute.name,
                          path: 'delete', parent: ProfileSecurityRouter.name)
                    ])
              ])
        ]),
        _i9.RouteConfig(RegistrationRoute.name,
            path: '/registration',
            children: [
              _i9.RouteConfig(RegistrationFirstStepRoute.name,
                  path: 'step1', parent: RegistrationRoute.name),
              _i9.RouteConfig(RegistrationSecondStepRoute.name,
                  path: 'step2', parent: RegistrationRoute.name),
              _i9.RouteConfig(RegistrationThirdStepRoute.name,
                  path: 'step3', parent: RegistrationRoute.name),
              _i9.RouteConfig(RegistrationFourthStepRoute.name,
                  path: 'step4', parent: RegistrationRoute.name),
              _i9.RouteConfig(ThankYouRoute.name,
                  path: 'thank-you', parent: RegistrationRoute.name)
            ]),
        _i9.RouteConfig(LoginRoute.name, path: '/login'),
        _i9.RouteConfig(PasswordResetRouter.name,
            path: '/password-reset',
            children: [
              _i9.RouteConfig(PasswordResetEmailFormRoute.name,
                  path: '', parent: PasswordResetRouter.name),
              _i9.RouteConfig(PasswordResetCodeFormRoute.name,
                  path: 'code-form', parent: PasswordResetRouter.name),
              _i9.RouteConfig(PasswordResetPasswordFormRoute.name,
                  path: 'password-form', parent: PasswordResetRouter.name)
            ]),
        _i9.RouteConfig(OrganizationListRoute.name, path: '/organizations'),
        _i9.RouteConfig(MapScreenRoute.name, path: '/choosePoint'),
        _i9.RouteConfig(MapRoute.name, path: '/map'),
        _i9.RouteConfig(AddBranchRoute.name, path: '/add-branch')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i9.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i1.Entrypoint]
class EntrypointRoute extends _i9.PageRouteInfo<void> {
  const EntrypointRoute({List<_i9.PageRouteInfo>? children})
      : super(EntrypointRoute.name, path: '/root', initialChildren: children);

  static const String name = 'EntrypointRoute';
}

/// generated route for
/// [_i2.RegistrationView]
class RegistrationRoute extends _i9.PageRouteInfo<void> {
  const RegistrationRoute({List<_i9.PageRouteInfo>? children})
      : super(RegistrationRoute.name,
            path: '/registration', initialChildren: children);

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.PasswordResetWrapperView]
class PasswordResetRouter extends _i9.PageRouteInfo<void> {
  const PasswordResetRouter({List<_i9.PageRouteInfo>? children})
      : super(PasswordResetRouter.name,
            path: '/password-reset', initialChildren: children);

  static const String name = 'PasswordResetRouter';
}

/// generated route for
/// [_i5.OrganizationListView]
class OrganizationListRoute
    extends _i9.PageRouteInfo<OrganizationListRouteArgs> {
  OrganizationListRoute(
      {_i10.Key? key, required _i11.Future<List<_i8.POI>> pois})
      : super(OrganizationListRoute.name,
            path: '/organizations',
            args: OrganizationListRouteArgs(key: key, pois: pois));

  static const String name = 'OrganizationListRoute';
}

class OrganizationListRouteArgs {
  const OrganizationListRouteArgs({this.key, required this.pois});

  final _i10.Key? key;

  final _i11.Future<List<_i8.POI>> pois;

  @override
  String toString() {
    return 'OrganizationListRouteArgs{key: $key, pois: $pois}';
  }
}

/// generated route for
/// [_i2.MapView]
class MapScreenRoute extends _i9.PageRouteInfo<MapScreenRouteArgs> {
  MapScreenRoute(
      {_i10.Key? key,
      required void Function(Map<String, dynamic>, _i12.LatLng) onAddressFound})
      : super(MapScreenRoute.name,
            path: '/choosePoint',
            args: MapScreenRouteArgs(key: key, onAddressFound: onAddressFound));

  static const String name = 'MapScreenRoute';
}

class MapScreenRouteArgs {
  const MapScreenRouteArgs({this.key, required this.onAddressFound});

  final _i10.Key? key;

  final void Function(Map<String, dynamic>, _i12.LatLng) onAddressFound;

  @override
  String toString() {
    return 'MapScreenRouteArgs{key: $key, onAddressFound: $onAddressFound}';
  }
}

/// generated route for
/// [_i6.MapScreen]
class MapRoute extends _i9.PageRouteInfo<MapRouteArgs> {
  MapRoute(
      {_i10.Key? key,
      required void Function(Map<String, dynamic>, _i10.BuildContext)
          onPointSelected})
      : super(MapRoute.name,
            path: '/map',
            args: MapRouteArgs(key: key, onPointSelected: onPointSelected));

  static const String name = 'MapRoute';
}

class MapRouteArgs {
  const MapRouteArgs({this.key, required this.onPointSelected});

  final _i10.Key? key;

  final void Function(Map<String, dynamic>, _i10.BuildContext) onPointSelected;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key, onPointSelected: $onPointSelected}';
  }
}

/// generated route for
/// [_i7.AddBranchView]
class AddBranchRoute extends _i9.PageRouteInfo<AddBranchRouteArgs> {
  AddBranchRoute({_i10.Key? key, _i8.POI initialBranchState = const _i8.POI()})
      : super(AddBranchRoute.name,
            path: '/add-branch',
            args: AddBranchRouteArgs(
                key: key, initialBranchState: initialBranchState));

  static const String name = 'AddBranchRoute';
}

class AddBranchRouteArgs {
  const AddBranchRouteArgs(
      {this.key, this.initialBranchState = const _i8.POI()});

  final _i10.Key? key;

  final _i8.POI initialBranchState;

  @override
  String toString() {
    return 'AddBranchRouteArgs{key: $key, initialBranchState: $initialBranchState}';
  }
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class EmptyRoute extends _i9.PageRouteInfo<void> {
  const EmptyRoute() : super(EmptyRoute.name, path: 'empty');

  static const String name = 'EmptyRoute';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class ProfileRouter extends _i9.PageRouteInfo<void> {
  const ProfileRouter({List<_i9.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i7.ProfileView]
class ProfileView extends _i9.PageRouteInfo<void> {
  const ProfileView({List<_i9.PageRouteInfo>? children})
      : super(ProfileView.name, path: '', initialChildren: children);

  static const String name = 'ProfileView';
}

/// generated route for
/// [_i7.ProfilePersonalInformationView]
class ProfilePersonalInformationRoute extends _i9.PageRouteInfo<void> {
  const ProfilePersonalInformationRoute()
      : super(ProfilePersonalInformationRoute.name,
            path: 'personal-information');

  static const String name = 'ProfilePersonalInformationRoute';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class ProfileSecurityRouter extends _i9.PageRouteInfo<void> {
  const ProfileSecurityRouter({List<_i9.PageRouteInfo>? children})
      : super(ProfileSecurityRouter.name,
            path: 'security', initialChildren: children);

  static const String name = 'ProfileSecurityRouter';
}

/// generated route for
/// [_i7.ProfileMenu]
class ProfileMenuRoute extends _i9.PageRouteInfo<void> {
  const ProfileMenuRoute() : super(ProfileMenuRoute.name, path: 'menu');

  static const String name = 'ProfileMenuRoute';
}

/// generated route for
/// [_i7.BranchesList]
class ProfileBranchesRoute extends _i9.PageRouteInfo<void> {
  const ProfileBranchesRoute()
      : super(ProfileBranchesRoute.name, path: 'branches');

  static const String name = 'ProfileBranchesRoute';
}

/// generated route for
/// [_i7.ProfileSecurityView]
class ProfileSecurityView extends _i9.PageRouteInfo<void> {
  const ProfileSecurityView() : super(ProfileSecurityView.name, path: '');

  static const String name = 'ProfileSecurityView';
}

/// generated route for
/// [_i7.ProfileChangePasswordView]
class ProfileChangePasswordRoute extends _i9.PageRouteInfo<void> {
  const ProfileChangePasswordRoute()
      : super(ProfileChangePasswordRoute.name, path: 'change-password');

  static const String name = 'ProfileChangePasswordRoute';
}

/// generated route for
/// [_i7.ProfileChangeEmailView]
class ProfileChangeEmailRoute extends _i9.PageRouteInfo<void> {
  const ProfileChangeEmailRoute()
      : super(ProfileChangeEmailRoute.name, path: 'change-email');

  static const String name = 'ProfileChangeEmailRoute';
}

/// generated route for
/// [_i7.ProfileDeleteView]
class ProfileDeleteRoute extends _i9.PageRouteInfo<void> {
  const ProfileDeleteRoute() : super(ProfileDeleteRoute.name, path: 'delete');

  static const String name = 'ProfileDeleteRoute';
}

/// generated route for
/// [_i2.RegistrationView1]
class RegistrationFirstStepRoute extends _i9.PageRouteInfo<void> {
  const RegistrationFirstStepRoute()
      : super(RegistrationFirstStepRoute.name, path: 'step1');

  static const String name = 'RegistrationFirstStepRoute';
}

/// generated route for
/// [_i2.RegistrationView2]
class RegistrationSecondStepRoute extends _i9.PageRouteInfo<void> {
  const RegistrationSecondStepRoute()
      : super(RegistrationSecondStepRoute.name, path: 'step2');

  static const String name = 'RegistrationSecondStepRoute';
}

/// generated route for
/// [_i2.RegistrationView3]
class RegistrationThirdStepRoute extends _i9.PageRouteInfo<void> {
  const RegistrationThirdStepRoute()
      : super(RegistrationThirdStepRoute.name, path: 'step3');

  static const String name = 'RegistrationThirdStepRoute';
}

/// generated route for
/// [_i2.RegistrationView4]
class RegistrationFourthStepRoute extends _i9.PageRouteInfo<void> {
  const RegistrationFourthStepRoute()
      : super(RegistrationFourthStepRoute.name, path: 'step4');

  static const String name = 'RegistrationFourthStepRoute';
}

/// generated route for
/// [_i2.ThankYouView]
class ThankYouRoute extends _i9.PageRouteInfo<void> {
  const ThankYouRoute() : super(ThankYouRoute.name, path: 'thank-you');

  static const String name = 'ThankYouRoute';
}

/// generated route for
/// [_i4.PasswordResetEmailFormView]
class PasswordResetEmailFormRoute extends _i9.PageRouteInfo<void> {
  const PasswordResetEmailFormRoute()
      : super(PasswordResetEmailFormRoute.name, path: '');

  static const String name = 'PasswordResetEmailFormRoute';
}

/// generated route for
/// [_i4.PasswordResetCodeFormView]
class PasswordResetCodeFormRoute extends _i9.PageRouteInfo<void> {
  const PasswordResetCodeFormRoute()
      : super(PasswordResetCodeFormRoute.name, path: 'code-form');

  static const String name = 'PasswordResetCodeFormRoute';
}

/// generated route for
/// [_i4.PasswordResetPasswordFormView]
class PasswordResetPasswordFormRoute extends _i9.PageRouteInfo<void> {
  const PasswordResetPasswordFormRoute()
      : super(PasswordResetPasswordFormRoute.name, path: 'password-form');

  static const String name = 'PasswordResetPasswordFormRoute';
}
