import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final _firestore = FirebaseFirestore.instance;
  Future addUserDetails(
    String firstname,
    String Lastname,
    String phonenumber,
    String email,
  ) async {
    await _firestore.collection("users").add({
      'firstname': firstname,
      'lastname': Lastname,
      'email': email,
      'phonenumber': phonenumber,
    });
  }

  Future addEvent(
    String name,
    String location,
    String date,
  ) async {
    await _firestore.collection("Events").add({
      'eventName': name,
      'location': location,
      'date': date,
    });
  }
}
