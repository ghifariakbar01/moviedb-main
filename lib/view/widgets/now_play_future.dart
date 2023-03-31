import 'package:flutter/material.dart';
import 'package:omdb/view/widgets/carousell.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayFutureBuilder extends StatefulWidget {
  const NowPlayFutureBuilder({Key? key, this.cardList, this.futures})
      : super(key: key);
  final cardList;
  final futures;

  @override
  State<NowPlayFutureBuilder> createState() => _NowPlayFutureBuilderState();
}

class _NowPlayFutureBuilderState extends State<NowPlayFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: widget.futures,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CarousellWidget(cardList: widget.cardList);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            enabled: true,
            child: Container(
              //rounded corners
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              margin: EdgeInsets.all(10),
              height: 150,
              child: Card(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
