import 'package:flutter/material.dart';
import 'package:lati_marvel_movies/helper/consts.dart';

class CustomIconAppBar extends StatelessWidget {
  final String assets;
  final Function onTab;
  const CustomIconAppBar(
      {super.key, required this.assets, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2, color: mainColor)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            assets,
            width: 24,
            height: 24,
          ),
        )
      ],
    );
  }
}
