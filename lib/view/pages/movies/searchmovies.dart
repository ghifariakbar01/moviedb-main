import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/search_mod.dart';
import 'package:omdb/utils/api.helper.dart';
import 'package:omdb/view/widgets/detailinfo.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({Key? key}) : super(key: key);

  @override
  _SearchMoviesState createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  var data;

  @override
  Widget build(BuildContext context) {
    API api = API();
    //page to search movies
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: ColorPalette.themeColor,
        title: Text('Search Movies'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                cursorColor: ColorPalette.themeColor,
                onChanged: (String str) {
                  data = API.searchMoviesByName(str);
                  setState(() {
                    data = API.searchMoviesByName(str);
                  });
                },
                onSubmitted: (String str) async {
                  data = await API.searchMoviesByName(str);
                  setState(() {
                    data = API.searchMoviesByName(str);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search Movies',
                  focusColor: ColorPalette.themeColor,
                  hoverColor: ColorPalette.themeColor,
                  fillColor: ColorPalette.themeColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPalette.themeColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            if (data != null)
              FutureBuilder<SearchMod?>(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final SearchMod? data = snapshot.data;
                      return ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ...?data!.results
                              ?.map(
                                (e) => OpenContainer(
                                  closedBuilder: (context, action) => ListTile(
                                      onTap: action,
                                      title: Row(
                                        children: [
                                          CachedNetworkImage(
                                            height: 100,
                                            imageUrl:
                                                "$hostImageUrl${e?.posterPath}",
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: SizedBox(
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  150,
                                              child: e?.overview != null
                                                  ? Text(
                                                      "${e?.overview}...",
                                                      maxLines: 5,
                                                      textAlign:
                                                          TextAlign.justify,
                                                    )
                                                  : const Text(
                                                      "empty",
                                                      maxLines: 5,
                                                    ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  openBuilder: (context, action) =>
                                      DetailInfoPage(
                                          title: e?.name,
                                          content: e?.overview,
                                          imageUrl:
                                              "$hostImageUrl${e?.posterPath}",
                                          date: DateTime.now(),
                                          url: "$hostImageUrl${e?.posterPath}"),
                                ),
                              )
                              .take(data.results!.length)
                              .toList(),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  })
            else
              const Text('No Results'),
          ],
        ),
      ),
    );
  }
}
