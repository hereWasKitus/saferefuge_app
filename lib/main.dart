import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:map_repository/map_repository.dart';
import 'package:profile_repository/profile_repository.dart';
import 'package:protect_ua_women/core/theme/theme.dart';
import 'package:protect_ua_women/routes/router.gr.dart';
import 'package:safeway_api/safeway_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final _api = SafeWayAPI(prefs: await SharedPreferences.getInstance());

  runApp(
    MyApp(
      authRepository: AuthRepository(api: _api),
      mapRepository: MapRepository(
          api: _api, googleApiKey: dotenv.env['GOOGLE_MAP_API_KEY'] as String),
      profileRepository: ProfileRepository(api: _api),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  final AuthRepository _authRepository;
  final MapRepository _mapRepository;

  MyApp({
    Key? key,
    required AuthRepository authRepository,
    required MapRepository mapRepository,
    required ProfileRepository profileRepository,
  })  : _authRepository = authRepository,
        _mapRepository = mapRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => _authRepository,
        ),
        RepositoryProvider<MapRepository>(
          create: (context) => _mapRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeBloc(mapRepository: context.read<MapRepository>())
                  ..add(const LoadPOIsEvent())
                  ..add(const LoadCategoriesEvent()),
          ),
        ],
        child: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          title: 'Safeway',
          theme: ThemeData(
            fontFamily: "Rubik",
            primarySwatch: Colors.blue,
            primaryColor: AppColors.primary,
            textTheme: const TextTheme(
              bodyText1: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
