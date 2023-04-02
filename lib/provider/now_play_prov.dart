import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/model/mod_nowplay.dart';

final nowPlayUrlProvider =
    StateNotifierProvider<NowPlayUrlProvider, List<NowPlayMod>>(
        (ref) => NowPlayUrlProvider());

final tVnowPlayUrlProvider =
    StateNotifierProvider<NowPlayUrlProvider, List<NowPlayMod>>(
        (ref) => NowPlayUrlProvider());

class NowPlayUrlProvider extends StateNotifier<List<NowPlayMod>> {
  NowPlayUrlProvider() : super([]);

  get getUrl => state;

  void setList(List<NowPlayMod> url) {
    state = [...state, ...url];
  }

  void removeList(NowPlayMod url) {
    state = state.where((element) => element != url).toList();
  }
}

class TVNowPlayUrlProvider extends StateNotifier<List<NowPlayMod>> {
  TVNowPlayUrlProvider() : super([]);

  get getUrl => state;

  void setList(List<NowPlayMod> url) {
    state = [...state, ...url];
  }

  void removeList(NowPlayMod url) {
    state = state.where((element) => element != url).toList();
  }
}
