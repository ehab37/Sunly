import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunly/constants.dart';
import 'package:sunly/cubits/get_weather/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Search for a city to get the weather forecast',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          BlocListener<GetWeatherCubit, GetWeatherState>(
            listener: (context, state) {
              if (state is GetWeatherFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<GetWeatherCubit>().getCurrentWeather(
                        cityName: value,
                      );
                }
              },
              decoration: InputDecoration(
                hintText: 'Enter city name',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
