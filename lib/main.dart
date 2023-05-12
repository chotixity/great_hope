import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'screens/first_screen.dart';
import './screens/splash_screen.dart';
import 'widgets/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GH',
      theme: ThemeData(
        fontFamily: 'Lato',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20),
        ),
        primaryColor: MaterialColor(
            const Color.fromRGBO(253, 3, 63, .8).value, const <int, Color>{}),
      ),
      home: AnimatedSplashScreen(
        duration: 2000,
        backgroundColor: const Color.fromRGBO(253, 3, 63, .8),
        splash: const SplashScreen(),
        nextScreen: const Homescreen(),
      ),
      routes: {
        Homepage.routeName: (context) => Homepage(),
      },
    );
  }
}
