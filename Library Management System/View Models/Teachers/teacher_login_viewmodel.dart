import 'dart:io';

import '../../Constants/lists_databases.dart';
import '../../Constants/restart_variables.dart';
import '../../Services/credentials.dart';
import '../../View/Teachers/teacher_portal_view.dart';

loginScreen() {
  RestartVariables.loginCheckViewModel = true;
  while (RestartVariables.loginCheckViewModel) {
    print("------------------------- Login ----------------------------");
    stdout.write("Enter Your Teacher ID: ");
    String teacherID = stdin.readLineSync()!;
    for (var data in Databases.teachersData) {
      if (teacherID == data["ID"]) {
        var correctPassword = false;
        while (correctPassword == false) {
          stdout.write("Enter Your Password: ");
          String enteredPassword = stdin.readLineSync()!;
          if (enteredPassword == data["Password"]) {
            correctPassword = true;
            RestartVariables.loginCheckViewModel = false;
            teacherPortalView();
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
                    RestartVariables.loginCheckViewModel = false;
                    RestartVariables.restartFromScrath = true;
                    RestartVariables.loginCheckView = false;
                  },
                  defaultCase: () {
                    invalidPassword = true;
                  });
            }
          }
        }
        break;
      } else {
        if (data == Databases.teachersData.last) {
          var invalidID = true;
          while (invalidID) {
            print(
                "------------------------------------------------------------");
            TwoCredentialsMethod(
                title: "Invalid Teacher ID. Please Select the Option: ",
                option1: "Re-Enter Teacher ID",
                option2: "Exit",
                case1: () {
                  RestartVariables.loginCheckViewModel = true;
                  invalidID = false;
                },
                case2: () {
                  invalidID = false;
                  RestartVariables.loginCheckViewModel = false;
                  RestartVariables.loginCheckView = false;
                  RestartVariables.restartFromScrath = true;
                },
                defaultCase: () {
                  invalidID = true;
                });
          }
        }
      }
    }
  }
}
