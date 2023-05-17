import 'package:flutter/material.dart';

import '../widgets/Card.dart';

class GHHomepage extends StatelessWidget {
  const GHHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Weekly Events',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                HomepageCard(
                  'Bible Study',
                  'Every Monday \n And Tuesday',
                  'From 5pm\n To 7pm',
                ),
                HomepageCard(
                  'Choir Practice',
                  'Every Sunday \n From 2pm to 4pm',
                  'Every Friday \n From 5pm To 7pm',
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Other events',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Flexible(
              child: Row(
                children: const [
                  HomepageCard('Charity Event', 'Saturday', '9am to 5pm')
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Recommended Books',
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Flexible(
              child: Wrap(
                spacing: 30,
                children: [
                  Image.asset(
                    'assets/images/Rectangle 16.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/image6.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/image6.png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
