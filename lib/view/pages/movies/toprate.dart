import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/mod_toprate.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';
import 'package:omdb/provider/popular_provider.dart';
import 'package:omdb/utils/api.helper.dart';
import 'package:omdb/view/widgets/allcards.dart';
import 'package:omdb/view/widgets/loading_widget.dart';

class TopRated extends ConsumerStatefulWidget {
  const TopRated({Key? key, required this.tv}) : super(key: key);
  final bool tv;

  @override
  _TopRatedState createState() => _TopRatedState();
}

class _TopRatedState extends ConsumerState<TopRated> {
  int? id;

  @override
  Widget build(BuildContext context) {
    final tvPopular = ref.watch(tvPopularProvider);

    return !widget.tv
        ? SizedBox(
            height: 100,
            child: FutureBuilder<TopRateMod?>(
              future: API.getTopRated(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TopRateMod topRateMod = snapshot.data!;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          ...topRateMod.results!.map((movies) {
                            return AllCards(
                              id: movies?.id,
                              title: movies?.title,
                              image: "$hostImageUrl${movies?.posterPath}",
                              description: movies?.overview,
                              releaseDate: movies?.releaseDate,
                            );
                          }).take(10)
                        ],
                      ),
                    ),
                  );
                } else {
                  {
                    return LoadingWidget();
                  }
                }
              },
            ),
          )
        : SizedBox(
            height: 100,
            child: FutureBuilder<PopularTVModel?>(
              future: API.getTopRatedTv(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  PopularTVModel data = snapshot.data!;
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.results?.length,
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
                  {
                    return LoadingWidget();
                  }
                }
              },
            ),
          );
  }
}
