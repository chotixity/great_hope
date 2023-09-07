import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../provider/eventProvider.dart';
import '../widgets/eventtile.dart';

class Events extends StatefulWidget {
  static const routeName = '/events';
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _eventStream = FirebaseFirestore.instance
        .collection("Events")
        .where('date', isGreaterThan: DateFormat.yMd().format(DateTime.now()))
        .snapshots();
    final provider = Provider.of<EventProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RefreshIndicator(
            onRefresh: () => provider.fetchEvents(),
            child: ListView.builder(
                itemCount: provider.events.length,
                itemBuilder: (context, index) {
                  return EventTile(
                    provider.events[index].name,
                    provider.events[index].location,
                    provider.events[index].date,
                  );
                })),
      ),
    );
  }
}
