import 'dart:io';

import '../../../../Constants/global_variables.dart';
import '../../../../Constants/lists_databases.dart';
import '../../../../Constants/restart_variables.dart';

int studentIndex = Databases.studentsData.indexWhere(
  (element) => element["Roll No."] == GlobalVariables.studentRollNo,
);

studentPortalViewModel({required String inputNum}) {
  switch (inputNum) {
    case "1":
      account();
      break;
    case "2":
      borrowedBooks();
      break;
    case "3":
      returnedBooks();
      break;
    case "4":
      logout();
      break;
    default:
  }
}

account() {
  bool validNumber = true;
  while (validNumber) {
    print("------------------ Account System ------------------");
    print("1. Account Details");
    print("2. Edit Account Details");
    print("3. Exit");
    stdout.write("Enter a Number: ");
    String inputNum = stdin.readLineSync()!;
    switch (inputNum) {
      case "1":
        accountDetails();
        break;
      case "2":
        editAccountDetails();
        break;
      case "3":
        validNumber = false;
        break;
      default:
    }
  }
}

accountDetails() {
  print("--------------------------------------------------------------");
  print("Roll No. : ${Databases.studentsData[studentIndex]["Roll No."]}");
  print(
      "Student Name: ${Databases.studentsData[studentIndex]["Student Name"]}");
  print("Password: ${Databases.studentsData[studentIndex]["Password"]}");
  print("--------------------------------------------------------------");
}

editAccountDetails() {
  bool validNumber = true;
  while (validNumber) {
    print("------------------ Update Account ------------------");
    print("1. Update Name");
    print("2. Update Password");
    print("3. Exit");
    stdout.write("Enter a Number: ");
    String inputNum = stdin.readLineSync()!;
    switch (inputNum) {
      case "1":
        updateName();
        break;
      case "2":
        updatePassword();
        break;
      case "3":
        validNumber = false;
        break;
      default:
    }
  }
}

updateName() {
  var nameIsEmpty = true;
  while (nameIsEmpty) {
    stdout.write("Enter New Name : ");
    String studentName = stdin.readLineSync()!;
    if (studentName.isNotEmpty) {
      nameIsEmpty = false;
      Databases.studentsData[studentIndex]["Student Name"] = studentName;
    } else {
      print("-----------------");
      print("Please Enter Name");
      print("-----------------");
      nameIsEmpty = true;
    }
  }
}

updatePassword() {
  var passwordIsEmpty = true;
  while (passwordIsEmpty) {
    stdout.write("Enter New Password : ");
    String studentPassword = stdin.readLineSync()!;
    if (studentPassword.isNotEmpty) {
      if (studentPassword.length < 8) {
        print("--------------------------------------");
        print("Password Must be at least 8 Characters");
        print("--------------------------------------");
        passwordIsEmpty = true;
      } else {
        passwordIsEmpty = false;
        Databases.studentsData[studentIndex]["Password"] = studentPassword;
      }
    } else {
      print("-----------------");
      print("Please Enter Password");
      print("-----------------");
      passwordIsEmpty = true;
    }
  }
}

borrowedBooks() {
  bool validNumber = true;
  while (validNumber) {
    print("------------------ Borrowed Books System ------------------");
    print("1. Check Borrowed Books");
    print("2. Borrow a Book");
    print("3. Exit");
    stdout.write("Enter a Number: ");
    String inputNum = stdin.readLineSync()!;
    switch (inputNum) {
      case "1":
        checkBorrowedBooks();
        break;
      case "2":
        borrowABook();
        break;
      case "3":
        validNumber = false;
        break;
      default:
    }
  }
}

checkBorrowedBooks() {
  if (Databases.studentsData[studentIndex]["Borrowed Books"].isEmpty) {
    print("-----------------");
    print("No Borrowed Books");
    print("-----------------");
    return;
  }
  for (var borrowedBooks in Databases.studentsData[studentIndex]
      ["Borrowed Books"]) {
    print("---------------------------------");
    print("Book Name: ${borrowedBooks["title"]}");
    print("Author Name: ${borrowedBooks["author"]}");
    print("Genre: ${borrowedBooks["genre"]}");
    print("---------------------------------");
  }
}

