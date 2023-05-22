import 'package:flutter/material.dart';
import 'package:text_divider/text_divider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/custom_button.dart';
import 'Sign_up.dart';
import '../widgets/bottom_bar.dart';
import 'Auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  late bool _passWordVisible;

  void initState() {
    _passWordVisible = false;
  }

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
              obscureText: !_passWordVisible,
              controller: _passwordcontroller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(_passWordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _passWordVisible = !_passWordVisible;
                    });
                  },
                ),
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
              onPressed: () async {
                try {
                  await _auth.sendPasswordResetEmail(
                      email: _emailcontroller.text.trim());
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(e.toString()),
                        );
                      });
                }
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: theme.primaryColor),
              ),
            ),
            CustomButtton('Login', () async {
              try {
                await _auth.signInWithEmailAndPassword(
                  email: _emailcontroller.text.trim(),
                  password: _passwordcontroller.text.trim(),
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No user found for that email'),
                    ),
                  );
                } else if (e.code == 'wrong-password') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Wrong password provided for the user'),
                    ),
                  );
                }
              }
            }),
            const SizedBox(
              height: 20,
            ),
            TextDivider.horizontal(
              color: Colors.black87,
              text: const Text('Or continue with'),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/google logo.png'),
                  Image.asset('assets/images/Apple Logo.png'),
                  Image.asset('assets/images/facebook logo.png'),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an accout? '),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.routeName);
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: theme.primaryColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
