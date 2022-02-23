// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/lectures.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: DataTable(
            columns: [
              DataColumn(
                  label: Text(
                'القاعة',
                style: TextStyle(fontSize: 22),
              )),
              DataColumn(
                  label: Text(
                'المادة',
                style: TextStyle(fontSize: 22),
              )),
              DataColumn(
                  label: Text(
                'الموعد',
                style: TextStyle(fontSize: 22),
              )),
              DataColumn(
                label: Text(
                  'اليوم',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(
                      'A1-305',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  DataCell(
                    Text(
                      'جرافيك حاسوب',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  DataCell(
                    Text(
                      '11-10',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  DataCell(
                    Text(
                      'السبت',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => showAddNewSubjectDialog(context),
          child: Text('أضف موعد جديد'),
        ),
      ],
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

  String? dropdownValue = 'السيت';
  final days = ['السيت', 'الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس'];

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
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'المادة',
                          icon: Icon(Icons.library_books_rounded),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, left: 10),
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
                            value: dropdownValue,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) => setState(() {
                              dropdownValue = newValue;
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
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'الساعة',
                          icon: Icon(Icons.access_time_filled_sharp),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'القاعة',
                          icon: Icon(Icons.place),
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
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
}
