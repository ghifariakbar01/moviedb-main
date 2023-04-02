import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/mod_favorit.dart';
import 'package:omdb/provider/favorit_prov.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailInfoPage extends ConsumerStatefulWidget {
  final String? title;
  final String? content;
  final String? imageUrl;
  final DateTime date;
  final String url;

  DetailInfoPage(
      {Key? key,
      required this.title,
      required this.content,
      required this.imageUrl,
      required this.date,
      required this.url})
      : super(key: key);
  @override
  _DetailInfoPageState createState() => _DetailInfoPageState();
}

class _DetailInfoPageState extends ConsumerState<DetailInfoPage> {
  late String _imageUrl;
  late String _title;
  late String _content;
  late String titleMore;

  late DateTime _date;
  bool lastStatus = true;

  @override
  void initState() {
    if (widget.title!.length > 24) {
      titleMore = widget.title!.substring(0, 24);
    } else {
      titleMore = widget.title!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favorit = ref.watch(favoritProvider);

    bool isFavorit = favorit.any((element) => element.title == widget.title);

    _imageUrl = hostImageUrl + widget.imageUrl!;
    _title = widget.title!;
    _content = widget.content!;
    _date = widget.date;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.themeColor,
        foregroundColor: isFavorit ? ColorPalette.textColor : Colors.white,
        onPressed: () {
          Favorit favorit = Favorit(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            title: _title,
            description: _content,
            image: _imageUrl,
          );
          // add to provider list

          !isFavorit
              ? ref.read(favoritProvider.notifier).addFavorit(favorit)
              : ref.read(favoritProvider.notifier).removeFavorit(favorit);

          Fluttertoast.showToast(
              msg: !isFavorit ? "Added to Favorite" : "Removed from Favorite",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        child: const Icon(Icons.favorite_border),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
            pinned: true,
            expandedHeight: 500.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchBrowser(widget.url);
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: _imageUrl, //baseUrl +
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Center(
                              child: Image.asset(
                            "assets/carousell_galeri.png",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        bottom: 5.0, left: 16, right: 16, top: 16),
                    child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(milliseconds: 250),
                      child: Text(_title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Proppins")),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 16, right: 16),
                      child: _date != null
                          ? Text(
                              DateFormat('dd MMM yyyy kk:mm')
                                  .format(_date.add(const Duration(hours: 7))),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                            )
                          : Container()),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Divider(
                      height: 4,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 5, right: 8, left: 8, bottom: 10),
                    child: Text(
                      _content,
                    ),
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  _launchBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch url';
    }
  }
}
