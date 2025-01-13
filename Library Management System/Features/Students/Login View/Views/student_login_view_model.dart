import 'dart:io';

import '../../../../Constants/global_variables.dart';
import '../../../../Constants/lists_databases.dart';
import '../../../../Constants/restart_variables.dart';
import '../../../../Services/credentials.dart';
import '../../Home View/Views/student_home_view.dart';

studentLoginScreen() {
  RestartVariables.studentLoginCheckViewModel = true;
  while (RestartVariables.studentLoginCheckViewModel) {
    print("------------------------- Login ----------------------------");
    stdout.write("Enter Your Student Roll No. : ");
    String studentRollNo = stdin.readLineSync()!;
    for (var data in Databases.studentsData) {
      if (studentRollNo == data["Roll No."]) {
        GlobalVariables.studentRollNo = studentRollNo;
        var correctPassword = false;
        while (correctPassword == false) {
          stdout.write("Enter Your Password: ");
          String enteredPassword = stdin.readLineSync()!;
          if (enteredPassword == data["Password"]) {
            correctPassword = true;
            RestartVariables.studentLoginCheckViewModel = false;
            studentPortalView();
          } else {
            var invalidPassword = true;
            while (invalidPassword) {
              print(
                  "------------------------------------------------------------");
              TwoCredentialsMethod(
                title: "Invalid Password. Please Select the Option: ",
                option1: "Re-Enter Password",
                option2: "Exit",
                case1: () {
                  invalidPassword = false;
                  correctPassword = false;
                  print(
                      "------------------------------------------------------------");
                },
                case2: () {
                  invalidPassword = false;
                  correctPassword = true;
                  RestartVariables.studentLoginCheckViewModel = false;
                  RestartVariables.restartFromScrath = true;
                  RestartVariables.studentLoginCheckView = false;
                },
                defaultCase: () {
                  invalidPassword = true;
                },
              );
            }
          }
        }
        break;
      } else {
        if (data == Databases.studentsData.last) {
          var invalidRollNo = true;
          while (invalidRollNo) {
            print(
                "------------------------------------------------------------");
            TwoCredentialsMethod(
                title: "Invalid Student Roll. Please Select the Option: ",
                option1: "Re-Enter Student Roll",
                option2: "Exit",
                case1: () {
                  RestartVariables.studentLoginCheckViewModel = true;
                  invalidRollNo = false;
                },
                case2: () {
                  invalidRollNo = false;
                  RestartVariables.studentLoginCheckViewModel = false;
                  RestartVariables.studentLoginCheckView = false;
                  RestartVariables.restartFromScrath = true;
                },
                defaultCase: () {
                  invalidRollNo = true;
                });
          }
        }
      }
    }
  }
}
