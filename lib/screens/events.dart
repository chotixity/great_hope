import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../provider/eventProvider.dart';
import '../widgets/eventtile.dart';

class Events extends StatefulWidget {
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: _eventStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              List<Map<String, dynamic>> data1 = [];
              if (DateTime(data['date']).compareTo(DateTime.now()) < 0) {}
              return EventTile(
                data['eventName'],
                data['location'],
                data['date'],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
