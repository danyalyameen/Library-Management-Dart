import 'dart:io';

import '../../../../Constants/restart_variables.dart';
import 'teacher_home_view_model.dart';

teacherPortalView() {
  RestartVariables.portalViewCheck = true;
  while (RestartVariables.portalViewCheck) {
    print("------------------ Welcome to Home Screen ------------------");
    print("1. Account");
    print("2. Register a Student");
    print("3. View Books");
    print("4. Add Book");
    print("5. Remove Book");
    print("6. Borrowed Books");
    print("7. Returned Books");
    print("8. Logout");
    stdout.write("Enter a Number: ");
    String inputNum = stdin.readLineSync()!;
    portalViewModel(inputNum: inputNum);
  }
}
