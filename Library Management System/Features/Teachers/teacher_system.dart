import '../../Functions/Teachers/login_screen.dart';
import '../../Functions/Universal Functions/credentials.dart';
import '../../Main File/main.dart';

class Teachers {
  static List<Map<String, dynamic>> teachersData = [
    {
      "Name": "Bilal Rehman",
      "ID": "210911",
      "Password": "!!@@##AA",
      "Subject": "Computer Science"
    },
    {
      "Name": "Asif",
      "ID": "211192",
      "Password": "!!()()SS",
      "Subject": "Geography"
    },
    {"Name": "Waqas", "ID": "213478", "Password": "QWERTY!", "Subject": "Urdu"},
    {
      "Name": "Taber",
      "ID": "218956",
      "Password": "English",
      "Subject": "Computer Science"
    }
  ];
  static var check;
  static startingScreen() {
    check = true;
    while (check) {
      TwoCredentialsMethod(
          title: "--------------------- Teachers Portal ----------------------",
          option1: "Login",
          option2: "Exit",
          case1: () {
            check = false;
            loginScreen();
          },
          case2: () {
            check = false;
            restartFromScrath = true;
          },
          defaultCase: () {
            check = true;
          });
    }
  }
}
