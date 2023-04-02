import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/model/mod_nowplay.dart';
import 'package:omdb/model/mod_upcoming.dart';
import 'package:omdb/view/widgets/detailinfo.dart';
import 'package:omdb/view/widgets/itemcarousell.dart';

import '../../provider/index_prov.dart';

class CarousellWidget extends ConsumerStatefulWidget {
  CarousellWidget(
      {Key? key, required this.carousellList, required this.carousellResult})
      : super(key: key);

  final List<NowPlayWidget> carousellList;
  final List<NowPlayMod> carousellResult;

  @override
  ConsumerState<CarousellWidget> createState() => _CarousellWidgetState();
}

class _CarousellWidgetState extends ConsumerState<CarousellWidget> {
  @override
  Widget build(BuildContext context) {
    final cardList = widget.carousellList;
    final cardResult = widget.carousellResult;
    final cardIndex = ref.watch(cardIndexStateNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OpenContainer(
          openBuilder: (BuildContext context, _) {
            return DetailInfoPage(
              url: cardResult[cardIndex].url,
              title: cardResult[cardIndex].title,
              content: cardResult[cardIndex].desc,
              imageUrl: cardResult[cardIndex].imageUrl,
              date: cardResult[cardIndex].released ?? DateTime.now(),
            );
          },
          closedElevation: 0,
          closedColor: Colors.white,
          closedBuilder: (context, action) => InkWell(
                onTap: action,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: const EdgeInsets.only(top: 10),
                      child: CarouselSlider(
                        items: cardList
                            .map((card) {
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                  child: card,
                                );
                              });
                            })
                            .take(cardList.length)
                            .toList(),
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          viewportFraction: 0.35,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          height: MediaQuery.of(context).size.height * 0.3,
                          // aspectRatio: 2.0,

                          onPageChanged: (index, reason) {
                            ref
                                .read(cardIndexStateNotifierProvider.notifier)
                                .changeIndex(index);
                          },
                          autoPlayInterval: const Duration(seconds: 10),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
