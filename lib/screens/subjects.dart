import 'package:flutter/material.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({Key? key}) : super(key: key);

  @override
  _SubjectsScreenState createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: const Text('\\\\here the subjects should be displayed '),
          ), //subjects are displayed if there is any
          ElevatedButton(
            onPressed: () => modalBottomSheet(context),
            child: const Text('add a subject'),
          ),
        ],
      ),
    );
  }

  void modalBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: SizedBox(
              height: 400,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Subject name',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add the subject',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
