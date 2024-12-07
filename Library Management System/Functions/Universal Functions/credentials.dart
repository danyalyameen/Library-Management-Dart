import 'dart:io';

bool restartCredential = true;

TwoCredentialsMethod(
    {required String title,
    required String option1,
    required String option2,
    required Function case1,
    required Function case2,
    required Function defaultCase}) {
  print("$title");
  print("1. $option1");
  print("2. $option2");
  // Take Input from the User
  stdout.write("Enter: ");
  String enteredNumber = stdin.readLineSync()!;
  switch (enteredNumber) {
    case "1":
      case1();
      break;
    case "2":
      case2();
      break;
    default:
      defaultCase();
  }
}
