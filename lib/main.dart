import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_hope/Auth/Sign_up.dart';

import 'Auth/Login.dart';
import './screens/splash_screen.dart';
import 'widgets/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        useMaterial3: true,
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
        nextScreen: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.hasData) {
                return const Homepage();
              } else {
                return const Login();
              }
            }),
      ),
      routes: {
        Homepage.routeName: (context) => const Homepage(),
        SignUp.routeName: (context) => const SignUp(),
      },
    );
  }
}
