import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/mod_upcoming.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';
import 'package:omdb/utils/api.helper.dart';
import 'package:omdb/utils/helper.dart';
import 'package:omdb/view/widgets/allcards.dart';
import 'package:omdb/view/widgets/loading_widget.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key, required this.tv}) : super(key: key);
  final bool tv;
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return !widget.tv
        ? SizedBox(
            height: 100,
            child: FutureBuilder<UpcomingMod?>(
              future: API.getUpcoming(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  UpcomingMod upcomingMod = snapshot.data!;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: upcomingMod.results.length,
                    itemBuilder: (context, index) {
                      return AllCards(
                          id: upcomingMod.results[index].id,
                          title: upcomingMod.results[index].title,
                          image: hostImageUrl +
                              upcomingMod.results[index].posterPath,
                          description: upcomingMod.results[index].overview,
                          releaseDate: upcomingMod.results[index].releaseDate);
                    },
                  );
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          )
        : SizedBox(
            height: 100,
            child: FutureBuilder<PopularTVModel?>(
              future: API.getTvOnTheAir(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  PopularTVModel data = snapshot.data!;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.results!.length,
                    itemBuilder: (context, index) {
                      return AllCards(
                        id: data.results?[index].id ?? 0,
                        title: data.results?[index].originalName,
                        image:
                            '$hostImageUrl${data.results?[index].posterPath ?? ''}',
                        description: data.results?[index].overview,
                        releaseDate: data.results?[index].firstAirDate ?? '',
                      );
                    },
                  );
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          );
  }
}
