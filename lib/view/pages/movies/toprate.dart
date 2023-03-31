import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/mod_toprate.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';
import 'package:omdb/provider/tv_popular_provider.dart';
import 'package:omdb/utils/api.helper.dart';
import 'package:omdb/view/widgets/allcards.dart';
import 'package:omdb/view/widgets/loading_widget.dart';
import 'package:shimmer/shimmer.dart';

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
        ? Container(
            height: 103,
            child: FutureBuilder<TopRateMod?>(
              future: API.getTopRated(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TopRateMod topRateMod = snapshot.data!;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Row(
                          children: [
                            ...topRateMod.results!.map((movies) {
                              return AllCards(
                                id: movies?.id,
                                title: movies?.title,
                                image: imageUrl + "${movies?.posterPath}",
                                description: movies?.overview,
                              );
                            }).take(10)
                          ],
                        ),
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
        : tvPopular.when(
            data: (data) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Row(
                      children: [
                        ...data.results!.map((movies) {
                          return AllCards(
                            id: movies?.id,
                            title: movies?.originalName,
                            image: imageUrl + movies!.backdropPath!,
                            description: movies.overview,
                          );
                        }).take(5)
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (e, s) => Text('error $e'),
            loading: () {
              return LoadingWidget();
            });
  }
}
