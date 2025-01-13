import '../Constants/restart_variables.dart';
import '../Features/Teachers/Login View/Views/teacher_login_view.dart';
import '../Services/credentials.dart';

void main() {
  HomeView();
}

void HomeView() {
  RestartVariables.restartFromScrath = true;
  while (RestartVariables.restartFromScrath) {
    TwoCredentialsMethod(
        title: "-------------------- Welcome to Library --------------------",
        option1: "Teacher",
        option2: "Student",
        case1: () {
          RestartVariables.restartFromScrath = false;
          loginViewTeacher();
        },
        case2: () {
          RestartVariables.restartFromScrath = false;
        },
        defaultCase: () {
          RestartVariables.restartFromScrath = true;
        });
  }
}
