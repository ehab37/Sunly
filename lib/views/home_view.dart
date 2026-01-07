import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sunly/constants.dart';
import 'package:sunly/core/services/cache_helper.dart';
import 'package:sunly/core/utils/info_box.dart';
import 'package:sunly/cubits/get_weather/get_weather_cubit.dart';
import 'package:sunly/cubits/temperature_unit/temperature_unit_cubit.dart';
import 'package:sunly/cubits/theme/theme_cubit.dart';
import 'package:sunly/views/widgets/home_view_body.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunly'),
        actions: [
          BlocBuilder<TemperatureUnitCubit, TemperatureUnitState>(
            builder: (context, state) {
              return Row(
                children: [
                  const Text('C'),
                  Switch(
                    value: state.temperatureUnit == TemperatureUnit.fahrenheit,
                    onChanged: (value) {
                      context.read<TemperatureUnitCubit>().toggleUnit();
                    },
                  ),
                  const Text('F'),
                ],
              );
            },
          ),
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
          SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<GetWeatherCubit, GetWeatherState>(
          listener: (context, state) {
            if (state is GetWeatherFailure) {
              InfoBox.customSnackBar(context, state.errorMessage);
            }else if (state is GetWeatherSuccess){
              CacheHelper.saveData(
                key: kCityNameCached,
                value: state.weather.cityName,
              );
            }
          },
          builder: (context, state) {
            if (state is GetWeatherSuccess) {
              return HomeViewBody(weather: state.weather);
            } else {
              return ModalProgressHUD(
                inAsyncCall: state is GetWeatherLoading ? true : false,
                child: const SearchView(),
              );
            }
          },
        ),
      ),
    );
  }
}
