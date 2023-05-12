import 'package:flutter/material.dart';

import '../screens/Homepage.dart';
import '../screens/library.dart';
import '../screens/events.dart';
import '../screens/add.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/Homepage';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedindex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Widget> widgetOptions = [
      const GHHomepage(),
      const Events(),
      const Add(),
      const Library(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'The Great Hope Ministry',
          style: TextStyle(color: theme.primaryColor),
        ),
      ),
      body: widgetOptions.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_note,
              color: Colors.black,
            ),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.black,
            ),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books,
              color: Colors.black,
            ),
            label: 'library',
          ),
        ],
        currentIndex: _selectedindex,
        selectedItemColor: theme.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
