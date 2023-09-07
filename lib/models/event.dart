import 'package:flutter/material.dart';

class Event extends ChangeNotifier {
  final String name;
  final String location;
  final String date;
  bool favorite = false;

  Event({
    required this.name,
    required this.location,
    required this.date,
  });
}
