import 'package:flutter/material.dart';
import 'package:notes_app/screens/add_notes_screen.dart';
import 'package:notes_app/screens/home_screen.dart';
import 'package:notes_app/screens/notes_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    AddNotesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Notes List'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add Notes'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
