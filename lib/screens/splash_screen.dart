import 'package:flutter/material.dart';

import './first_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
  }

  void _navigateToHome() async {
    Future.delayed(const Duration(seconds: 2), () {});

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Homescreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: Text(
        'THE \n GREAT \n HOPE \n MINISTRY \n',
        textAlign: TextAlign.center,
        //maxLines: 4,
        style: TextStyle(
          backgroundColor: Colors.transparent,
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
