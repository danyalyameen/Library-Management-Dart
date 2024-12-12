import '../../Constants/restart_variables.dart';
import '../../Services/credentials.dart';
import '../../View Models/Teachers/teacher_login_viewmodel.dart';

loginViewTeacher() {
  RestartVariables.loginCheckView = true;
  while (RestartVariables.loginCheckView) {
    TwoCredentialsMethod(
      title: "--------------------- Teachers Portal ----------------------",
      option1: "Login",
      option2: "Exit",
      case1: () {
        RestartVariables.loginCheckView = false;
        loginScreen();
      },
      case2: () {
        RestartVariables.loginCheckView = false;
        RestartVariables.restartFromScrath = true;
      },
      defaultCase: () {
        RestartVariables.loginCheckView = true;
      },
    );
  }
}
