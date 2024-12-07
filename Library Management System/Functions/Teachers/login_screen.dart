import 'dart:io';

import '../../Features/Teachers/teacher_system.dart';
import '../../Main File/main.dart';
import '../Universal Functions/credentials.dart';
import 'home_screen.dart';

loginScreen() {
  var checkLogin = true;
  while (checkLogin) {
    print("------------------------- Login ----------------------------");
    stdout.write("Enter Your Teacher ID: ");
    String teacherID = stdin.readLineSync()!;
    for (var data in Teachers.teachersData) {
      if (teacherID == data["ID"]) {
        var correctPassword = false;
        while (correctPassword == false) {
          stdout.write("Enter Your Password: ");
          String enteredPassword = stdin.readLineSync()!;
          if (enteredPassword == data["Password"]) {
            correctPassword = true;
            checkLogin = false;
            homeScreen();
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
                    checkLogin = false;
                    restartFromScrath = true;
                    Teachers.check = false;
                  },
                  defaultCase: () {
                    invalidPassword = true;
                  });
            }
          }
        }
        break;
      } else {
        if (data == Teachers.teachersData.last) {
          var invalidID = true;
          while (invalidID) {
            print(
                "------------------------------------------------------------");
            TwoCredentialsMethod(
                title: "Invalid Teacher ID. Please Select the Option: ",
                option1: "Re-Enter Teacher ID",
                option2: "Exit",
                case1: () {
                  checkLogin = true;
                  invalidID = false;
                },
                case2: () {
                  invalidID = false;
                  checkLogin = false;
                  Teachers.check = false;
                  restartFromScrath = true;
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
