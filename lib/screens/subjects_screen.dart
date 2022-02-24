import 'package:flutter/material.dart';

class SubjectsScreen extends StatefulWidget {
  final ThemeData theme;
  static var subjectsList = ["Data Bases", "Computer Graphics", "Quran 4"];

  SubjectsScreen({required this.theme});

  @override
  _SubjectsScreenState createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  var newSubjectName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => modalBottomSheet(context),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.vertical -
                    112,
                //the size of the scrolling column is all the screen height - vertical padding (height taken by system UI)
                //- 112 (56*2) appBar height + bottomNavigationBar height

                child: ListView(
                  children: SubjectsScreen.subjectsList
                      .map((e) => showSubjectCardToScreen(e))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addNewSubject(String subjectName) {
    setState(() {
      SubjectsScreen.subjectsList.add(subjectName);
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

  Widget showSubjectCardToScreen(e) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
            title: Text(
          e,
          style: const TextStyle(fontSize: 22),
        )),
      ),
    );
  }
}
