// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:university/models/subject.dart';
import 'screens/subjects_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/daily_schedule.dart';
import 'themes/themes.dart';

late Box box;
Future<void> main() async {
  // await Hive.initFlutter();
  // await Hive.openBox('Box');
  // box = Hive.box('Box');

  // List<Subject> x = [Subject(name: 'math'), Subject(name: 'science')];

  // box.add(x);

  // Hive.registerAdapter(MyObjectAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University',
      theme: Themes.lightTheme,
      // flutter detects if the system is in dark mode ,and it will use the theme in the attribue (darkTheme)
      darkTheme: Themes.darkTheme,
      home: HomePage(),
    );
  }
}

/////////////////////////////////////////// here the code for the actual UI \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
class HomePage extends StatefulWidget {
  var x = true;

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const isLightTheme = true;
  int _currentIndex = 0;
  final List _children = [
    DailySchedule(),
    Schedule(),
    SubjectsScreen(
      theme: isLightTheme ? Themes.lightTheme : Themes.darkTheme,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('University')),
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
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books),
            label: 'Subjects',
          ),
        ],
      ),
    );
  }
}
