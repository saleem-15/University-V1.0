import 'package:flutter/material.dart';
import '../models/lectures.dart';

class DailySchedule extends StatelessWidget {
  List<Lecture> todayLectures = [];

  @override
  Widget build(BuildContext context) {
    return todayLectures.isEmpty
        ? const Text('There is no lectures today')
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
          );
  }

  void calculateTodayLectures() {
    var currentDay = DateTime.now().weekday;

    for (var lecuture in Lecture.lecturesList) {
      if (lecuture.dayNum == currentDay) {
        todayLectures.add(lecuture);
      }
    }
  }
}
