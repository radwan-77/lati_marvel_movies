import 'package:flutter/material.dart';
import 'package:lati_marvel_movies/screen/auth_screen/splash_screnn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
//   Color primaryColor = const Color(0xffF0141E);
// GET MOVIES : https://mcuapi.herokuapp.com/api/v1/movies
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
