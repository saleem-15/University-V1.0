class Subject {
  static int _idNum = 0;
  late int id;
  String name;

  Subject({required this.name}) {
    id = _idNum; //each subject has unique id and its assigned automatically
    _idNum++;
  }

  static var subjectsList = [
    Subject(name: "Data Bases"),
    Subject(name: "Computer Graphics"),
    Subject(name: "Quran 4")
  ];

  static void deleteSubject(Subject subject) {
    subjectsList.remove(subject);
  }
}
