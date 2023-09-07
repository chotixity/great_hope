import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/event.dart';

class EventProvider with ChangeNotifier {
  Future<void> fetchEvents() async {
    CollectionReference Eventsref =
        FirebaseFirestore.instance.collection('Events');
    final response = await Eventsref.get();
    try {
      _events.clear();
      //final events = response.docs.map((event) => event.data());
      for (var doc in response.docs) {
        _events.add(
          Event(
            name: doc['eventName'],
            location: doc['location'],
            date: doc['date'],
          ),
        );
      }
      print(_events);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  final List<Event> _events = [];

  String formatDate(DateTime date) {
    if (DateFormat.yMd().format(date) ==
        (DateFormat.yMd().format(DateTime.now()))) {
      return 'Today';
    } else if (DateFormat.yMd().format(date) ==
        (DateFormat.yMd()
            .format(DateTime.now().add(const Duration(days: 1))))) {
      return 'Tomorrow';
    } else if (DateFormat.yMd().format(date) ==
        (DateFormat.yMd()
            .format(DateTime.now().subtract(const Duration(days: 1))))) {
      return 'Yesterday';
    } else {
      return DateFormat.yMd().format(date);
    }
  }

  List<Event> get events {
    return [..._events];
  }

  void addEvent(Event event) {
    final newEvent = Event(
      name: event.name,
      location: event.location,
      date: event.date,
    );
    _events.add(newEvent);
    notifyListeners();
  }
}
