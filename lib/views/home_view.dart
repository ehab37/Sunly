import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunly/core/services/get_it.dart';
import 'package:sunly/core/services/weather_service.dart';
import 'package:sunly/cubits/get_weather/get_weather_cubit.dart';
import 'package:sunly/views/widgets/home_view_body.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetWeatherCubit(weatherService: getIt<WeatherService>()),
      child: Scaffold(body: SafeArea(child: Builder(
          builder: (context) {
            return BlocBuilder<GetWeatherCubit, GetWeatherState>(
              builder: (context, state) {
                if (state is GetWeatherSuccess) {
                  return HomeViewBody(weather: state.weather,);
                }else {
                  return SearchView();
                }
              },
            );
          }
      ))),
    );
  }
}
