import 'package:flutter/material.dart';

class Drawer extends StatelessWidget {
  const Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 250, //the width of the drawer
      child: ListView(
        //list of widgets on the drawer
        children: const <Widget>[
          ListTile(
            title: Text('this is a child widget'),
          )
        ],
      ),
    );
  }
}
