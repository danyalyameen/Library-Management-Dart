import 'dart:io';

import '../../Constants/restart_variables.dart';
import '../../View Models/Teachers/teacher_portal_viewmodel.dart';

teacherPortalView() {
  RestartVariables.portalViewCheck = true;
  while (RestartVariables.portalViewCheck) {
    print("------------------ Welcome to Home Screen ------------------");
    print("1. Register a Student");
    print("2. Add Books");
    print("3. Remove Books");
    print("4. Borrowed Books");
    print("5. Returned Books");
    stdout.write("Enter a Number: ");
    String inputNum = stdin.readLineSync()!;
    portalViewModel(inputNum: inputNum);
  }
}
