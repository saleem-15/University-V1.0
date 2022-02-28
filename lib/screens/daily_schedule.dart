import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../models/lectures.dart';

class DailySchedule extends StatelessWidget {
  List<Lecture> todayLectures = [];

  DailySchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateTodayLectures();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Schedule'),
        // actions: [
        //   PopupMenuButton(
        //       onSelected: (value) {
        //         if (value == 1) {
        //           // showDeleteLectureDialog(context);
        //         }
        //       },
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(10)),
        //       itemBuilder: (ctx) => [
        //             const PopupMenuItem(
        //               child: Text('System default'),
        //               value: 1,
        //             ),
        //             const PopupMenuItem(
        //               child: Text('Light theme'),
        //               value: 1,
        //             ),
        //             const PopupMenuItem(
        //               child: Text('Dark theme'),
        //               value: 1,
        //             ),
        //           ]),
        // ],
      ),
      body: todayLectures.isEmpty
          ? Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 100)),
                Image.asset('lib/assests/output-onlinejpgtools.png'),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'You dont have any lectures today!',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.cover,
                    child: DataTable(
                      columns: const [
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
                      rows: todayLectures.map((e) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                e.place,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            DataCell(
                              Text(
                                e.subject,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            DataCell(
                              Text(
                                '${e.startingTime}-${e.endingTime}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            DataCell(
                              Text(
                                e.day,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void calculateTodayLectures() {
    var currentDay = DateTime.now().weekday;

    todayLectures.clear(); // clear the list of the lectures

    for (var lecuture in Lecture.lecturesList) {
      //add today's lectures to the list
      if (lecuture.dayNum == currentDay) {
        todayLectures.add(lecuture);
      }
    }
  }
}
