import '../Constants/restart_variables.dart';
import '../View/Students/student_home_view.dart';
import '../View/Teachers/teacher_home_view.dart';
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
          Teachers.startingScreenTeacher();
        },
        case2: () {
          RestartVariables.restartFromScrath = false;
          Students();
        },
        defaultCase: () {
          RestartVariables.restartFromScrath = true;
        });
  }
}
