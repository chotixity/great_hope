import 'package:flutter/material.dart';
import 'package:text_divider/text_divider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/custom_button.dart';
import '../widgets/bottom_bar.dart';
import 'Auth.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome...',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordcontroller,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.remove_red_eye),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
            CustomButtton('Login', () async {
              await _auth.signInWithEmailAndPassword(
                email: _emailcontroller.text.trim(),
                password: _passwordcontroller.text.trim(),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            TextDivider.horizontal(
              color: Colors.black87,
              text: const Text('Or continue with'),
            ),
          ],
        ),
      ),
    );
  }
}
