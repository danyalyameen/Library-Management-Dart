import '../../Functions/Teachers/login_screen.dart';
import '../../Functions/Universal Functions/credentials.dart';

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
    TwoCredentialsMethod(
        title: "--------------------- Teachers Portal ----------------------",
        option1: "Login",
        option2: "Exit",
        restart: check,
        case1: () {
          check = false;
          loginScreen();
        },
        case2: () {
          check = false;
        });

    check = true;
  }
}
