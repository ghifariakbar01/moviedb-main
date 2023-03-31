import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          child: FittedBox(
            fit: BoxFit.fill,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const AllCards(
                  id: 1,
                  title: "Dummy",
                  image: "Dummy",
                  description: "Dummy",
                ),
                const AllCards(
                  id: 1,
                  title: "Dummy",
                  image: "Dummy",
                  description: "Dummy",
                ),
                const AllCards(
                  id: 1,
                  title: "Dummy",
                  image: "Dummy",
                  description: "Dummy",
                ),
                const AllCards(
                  id: 1,
                  title: "Dummy",
                  image: "Dummy",
                  description: "Dummy",
                ),
                const AllCards(
                  id: 1,
                  title: "Dummy",
                  image: "Dummy",
                  description: "Dummy",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
