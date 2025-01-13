import 'dart:io';

import '../../../../Constants/restart_variables.dart';
import 'student_home_view_model.dart';

studentPortalView() {
  RestartVariables.portalViewCheck = true;
  while (RestartVariables.portalViewCheck) {
    print("------------------ Welcome to Home Screen ------------------");
    print("1. Account");
    print("2. Borrowed Books");
    print("3. Returned Books");
    print("4. Logout");
    stdout.write("Enter a Number: ");
    String inputNum = stdin.readLineSync()!;
    studentPortalViewModel(inputNum: inputNum);
  }
}
