// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omdb/view/pages/movies/nowplay.dart';
import 'package:omdb/view/pages/movies/popular.dart';
import 'package:omdb/view/pages/movies/toprate.dart';
import 'package:omdb/view/pages/movies/upcoming.dart';
import 'package:omdb/view/widgets/drawer.dart';
import 'package:provider/provider.dart';
import '../../constant/color_pallete.dart';
import '../../view/widgets/divider.dart';

class TVPage extends StatefulWidget {
  @override
  TVPageState createState() => TVPageState();
}

// bool _isLoading = true;
bool enableLink = false;

class TVPageState extends State<TVPage> {
  Future<bool> onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text(
              'Keluar Aplikasi?',
              style: const TextStyle(
                  color: ColorPalette.btnNewColor, fontWeight: FontWeight.bold),
            ),
            content: const Text('Anda akan keluar dari Aplikasi'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Iya'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: ListView(
        physics: const ScrollPhysics(),
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //big text Top Rated Movies
              Divider(
                title: "Popular TV Shows",
              ),
              Popular(tv: true),
              Divider(
                title: "TV On The AIr",
              ),
              Upcoming(
                tv: true,
              ),
              Divider(
                title: "TV Airing Today",
              ),
              NowPlaying(tv: true),
              Divider(
                title: "Top Rated TV Show",
              ),
              TopRated(
                tv: true,
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
