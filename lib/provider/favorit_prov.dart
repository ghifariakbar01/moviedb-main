import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/model/mod_favorit.dart';

final favoritProvider =
    StateNotifierProvider<FavoritStateNotifier, List<Favorit>>((ref) {
  return FavoritStateNotifier([]);
});

class FavoritStateNotifier extends StateNotifier<List<Favorit>> {
  FavoritStateNotifier(List<Favorit> state) : super(state);

  get favorit => state;

  void addFavorit(Favorit value) {
    state = [value, ...state];
  }

  void removeFavorit(Favorit value) {
    state = [...state.where((element) => element.title != value.title)];
  }
}
