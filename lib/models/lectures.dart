class Lecture {
  String subject;
  String day;
  String time;
  String place;

  Lecture({
    required this.subject,
    required this.day,
    required this.time,
    required this.place,
  });

  static final lecturesList = [
    Lecture(
      subject: 'جرافيك حاسوب',
      day: 'الاحد',
      time: '12-2',
      place: 'A1-202',
    ),
    Lecture(
      subject: 'قواعد بيانات',
      day: 'الاثنين',
      time: '11-12',
      place: 'A1-302',
    )
  ];
}
