import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/provider/favorit_prov.dart';

// ignore: must_be_immutable
class FavoritPage extends ConsumerWidget {
  FavoritPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorit = ref.watch(favoritProvider);

    //set data to provider
    if (favorit.isNotEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorPalette.themeColor,
          title: Text('Favorit'),
        ),
        body: favorit != null
            ? ListView.builder(
                itemCount: favorit.length,
                itemBuilder: (context, index) {
                  return favorit != null
                      ? ListTile(
                          onTap: () {
                            //show dialog to delete list
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Delete'),
                                    content: Text(
                                        'Are you sure to delete this item?'),
                                    actions: <Widget>[
                                      Builder(
                                        builder: (_context) {
                                          return InkWell(
                                              child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: Text('Yes')),
                                              onTap: () {
                                                ref
                                                    .read(favoritProvider
                                                        .notifier)
                                                    .removeFavorit(
                                                        favorit[index]);

                                                Navigator.pop(context);
                                              });
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                            height: 50,
                                            width: 50,
                                            child: Text('No')),
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          title: Text(favorit[index].title),
                          subtitle: Text(favorit[index].description),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(favorit[index].image),
                          ),
                        )
                      : Container(
                          child: const Center(
                            child: Text('No Data'),
                          ),
                        );
                },
              )
            : const Center(
                child: Text('No Data'),
              ),
      );
    } else {
      return Center(
        child: Text('No Data'),
      );
    }
  }
}
