import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:great_hope/main.dart';
import '../widgets/bottom_bar.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with e-mail
  static Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigatorKey.currentState!.pushReplacementNamed(Homepage.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        messengerkey.currentState!.showSnackBar(
          const SnackBar(
            content: Text('No user found for that email'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        messengerkey.currentState!.showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for the user'),
          ),
        );
      }
    }
  }

  //Forgot Password
  static Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      messengerkey.currentState!.showSnackBar(
        SnackBar(
          content: Text('Password reset email has been sent to $email'),
        ),
      );
    } catch (e) {
      messengerkey.currentState!.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  static Future<void> SignUp() async {}
}
