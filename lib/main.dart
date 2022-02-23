// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'screens/subjects.dart';
import 'screens/schedule.dart';
import 'themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University',
      theme: Themes.darkTheme,
      home: HomePage(),
    );
  }
}

/////////////////////////////////////////// here the code for the actual UI \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
class HomePage extends StatefulWidget {
  var x = true;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const isLightTheme = true;
  int _currentIndex = 0;
  final List _children = [
    Container(
      color: Colors.white,
    ),
    Schedule(),
    SubjectsScreen(
      theme: isLightTheme ? Themes.lightTheme : Themes.darkTheme,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('University')),
      body: _children[
          _currentIndex], //the widget that will be displayed between our app bar and bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'daily Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Subjects',
          ),
        ],
      ),
    );
  }
}
