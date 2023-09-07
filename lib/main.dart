import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './Auth/Sign_up.dart';
import './provider/eventProvider.dart';
import 'widgets/bottom_bar.dart';
import '/screens/events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EventProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

final messengerkey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      scaffoldMessengerKey: messengerkey,
      navigatorKey: navigatorKey,
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
      home: const SplashScreen(),
      routes: {
        Homepage.routeName: (context) => const Homepage(),
        SignUp.routeName: (context) => const SignUp(),
        Events.routeName: (context) => const Events(),
      },
    );
  }
}
