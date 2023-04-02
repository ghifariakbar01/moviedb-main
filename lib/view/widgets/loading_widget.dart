import 'package:flutter/material.dart';
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
        child: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              ...List.generate(
                10,
                (index) => Container(
                  margin: const EdgeInsets.all(10),
                  width: 100,
                  height: 100,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
