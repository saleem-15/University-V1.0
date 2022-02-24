// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import '../models/lectures.dart';
import 'subjects_screen.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    'القاعة',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'المادة',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'الموعد',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'اليوم',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ],
              rows: Lecture.lecturesList.map((e) {
                return DataRow(
                  onLongPress: () {},
                  cells: <DataCell>[
                    DataCell(
                      Text(
                        e.place,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    DataCell(
                      Text(
                        e.subject,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    DataCell(
                      Text(
                        '${e.startingTime}-${e.endingTime}',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    DataCell(
                      Text(
                        e.day,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () => showAddNewSubjectDialog(context),
                child: Text('أضف موعد جديد'),
              ),
              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Hi Codesinsider !!",
                    toastLength: Toast.LENGTH_LONG,
                    //backgroundColor: Color.fromARGB(255, 241, 48, 48),
                    //fontSize: 20
                  );
                },
                child: Text('احذف موعد'),
              ),
            ],
          ),
        ],
      ),
    );
    // Table(
    //   border: TableBorder.all(),
    //   children: [
    //     TableRow(children: [
    //       Column(
    //         children: const [Text('Day')], //the name of the day is in a column
    //       ),
    //       Column(
    //         // the time and date of the lectures is stored as (Column of Rows)
    //         children: [
    //           Row(
    //             children: [Text('Date'), Text('subjectName'), Text('place')],
    //           ),
    //         ],
    //       )
    //     ])
    //   ],
    // );
  }

  String dropdownDay = 'السبت';
  String dropdownSubject = SubjectsScreen.subjectsList[0];
  String dropDownStartingTime = startingTime[0];
  String dropDownEndingTime = endingTime[0];

  final days = ['السبت', 'الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس'];
  static const startingTime = ['8', '9', '10', '11', '12', '1', '2'];
  static const endingTime = ['9', '10', '11', '12', '1', '2', '3'];

  var subjectInput = TextEditingController();
  var placeInput = TextEditingController();
  var startingTimeInput = TextEditingController();
  var endingTimeInput = TextEditingController();

  void showAddNewSubjectDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'أضف موعد جديد',
              textDirection: TextDirection.rtl,
            ),
            content: StatefulBuilder(
              builder: (ctx, setState) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, bottom: 5),
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(ctx).primaryColor,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            value: dropdownSubject,
                            elevation: 16,
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) => setState(() {
                              dropdownSubject = newValue!;
                            }),
                            items:
                                SubjectsScreen.subjectsList.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(ctx).primaryColor,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            value: dropdownDay,
                            elevation: 16,
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) => setState(() {
                              dropdownDay = newValue!;
                            }),
                            items: days.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              height: 45,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Theme.of(ctx).primaryColor,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text('الى'),
                                  isExpanded: true,
                                  value: dropDownEndingTime,
                                  elevation: 16,
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) => setState(() {
                                    dropDownEndingTime = newValue!;
                                  }),
                                  items: endingTime.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              height: 45,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Theme.of(ctx).primaryColor,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropDownStartingTime,
                                  elevation: 16,
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) => setState(() {
                                    dropDownStartingTime = newValue!;
                                  }),
                                  items: startingTime.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          // Flexible(
                          //   flex: 1,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(right: 4),
                          //     child: DropdownButton(
                          //       child: TextFormField(
                          //         controller: endingTimeInput,
                          //         keyboardType: TextInputType.number,
                          //         decoration: InputDecoration(
                          //           labelText: 'الى',
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Flexible(
                          //   flex: 1,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 4),
                          //     child: DropdownButton<String>(
                          //       child: TextFormField(
                          //         controller: startingTimeInput,
                          //         keyboardType: TextInputType.number,
                          //         decoration: InputDecoration(
                          //           labelText: 'من',
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      TextFormField(
                        controller: placeInput,
                        decoration: InputDecoration(
                          labelText: 'القاعة',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  if (int.parse(dropDownStartingTime) >=
                      int.parse(dropDownEndingTime)) {
                    Fluttertoast.showToast(
                      msg: "يجب ان تكون نهاية الوقت اكبر من بدايته!!",
                      toastLength: Toast.LENGTH_LONG,
                    );

                    return;
                  }

                  if (placeInput.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: "حدد القاعة !!",
                      toastLength: Toast.LENGTH_LONG,
                    );

                    return;
                  }
                  Lecture.lecturesList.add(
                    Lecture(
                      subject: dropdownSubject,
                      day: dropdownDay,
                      startingTime: dropDownStartingTime,
                      endingTime: dropDownEndingTime,
                      place: placeInput.text,
                    ),
                  );
                  Lecture.sortLecturesList();
                  // ignore: unnecessary_this
                  this.setState(
                      () {}); // this setState is to refresh the schedule screen when a new lecture is added

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
