import 'dart:io';

import '../../../../Constants/restart_variables.dart';
import 'teacher_home_view_model.dart';

teacherPortalView() {
  RestartVariables.portalViewCheck = true;
  while (RestartVariables.portalViewCheck) {
    print("------------------ Welcome to Home Screen ------------------");
    print("1. Register a Student");
    print("2. View Books");
    print("3. Add Book");
    print("4. Remove Book");
    print("5. Borrowed Books");
    print("6. Returned Books");
    print("7. Logout");
    stdout.write("Enter a Number: ");
    String inputNum = stdin.readLineSync()!;
    portalViewModel(inputNum: inputNum);
  }
}
