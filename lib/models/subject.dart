//you have to import this to be able to store the class in hive

import 'package:hive/hive.dart';
import 'package:university/main.dart';
import '../main.dart';

/*
to store any kind of objects you need to write in the file (part 'file_name.g.dart')  
  the file that has the class that we want to save its data */
part 'subject.g.dart';

@HiveType(typeId: 2)
class Subject extends HiveObject {
  @HiveField(1)
  late int id;
  // id is important when Adding, Updating the subject

  @HiveField(2)
  String name;

  static Box<Subject> get subjectsBox {
    return Hive.box<Subject>(subjectBoxName);
  }

  Subject({required this.name}) {
    //id = Random(3).nextInt(1000);

    id = subjectsBox.values.toList().length + 1;
  }

  static void addSubject(Subject subject) {
    subjectsBox.put(subject.id, subject);
  }

  static void deleteSubject(Subject subject) {
    subject.delete();
  }

  static void updateSubject(Subject subject) {
    subjectsBox.put(subject.id, subject);
  }
}
