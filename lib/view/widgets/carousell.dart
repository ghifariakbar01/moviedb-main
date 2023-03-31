import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/view/widgets/detailinfo.dart';

import '../../provider/index_prov.dart';

class CarousellWidget extends ConsumerStatefulWidget {
  CarousellWidget({Key? key, required this.cardList}) : super(key: key);

  final List cardList;

  @override
  ConsumerState<CarousellWidget> createState() => _CarousellWidgetState();
}

class _CarousellWidgetState extends ConsumerState<CarousellWidget> {
  @override
  Widget build(BuildContext context) {
    final cardList = widget.cardList;
    final cardIndex = ref.watch(cardIndexStateNotifierProvider);

    return OpenContainer(
        openBuilder: (BuildContext context, _) {
          return DetailInfoPage(
            url: cardList[cardIndex].getUrl,
            title: cardList[cardIndex].getTitle,
            content: cardList[cardIndex].getDesc,
            imageUrl: cardList[cardIndex].geturlToImage,
            date: cardList[cardIndex].getReleased,
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
                    height:
                        //convert 300 to height of screen
                        MediaQuery.of(context).size.height * 0.3,
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
                          .take(10)
                          .toList(),
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        viewportFraction: 0.35,
                        initialPage: 1,
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
            ));
  }
}
