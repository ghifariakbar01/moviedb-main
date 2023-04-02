// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/provider/now_play_prov.dart';
import 'package:omdb/provider/popular_provider.dart';
import 'package:omdb/view/widgets/carousell.dart';
import 'package:omdb/view/widgets/itemcarousell.dart';
import 'package:omdb/view/widgets/loading_widget.dart';

class NowPlaying extends ConsumerStatefulWidget {
  const NowPlaying({Key? key, required this.tv}) : super(key: key);
  final bool tv;
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends ConsumerState<NowPlaying> {
  @override
  Widget build(BuildContext context) {
    final nowPlayingTv = ref.watch(tvNowPlayingProvider);
    final tvNowPlay = ref.watch(tVnowPlayUrlProvider);

    final nowPlaying = ref.watch(movieNowPlayingProvider);
    final nowPlay = ref.watch(nowPlayUrlProvider);

    return !widget.tv
        ? nowPlaying.when(
            data: (data) {
              if (data.results.isNotEmpty) {
                final List<NowPlayWidget> list = [];

                data.results.forEach((element) {
                  list.add(NowPlayWidget(urlToImage: element.posterPath));
                });

                return CarousellWidget(
                  carousellList: list,
                  carousellResult: nowPlay,
                );
              } else {
                return Container();
              }
            },
            error: (e, s) => Center(
              child: Text('Error $e $s'),
            ),
            loading: () => LoadingWidget(),
          )
        : nowPlayingTv.when(
            data: (data) {
              if (data.results!.isNotEmpty) {
                final List<NowPlayWidget> list = [];

                data.results?.forEach((element) {
                  list.add(NowPlayWidget(urlToImage: element.posterPath ?? ''));
                });

                return CarousellWidget(
                  carousellList: list,
                  carousellResult: tvNowPlay,
                );
              } else {
                return Container();
              }
            },
            error: (e, s) => Center(
                  child: Text('Error $e $s'),
                ),
            loading: () => LoadingWidget());
  }
}
