import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GhUser? _fromfirebase(User? user) {
    return user != null ? GhUser(uid: user.uid) : null;
  }

  //listen to changes and then return them
  Stream<GhUser?> get user {
    return _auth.authStateChanges().map(_fromfirebase);
  }

  // sign in with e-mail

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
