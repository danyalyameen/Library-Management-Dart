import '../Features/Students/student_system.dart';
import '../Features/Teachers/teacher_system.dart';
import '../Functions/Universal Functions/credentials.dart';

void main() {
  startingScreen();
}

late bool restartFromScrath;

void startingScreen() {
  restartFromScrath = true;
  while (restartFromScrath) {
    TwoCredentialsMethod(
        title: "-------------------- Welcome to Library --------------------",
        option1: "Teacher",
        option2: "Student",
        case1: () {
          restartFromScrath = false;
          Teachers.startingScreen();
        },
        case2: () {
          restartFromScrath = false;
          Students();
        },
        defaultCase: () {
          restartFromScrath = true;
        });
  }
}
