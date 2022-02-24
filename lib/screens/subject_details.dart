import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/subject.dart';

class SubjectDetails extends StatelessWidget {
  Subject subject;
  SubjectDetails({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("delete this subject"),
                      value: 1,
                      onTap: () {
                        Subject.deleteSubject(subject);
                        Navigator.of(context).pop();
                      },
                    ),
                    const PopupMenuItem(
                      child: Text("Second"),
                      value: 2,
                    )
                  ]),
        ],
      ),
      body: Container(),
    );
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
