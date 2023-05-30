import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../provider/eventProvider.dart';
import '../widgets/eventtile.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: provider.events.length,
        itemBuilder: ((context, index) {
          return EventTile(
            provider.events[index].name,
            provider.formatDate(provider.events[index].date),
          );
        }),
      ),
    );
  }
}
