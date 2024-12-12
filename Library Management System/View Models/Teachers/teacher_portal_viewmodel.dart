import 'dart:io';

import '../../Constants/lists_databases.dart';
import '../../Constants/restart_variables.dart';
import '../../Services/credentials.dart';

portalViewModel({required String inputNum}) {
  switch (inputNum) {
    case "1":
      registerStudent();
      break;
    case "2":
      // addBooks();
      break;
    case "3":
      // removeBooks();
      break;
    case "4":
      // borrowedBooks();
      break;
    case "5":
      // returnedBooks();
      break;
    default:
  }
}

registerStudent() {
  print("-------------- Welcome to Student Registration -------------");
  RestartVariables.rollNoRetryCheck = true;
  while (RestartVariables.rollNoRetryCheck) {
    stdout.write("Enter Student Roll No. : ");
    String studentRollNo = stdin.readLineSync()!;
    for (var element in Databases.studentsData) {
      if (studentRollNo != element["Roll No."]) {
      } else {
        if (element == Databases.studentsData.last) {
          TwoCredentialsMethod(
            title: "This Roll Number Already Exists. Try Another One.",
            option1: "Re-Enter Roll No.",
            option2: "Exit",
            case1: () {
              RestartVariables.rollNoRetryCheck = true;
            },
            case2: () {
              RestartVariables.rollNoRetryCheck = false;
              RestartVariables.portalViewCheck = true;
            },
            defaultCase: () {},
          );
        } else {}
      }
    }
  }
}
