import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sunly/cubits/favorites/favorites_cubit.dart';
import 'package:sunly/cubits/get_weather/get_weather_cubit.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Cities'),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.favoriteCities.isEmpty) {
            return const Center(
              child: Text('You have no favorite cities yet.'),
            );
          }
          return ListView.builder(
            itemCount: state.favoriteCities.length,
            itemBuilder: (context, index) {
              final city = state.favoriteCities[index];
              return ListTile(
                title: Text(city),
                onTap: () {
                  context.read<GetWeatherCubit>().getCurrentWeather(
                        cityName: city,
                      );
                  GoRouter.of(context).pop();
                },
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<FavoritesCubit>().removeFavorite(city);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
