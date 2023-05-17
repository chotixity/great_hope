import 'package:flutter/material.dart';

class HomepageCard extends StatelessWidget {
  final String event;
  final String days;
  final String time;
  const HomepageCard(this.event, this.days, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 130,
      child: Card(
        elevation: 5,
        color: Colors.grey[400],
        child: Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  event,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        days,
                        style: const TextStyle(fontSize: 16),
                      ),
                      VerticalDivider(
                        width: 20,
                        thickness: 1,
                        color: theme.primaryColor,
                      ),
                      Text(
                        time,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
