import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/provider/popular_provider.dart';
import 'package:omdb/view/widgets/allcards.dart';
import 'package:omdb/view/widgets/loading_widget.dart';

class Popular extends ConsumerStatefulWidget {
  const Popular({Key? key, required this.tv}) : super(key: key);
  final bool tv;

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends ConsumerState<Popular> {
  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch(moviePopularProvider);
    final popularTvs = ref.watch(tvPopularProvider);

    return !widget.tv
        ? SizedBox(
            height: 100,
            child: popularMovies.when(
                data: (data) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.results!.length,
                    itemBuilder: (context, index) {
                      return AllCards(
                        id: data.results![index].id!.toInt(),
                        title: data.results![index].title,
                        image: hostImageUrl + data.results![index].posterPath!,
                        description: data.results![index].overview,
                        releaseDate: data.results![index].releaseDate,
                      );
                    },
                  );
                },
                error: (error, stackTrace) => const Text('Error'),
                loading: () => const LoadingWidget()))
        : SizedBox(
            height: 100,
            child: popularTvs.when(
                data: (data) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data?.results?.length,
                    itemBuilder: (context, index) {
                      return AllCards(
                        id: data?.results?[index].id ?? 0,
                        title: data?.results?[index].originalName,
                        image:
                            '$hostImageUrl${data?.results?[index].posterPath ?? ''}',
                        description: data?.results?[index].overview,
                        releaseDate: data?.results?[index].firstAirDate ?? '',
                      );
                    },
                  );
                },
                error: (error, stackTrace) => const Text('Error'),
                loading: () => const LoadingWidget()));
  }
}
