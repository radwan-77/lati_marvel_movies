import 'package:flutter/material.dart';
import 'package:lati_marvel_movies/helper/consts.dart';
import 'package:lati_marvel_movies/provider/authentication_provider.dart';
import 'package:lati_marvel_movies/provider/base_provoder.dart';
import 'package:lati_marvel_movies/provider/movie_provider.dart';
import 'package:lati_marvel_movies/screen/auth_screen/login_screen.dart';
import 'package:lati_marvel_movies/screen/auth_screen/splash_screnn.dart';
import 'package:lati_marvel_movies/screen/main_screen/home_screen.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseProvider>(
            create: (context) => BaseProvider()),
        ChangeNotifierProvider<MovieProvider>(
            create: (context) => MovieProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Marvel',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
            useMaterial3: false,
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true),
          ),
          home: SplashScreen()),
    );
  }
}


class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  void initState() {
    Provider.of<AuthenticationProvider>(context , listen: false).initializeAuthProvider();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, auth, child) {
        return AnimatedSwitcher(duration: animationDuration,
        child: auth.authenticated ? HomeScreen() : LoginScreen(),);
      }
    );
  }
}