borrowABook() {
  var bookNameIsEmpty = true;
  while (bookNameIsEmpty) {
    stdout.write("Enter Book Name : ");
    String bookName = stdin.readLineSync()!;
    if (bookName.isNotEmpty) {
      bookNameIsEmpty = false;
      bool bookExist = Databases.books.any(
        (element) => element["title"] == bookName,
      );
      int bookIndex = Databases.books.indexWhere(
        (element) => element["title"] == bookName,
      );
      bool bookAlreadyAddedInBorrowed = Databases.studentsData[studentIndex]
              ["Borrowed Books"]
          .any((element) => element["title"] == bookName);
      if (bookExist && !bookAlreadyAddedInBorrowed) {
        Databases.studentsData[studentIndex]["Borrowed Books"].add(
          Databases.books[bookIndex],
        );
        print("-------------------------");
        print("Borrow Book Successfully!");
        print("-------------------------");
      } else if (!bookExist) {
        print("----------------------------");
        print("No Book Found with that Name");
        print("----------------------------");
        bookNameIsEmpty = true;
      } else if (bookAlreadyAddedInBorrowed) {
        print("------------------------");
        print("Book is Already Borrowed");
        print("------------------------");
        bookNameIsEmpty = true;
      }
    } else {
      print("----------------------");
      print("Please Enter Book Name");
      print("----------------------");
      bookNameIsEmpty = true;
    }
  }
}

returnedBooks() {
  bool validNumber = true;
  while (validNumber) {
    print("------------------ Returned Books System ------------------");
    print("1. Check Returned Books");
    print("2. Return a Book");
    print("3. Exit");
    stdout.write("Enter a Number: ");
    String inputNum = stdin.readLineSync()!;
    switch (inputNum) {
      case "1":
        checkReturnedBooks();
        break;
      case "2":
        returnABook();
        break;
      case "3":
        validNumber = false;
        break;
      default:
    }
  }
}

checkReturnedBooks() {
  for (var returnedBooks in Databases.studentsData[studentIndex]
      ["Returned Books"]) {
    print("---------------------------------");
    print("Book Name: ${returnedBooks["title"]}");
    print("Author Name: ${returnedBooks["author"]}");
    print("Genre: ${returnedBooks["genre"]}");
    print("---------------------------------");
  }
}

returnABook() {
  var bookNameIsEmpty = true;
  while (bookNameIsEmpty) {
    stdout.write("Enter Book Name : ");
    String bookName = stdin.readLineSync()!;
    if (bookName.isNotEmpty) {
      bookNameIsEmpty = false;
      bool bookExistInBorrowedBooks =
          Databases.studentsData[studentIndex]["Borrowed Books"].any(
        (element) => element["title"] == bookName,
      );
      int bookIndex =
          Databases.studentsData[studentIndex]["Borrowed Books"].indexWhere(
        (element) => element["title"] == bookName,
      );
      if (bookExistInBorrowedBooks) {
        Databases.studentsData[studentIndex]["Returned Books"].add(
          Databases.studentsData[studentIndex]["Borrowed Books"][bookIndex],
        );
        Databases.studentsData[studentIndex]["Borrowed Books"]
            .removeAt(bookIndex);
        print("-------------------------");
        print("Return Book Successfully!");
        print("-------------------------");
      } else {
        print("----------------------------");
        print("No Book Found with that Name in Borrowed Books");
        print("----------------------------");
        bookNameIsEmpty = true;
      }
    } else {
      print("----------------------");
      print("Please Enter Book Name");
      print("----------------------");
      bookNameIsEmpty = true;
    }
  }
}

logout() {
  RestartVariables.portalViewCheck = false;
  RestartVariables.loginCheckView = false;
  RestartVariables.restartFromScrath = true;
}
