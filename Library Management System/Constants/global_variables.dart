import 'lists_databases.dart';

class GlobalVariables {
  static late String teacherID;
  static late String studentRollNo;
  static int teacherIndex = Databases.teachersData.indexWhere(
    (element) => element["ID"] == GlobalVariables.studentRollNo,
  );
  static int studentIndex = Databases.studentsData.indexWhere(
    (element) => element["Roll No."] == GlobalVariables.studentRollNo,
  );
}