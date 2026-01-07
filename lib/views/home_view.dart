import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunly/core/services/get_it.dart';
import 'package:sunly/core/services/weather_service.dart';
import 'package:sunly/cubits/get_weather/get_weather_cubit.dart';
import 'package:sunly/cubits/theme/theme_cubit.dart';
import 'package:sunly/views/widgets/home_view_body.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetWeatherCubit(weatherService: getIt<WeatherService>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sunly'),
          actions: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  icon: Icon(
                    state.themeMode == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
            builder: (context, state) {
              if (state is GetWeatherSuccess) {
                return HomeViewBody(weather: state.weather);
              } else {
                return const SearchView();
              }
            },
          ),
        ),
      ),
    );
  }
}
