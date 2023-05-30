import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final String title;
  final String time;
  const EventTile(this.title, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
        //borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        title: Text(title),
        trailing: Text(
          time,
          style: TextStyle(color: theme.primaryColor, fontSize: 18),
        ),
      ),
    );
  }
}
