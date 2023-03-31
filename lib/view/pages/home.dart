// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omdb/provider/favorit_prov.dart';
import 'package:omdb/view/pages/movies/nowplay.dart';
import 'package:omdb/view/pages/movies/popular.dart';
import 'package:omdb/view/pages/movies/toprate.dart';
import 'package:omdb/view/pages/movies/upcoming.dart';
import 'package:provider/provider.dart';
import '../../constant/color_pallete.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

// bool _isLoading = true;
bool enableLink = false;

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(),
      children: [
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            //big text Top Rated Movies
            Divider(
              title: "Top Rated Movies",
            ),
            TopRated(
              tv: false,
            ),
            Divider(
              title: "Upcoming Movies",
            ),
            Upcoming(
              tv: false,
            ),

            Divider(
              title: "Now Playing Movies",
            ),
            NowPlaying(
              tv: false,
            ),
            Divider(
              title: "Popular Movies",
            ),
            Popular(
              tv: false,
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ],
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
