import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState(favoriteCities: []));

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteCities = prefs.getStringList('favoriteCities') ?? [];
    emit(FavoritesState(favoriteCities: favoriteCities));
  }

  Future<void> addFavorite(String cityName) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteCities = List<String>.from(state.favoriteCities);
    if (!favoriteCities.contains(cityName)) {
      if (favoriteCities.length >= 5) {
        favoriteCities.removeAt(0);
      }
      favoriteCities.add(cityName);
      await prefs.setStringList('favoriteCities', favoriteCities);
      emit(FavoritesState(favoriteCities: favoriteCities));
    }
  }

  Future<void> removeFavorite(String cityName) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteCities = List<String>.from(state.favoriteCities);
    if (favoriteCities.contains(cityName)) {
      favoriteCities.remove(cityName);
      await prefs.setStringList('favoriteCities', favoriteCities);
      emit(FavoritesState(favoriteCities: favoriteCities));
    }
  }
}
