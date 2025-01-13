import '../../../../Constants/restart_variables.dart';
import '../../../../Services/credentials.dart';
import 'student_login_view_model.dart';

loginViewTeacher() {
  RestartVariables.studentLoginCheckView = true;
  while (RestartVariables.studentLoginCheckView) {
    TwoCredentialsMethod(
      title: "--------------------- Student Portal ----------------------",
      option1: "Login",
      option2: "Exit",
      case1: () {
        RestartVariables.studentLoginCheckView = false;
        studentLoginScreen();
      },
      case2: () {
        RestartVariables.studentLoginCheckView = false;
        RestartVariables.restartFromScrath = true;
      },
      defaultCase: () {
        RestartVariables.studentLoginCheckView = true;
      },
    );
  }
}
