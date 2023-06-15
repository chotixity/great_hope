import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Firestore {
  final _firestore = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();
  Future<void> addUserDetails(
    String firstname,
    String Lastname,
    String phonenumber,
    String email,
    String gender,
  ) async {
    await _firestore.collection("users").add({
      'firstname': firstname,
      'lastname': Lastname,
      'email': email,
      'phonenumber': phonenumber,
      'gender': gender,
    });
  }

  Future<void> addEvent(
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

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storageRef
          .child('Books/$fileName')
          .putFile(file)
          .snapshotEvents
          .listen((event) {
        switch (event.state) {
          case TaskState.running:
            const CircularProgressIndicator();
            break;
          default:
        }
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  Future<ListResult> listFiles() async {
    ListResult result = await storageRef.child('Books/uid').listAll();
    result.items.forEach((element) => print(element.name));
    return result;
  }
}
