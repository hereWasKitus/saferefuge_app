import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/config/secrets.dart';
import 'package:protect_ua_women/profile/profile.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

import 'login/login.dart';
import 'registration/registration.dart';
import 'home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final _authRepository = AuthRepository();
  final _mapRepository = MapRepository(apiKey: googleMapAPIkey);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(mapRepository: _mapRepository)
            ..add(LoadPOIsEvent())
            ..add(LoadCategoriesEvent()),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(authRepository: _authRepository),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(authRepository: _authRepository)..add(const ProfileTryGetUser()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(authRepository: _authRepository),
        )
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        title: 'Safeway',
        theme: ThemeData(
          fontFamily: "Rubik",
          primarySwatch: Colors.blue,
          primaryColor: primaryColor,
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
