import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/model/mod_nowplay.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';
import 'package:omdb/provider/now_play_prov.dart';
import 'package:omdb/utils/api.helper.dart';

final tvPopularProvider = FutureProvider.autoDispose((ref) async {
  final result = await API.getPopularTv();

  return result;
});

final moviePopularProvider = FutureProvider.autoDispose((ref) async {
  final result = await API.getPopular();
  return result;
});

//  ======== NOW PLAYING ====== //

final tvNowPlayingProvider = FutureProvider.autoDispose((ref) async {
  final result = await API.getNowPlayingTv();

  final List<NowPlayMod> allNowList = [];

  for (var element in result!.results!) {
    allNowList.add(NowPlayMod(
        url: element.posterPath ?? '',
        title: element.name ?? '',
        desc: element.overview ?? '',
        imageUrl: element.posterPath ?? '',
        released: element.firstAirDate != null && element.firstAirDate != ''
            ? DateTime.parse(element.firstAirDate!)
            : DateTime.now()));
  }

  ref.read(tVnowPlayUrlProvider.notifier).setList(allNowList);

  return result;
});

final movieNowPlayingProvider = FutureProvider.autoDispose((ref) async {
  final result = await API.getNowPlaying();

  final List<NowPlayMod> allNowList = [];

  for (var element in result!.results) {
    allNowList.add(NowPlayMod(
        url: element.posterPath,
        title: element.title,
        desc: element.overview,
        imageUrl: element.posterPath,
        released: DateTime.parse(element.releaseDate)));
  }

  ref.read(nowPlayUrlProvider.notifier).setList(allNowList);
  return result;
});
