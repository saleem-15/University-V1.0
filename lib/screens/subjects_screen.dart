import 'package:flutter/material.dart';
import '../models/subject.dart';
import 'subject_details.dart';

class SubjectsScreen extends StatefulWidget {
  final ThemeData theme;

  const SubjectsScreen({Key? key, required this.theme}) : super(key: key);

  @override
  _SubjectsScreenState createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  var newSubjectName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Subjects'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => modalBottomSheet(context),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.vertical -
                    112,
                //the size of the scrolling column is all the screen height - vertical padding (height taken by system UI)
                //- 112 (56*2) appBar height + bottomNavigationBar height

                child: ListView(
                  children: Subject.subjectsList
                      .map((subject) => showSubjectCardToScreen(subject))
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
      Subject.subjectsList.add(Subject(name: subjectName));
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

  Widget showSubjectCardToScreen(Subject subject) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubjectDetails(
                        subject: subject,
                      )),
            ).then((value) {
              //this code [then(){...} ] makes sure when we get back to this page ,its refreshed
              setState(() {});
            });
          },
          title: Text(
            subject.name,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
