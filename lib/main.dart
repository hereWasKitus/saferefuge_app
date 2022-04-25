import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/bloc/map/map_bloc.dart';
import 'package:protect_ua_women/bloc/registration_form/registrationform_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapBloc()
            ..add(LoadPOIsEvent())
            ..add(LoadCategoriesEvent()),
        ),
        BlocProvider(
          create: (context) => RegistrationFormBloc(),
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
