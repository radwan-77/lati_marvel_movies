import 'package:flutter/material.dart';
import 'package:lati_marvel_movies/helper/consts.dart';
import 'package:lati_marvel_movies/helper/function_helper.dart';
import 'package:lati_marvel_movies/widget/custom-icon-appbar.dart';

class HomrScreen extends StatefulWidget {
  const HomrScreen({super.key});

  @override
  State<HomrScreen> createState() => _HomrScreenState();
}

class _HomrScreenState extends State<HomrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/logo/marvelLogo.png",
            width: getSize(context).width * 0.2),
        actions: [
          CustomIconAppBar(assets: "assets/icons/InboxIcon.png", onTab: () {}),
          CustomIconAppBar(
              assets: "assets/icons/FavoriteButton.png", onTab: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1),
          itemBuilder: (context, index) {
            return Container(
              width: 50,
              height: 50,
              color: mainColor,
            );
          },
        ),
      ),
    );
  }
}
