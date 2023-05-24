import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late BuildContext context;
  GhUser? _fromfirebase(User? user) {
    return user != null ? GhUser(uid: user.uid) : null;
  }

  //listen to changes and then return them
  Stream<GhUser?> get user {
    return _auth.authStateChanges().map(_fromfirebase);
  }

  // sign in with e-mail
  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
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
  }

  // anonyous sign in
  Future AnonySignIn() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _fromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
