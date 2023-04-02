import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdb/constant/constants.dart';

class NowPlayWidget extends StatelessWidget {
  const NowPlayWidget({
    Key? key,
    required this.urlToImage,
  }) : super(key: key);

  final String urlToImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: CachedNetworkImage(
        height: MediaQuery.of(context).size.height * 0.2,
        imageUrl: hostImageUrl + urlToImage,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => Center(
            child: Image.asset(
          "assets/default_image.png",
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
