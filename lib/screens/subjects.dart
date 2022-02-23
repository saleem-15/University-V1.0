import 'package:flutter/material.dart';

class SubjectsScreen extends StatefulWidget {
  final ThemeData theme;
  var subjectsList = ["Data Bases", "Computer Graphics", "Quran 4"];

  SubjectsScreen({required this.theme});

  @override
  _SubjectsScreenState createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  var newSubjectName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 500,
            child: ListView(
              children: widget.subjectsList.map((e) => Text(e)).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () => modalBottomSheet(context),
            child: const Text('add a subject'),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(widget.theme.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void addNewSubject(String subjectName) {
    setState(() {
      widget.subjectsList.add(subjectName);
    });
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
                    controller: newSubjectName,
                    decoration: InputDecoration(
                      hintText: 'Subject name',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: widget.theme.primaryColor),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  ElevatedButton(
                    onPressed: () => addNewSubject(newSubjectName.text),
                    child: const Text(
                      'Add the subject',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(widget.theme.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
