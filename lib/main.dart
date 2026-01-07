import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:sunly/cubits/favorites/favorites_cubit.dart';
import 'package:sunly/cubits/temperature_unit/temperature_unit_cubit.dart';
import 'package:sunly/cubits/theme/theme_cubit.dart';
import 'constants.dart';
import 'core/services/cache_helper.dart';
import 'core/services/get_it.dart';
import 'core/services/weather_service.dart';
import 'core/utils/app_router.dart';
import 'core/utils/observer.dart';
import 'core/utils/themes.dart';
import 'cubits/get_weather/get_weather_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  // Load the .env file
  await dotenv.load(fileName: ".env");
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => TemperatureUnitCubit()),
        BlocProvider(
          create: (context) =>
              GetWeatherCubit(weatherService: getIt<WeatherService>()),
        ),BlocProvider(
          create: (context) => FavoritesCubit()..loadFavorites(),
        ),
      ],
      child: const Sunly(),
    ),
  );
}

class Sunly extends StatelessWidget {
  const Sunly({super.key});

  @override
  Widget build(BuildContext context) {
    GoTransition.defaultCurve = Curves.easeInOut;
    GoTransition.defaultDuration = kTransitionDuration;
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: state.themeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
