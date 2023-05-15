import 'package:flutter/material.dart';

import '../widgets/event_widget_add.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Event(Icons.event_note, 'add an event', () {}),
          Event(Icons.library_books_outlined, 'add a document', () {}),
          Event(Icons.notifications_active, 'add a notifiacation', () {}),
        ],
      ),
    );
  }
}
