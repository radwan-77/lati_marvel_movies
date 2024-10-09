import 'package:flutter/material.dart';
import 'package:lati_marvel_movies/helper/consts.dart';
import 'package:lati_marvel_movies/helper/function_helper.dart';
import 'package:lati_marvel_movies/main.dart';
import 'package:lati_marvel_movies/screen/main_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ScreenRouter()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Image.asset(
          "assets/logo/marvelLogo.png",
          width: getSize(context).width * 0.8,
        ),
      ),
    );
  }
}
