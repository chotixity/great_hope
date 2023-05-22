import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerS extends StatelessWidget {
  const DrawerS({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(''),
          ),
          const Text('You are Logged in as '),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Sign Out'))
        ],
      ),
    );
  }
}
