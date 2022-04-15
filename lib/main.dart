import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:protect_ua_women/redux/app_state.dart';
import 'package:protect_ua_women/routes/router.gr.dart';
import 'package:protect_ua_women/services/map.service.dart';
import 'package:redux/redux.dart';
import 'package:protect_ua_women/redux/store.dart';

void main() {
  runApp(MyApp(store: appStore));

  MapService().initializePOI().then((value) {
    Timer(const Duration(seconds: 1),
        () => appStore.dispatch(SetInitializedAction(true)));
  });
  MapService().initializeCategories();
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final _appRouter = AppRouter();

  MyApp({Key? key, required this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
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
