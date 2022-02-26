import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectDetails extends StatelessWidget {
  Subject subject;
  SubjectDetails({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
        actions: [
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onSelected: (value) {
                if (value == 1) {
                  showDeleteConfirmation(context);
                }
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text("delete this subject"),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text("test"),
                      value: 2,
                    )
                  ]),
        ],
      ),
    );
  }

  void showDeleteConfirmation(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('Are You sure you want to delete this subject'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Subject.deleteSubject(subject);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Delete')),
            ],
          );
        });
  }
}


// class MyApp extends StatefulWidget {
//   @override
//   _MyState createState() {
//     return _MyState();
//   }
// }
// class _MyState extends State<MyApp>
// {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           title: Text("Flutter Popup Menu Button"),
//           actions: [
//             PopupMenuButton(
//                 itemBuilder: (context) => [
//                   PopupMenuItem(
//                     child: Text("First"),
//                     value: 1,
//                   ),
//                   PopupMenuItem(
//                     child: Text("Second"),
//                     value: 2,
//                   )
//                 ]
//             )
//           ],
//         ),      
//       )
//     );
//   }
// }
