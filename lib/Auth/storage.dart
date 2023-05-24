import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  Future addUserDetails(
    String firstname,
    String Lastname,
    String phonenumber,
    String email,
  ) async {
    await FirebaseFirestore.instance.collection("users").add({
      'firstname': firstname,
      'lastname': Lastname,
      'email': email,
      'phonenumber': phonenumber,
    });
  }
}
