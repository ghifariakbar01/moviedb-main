import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/provider/favorit_prov.dart';

// ignore: must_be_immutable
class FavoritPage extends ConsumerStatefulWidget {
  FavoritPage({Key? key}) : super(key: key);

  @override
  FavoritPageState createState() => FavoritPageState();
}

class FavoritPageState extends ConsumerState<FavoritPage> {
  @override
  Widget build(BuildContext context) {
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
                      ? Column(
                          children: [
                            Slidable(
                              // Specify a key if the Slidable is dismissible.
                              key: UniqueKey(),

                              // The start action pane is the one at the left or the top side.
                              startActionPane: ActionPane(
                                // A motion is a widget used to control how the pane animates.
                                motion: const ScrollMotion(),
                                key: UniqueKey(),

                                // A pane can dismiss the Slidable.
                                dismissible: DismissiblePane(onDismissed: () {
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

                                                setState(() {});
                                              },
                                            )
                                          ],
                                        );
                                      });
                                }),

                                // All actions are defined in the children parameter.
                                children: [
                                  // A SlidableAction can have an icon and/or a label.
                                  SlidableAction(
                                    onPressed: (context) {
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
                                                              .read(
                                                                  favoritProvider
                                                                      .notifier)
                                                              .removeFavorit(
                                                                  favorit[
                                                                      index]);

                                                          Navigator.pop(
                                                              context);
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
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),

                              // The end action pane is the one at the right or the bottom side.
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                key: UniqueKey(),
                                children: [
                                  SlidableAction(
                                    // An action can be bigger than the others.

                                    onPressed: (context) {
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
                                                              .read(
                                                                  favoritProvider
                                                                      .notifier)
                                                              .removeFavorit(
                                                                  favorit[
                                                                      index]);

                                                          Navigator.pop(
                                                              context);
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
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),

                              // The child of the Slidable is what the user sees when the
                              // component is not dragged.
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ColorFiltered(
                                          colorFilter: const ColorFilter.mode(
                                              Colors.black54, BlendMode.darken),
                                          child: CachedNetworkImage(
                                            imageUrl: favorit[index].image,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          favorit[index].title,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: Text(
                                          favorit[index].description,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              favorit[index].image),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // slide me text
                            // sizedbox for spacing
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Slide me',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                )),

                            const SizedBox(
                              height: 10,
                            ),
                          ],
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
