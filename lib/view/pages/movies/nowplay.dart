// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/mod_upcoming.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';
import 'package:omdb/utils/api.helper.dart';
import 'package:omdb/view/widgets/itemcarousell.dart';
import 'package:omdb/view/widgets/now_play_future.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key, required this.tv}) : super(key: key);
  final bool tv;
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  List cardList = [];

  late Future<UpcomingMod?> futures;

  void addList() async {
    futures = API.getNowPlaying();
    await futures.then((value) => value?.results.forEach((element) {
          cardList.add(Item1(
            url: imageUrl + element.posterPath,
            title: element.title,
            desc: element.overview,
            urlToImage: imageUrl + element.posterPath,
            released: element.releaseDate,
          ));
        }));
  }

  late Future<TVPopular?> futures1;

  //addListTv
  void addListTv() async {
    futures1 = API.getNowPlayingTv();
    await futures1.then((value) => value?.results?.forEach((element) {
          cardList.add(Item1(
            url: imageUrl + "${element?.posterPath}",
            title: "${element?.originalName}",
            desc: "${element?.overview}",
            urlToImage: imageUrl + "${element?.posterPath}",
            released: DateTime.now(),
          ));
        }));
  }

  @override
  void initState() {
    super.initState();
    !widget.tv ? addList() : addListTv();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.tv
        ? NowPlayFutureBuilder(
            futures: futures,
            cardList: cardList,
          )
        : NowPlayFutureBuilder(
            futures: futures1,
            cardList: cardList,
          );
  }
}
