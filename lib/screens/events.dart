import 'package:flutter/material.dart';

import '../widgets/Card.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 10,
      ),
      child: Flexible(
          child: Column(
        children: <Widget>[
          Text('Recently added'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GridTile(
                  footer: const Text('Christian\'s Hope'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/book-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/book-2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/book-3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const HomepageCard('Sabbath Service', 'Every sabbath', "From 8AM"),
          const SizedBox(
            height: 20,
          ),
          const HomepageCard('Sabbath Service', 'Every sabbath', "From 8AM"),
        ],
      )),
    );
  }
}
