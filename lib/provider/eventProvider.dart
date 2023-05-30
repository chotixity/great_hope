import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/event.dart';

class EventProvider with ChangeNotifier {
  final List<Event> _events = [
    Event(name: 'Palm Sunday', location: 'KUSDA', date: DateTime.now()),
    Event(name: 'Palm Sunday', location: 'KUSDA', date: DateTime.now()),
    Event(
        name: 'Palm Sunday',
        location: 'KUSDA',
        date: DateTime.now().add(const Duration(days: 2))),
    Event(
        name: 'Palm Sunday',
        location: 'KUSDA',
        date: DateTime.now().add(const Duration(days: 1))),
    Event(name: 'Palm Sunday', location: 'KUSDA', date: DateTime.now()),
  ];

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

  void addEvent(newEvent) {
    _events.add(newEvent);
    notifyListeners();
  }
}
