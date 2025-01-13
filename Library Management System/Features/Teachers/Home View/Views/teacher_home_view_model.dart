import 'dart:io';

import '../../../../Constants/global_variables.dart';
import '../../../../Constants/lists_databases.dart';
import '../../../../Constants/restart_variables.dart';
import '../../../../Services/credentials.dart';

portalViewModel({required String inputNum}) {
  switch (inputNum) {
    case "1":
      registerStudent();
      break;
    case "2":
      viewBooks();
      break;
    case "3":
      addBooks();
      break;
    case "4":
      removeBook();
      break;
    case "5":
      borrowedBooks();
      break;
    case "6":
      returnedBooks();
      break;
    case "7":
      logout();
      break;
    default:
  }
}

registerStudent() {
  print("-------------- Welcome to Student Registration -------------");
  RestartVariables.rollNoRetryCheck = true;
  while (RestartVariables.rollNoRetryCheck) {
    stdout.write("Enter Student Roll No. : ");
    String studentRollNo = stdin.readLineSync()!;
    if (studentRollNo.isNotEmpty) {
      for (int i = 0; i < Databases.studentsData.length; i++) {
        if (studentRollNo == Databases.studentsData[i]["Roll No."]) {
          var isInvalidOption = true;
          while (isInvalidOption) {
            print("-------------------------------------------------");
            TwoCredentialsMethod(
              title: "This Roll Number Already Exists. Try Another One.",
              option1: "Re-Enter Roll No.",
              option2: "Exit",
              case1: () {
                RestartVariables.rollNoRetryCheck = true;
                isInvalidOption = false;
              },
              case2: () {
                isInvalidOption = false;
                RestartVariables.rollNoRetryCheck = false;
                RestartVariables.portalViewCheck = true;
              },
              defaultCase: () {
                print("----------------------------");
                print("Please enter a valid number.");
                print("----------------------------");
                isInvalidOption = true;
              },
            );
            print("-------------------------------------------------");
          }
          break;
        } else {
          if (Databases.studentsData[i] == Databases.studentsData.last) {
            var nameIsEmpty = true;
            while (nameIsEmpty) {
              stdout.write("Enter Student Name : ");
              String studentName = stdin.readLineSync()!;
              if (studentName.isNotEmpty) {
                nameIsEmpty = false;
                RestartVariables.checkStudentRegistrationPassword = true;
                while (RestartVariables.checkStudentRegistrationPassword) {
                  stdout.write("Create Password : ");
                  String studentPassword = stdin.readLineSync()!;
                  if (studentPassword.length < 8) {
                    print("--------------------------------------");
                    print("Password Must be at least 8 Characters");
                    print("--------------------------------------");
                    RestartVariables.checkStudentRegistrationPassword = true;
                  } else {
                    Databases.studentsData.add(
                      {
                        "Roll No.": studentRollNo,
                        "Student Name": studentName,
                        "Password": studentPassword,
                      },
                    );
                    print("-------------------------------");
                    print("Student Registered Successfully");
                    print("-------------------------------");
                    RestartVariables.checkStudentRegistrationPassword = false;
                    RestartVariables.rollNoRetryCheck = false;
                    RestartVariables.portalViewCheck = true;
                  }
                }
              } else {
                print("-----------------");
                print("Please Enter Name");
                print("-----------------");
                nameIsEmpty = true;
              }
            }
            break;
          }
        }
      }
    } else {
      print("---------------------");
      print("Please Enter Roll No.");
      print("---------------------");
      RestartVariables.rollNoRetryCheck = true;
    }
  }
}

viewBooks() {
  for (var element in Databases.books) {
    print("---------------------------------");
    print("Book Name: ${element["title"]}");
    print("Author Name: ${element["author"]}");
    print("Genre: ${element["genre"]}");
    print("---------------------------------");
  }
}

addBooks() {
  print("-------------- Welcome to Library -------------");
  var bookNameIsEmpty = true;
  while (bookNameIsEmpty) {
    stdout.write("Enter Book Name : ");
    String bookName = stdin.readLineSync()!;
    if (bookName.isNotEmpty) {
      bookNameIsEmpty = false;
      for (int i = 0; i < Databases.books.length; i++) {
        if (bookName == Databases.books[i]["title"]) {
          var isInvalidOption = true;
          while (isInvalidOption) {
            print("-------------------------------------------------");
            TwoCredentialsMethod(
              title: "This Book Already Exists. Try Another One.",
              option1: "Re-Enter Book Name",
              option2: "Exit",
              case1: () {
                bookNameIsEmpty = true;
                isInvalidOption = false;
              },
              case2: () {
                isInvalidOption = false;
                bookNameIsEmpty = false;
                RestartVariables.portalViewCheck = true;
              },
              defaultCase: () {
                print("----------------------------");
                print("Please enter a valid number.");
                print("----------------------------");
                isInvalidOption = true;
              },
            );
            print("-------------------------------------------------");
          }
          break;
        } else {
          if (Databases.books[i] == Databases.books.last) {
            var authorIsEmpty = true;
            while (authorIsEmpty) {
              stdout.write("Enter Author Name : ");
              String authorName = stdin.readLineSync()!;
              if (authorName.isNotEmpty) {
                authorIsEmpty = false;
                var genreIsEmpty = true;
                while (genreIsEmpty) {
                  stdout.write("Enter Genre : ");
                  String genre = stdin.readLineSync()!;
                  if (genre.isEmpty) {
                    print("------------------");
                    print("Please Enter Genre");
                    print("------------------");
                    genreIsEmpty = true;
                  } else {
                    Databases.books.add(
                      {
                        "title": bookName,
                        "author": authorName,
                        "genre": genre,
                      },
                    );
                    print("------------------------");
                    print("Boook Added Successfully");
                    print("------------------------");
                    genreIsEmpty = false;
                    RestartVariables.portalViewCheck = true;
                  }
                }
              } else {
                print("-----------------");
                print("Please Enter Author Name");
                print("-----------------");
                authorIsEmpty = true;
              }
            }
            break;
          }
        }
      }
    } else {
      print("----------------------");
      print("Please Enter Book Name");
      print("----------------------");
      bookNameIsEmpty = true;
    }
  }
}

removeBook() {
  bool bookRemovedSuccessfully = false;
  while (!bookRemovedSuccessfully) {
    stdout.write("Enter Book Name: ");
    String bookName = stdin.readLineSync()!;
    if (bookName.isNotEmpty) {
      for (var element in Databases.books) {
        if (bookName == element["title"]) {
          Databases.books.removeWhere(
            (i) {
              return i["title"] == bookName;
            },
          );
          bookRemovedSuccessfully = true;
          print("--------------------------");
          print("Book Removed Successfully!");
          print("--------------------------");
          break;
        } else {
          if (element == Databases.books.last) {
            print("----------------------------------------------");
            print("Book Not Found. Please Enter a valid Book Name");
            print("----------------------------------------------");
          }
        }
      }
    } else {
      print("----------------------");
      print("Please Enter Book Name");
      print("----------------------");
      bookRemovedSuccessfully = false;
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
  int index = Databases.teachersData.indexWhere(
    (element) => element["ID"] == GlobalVariables.teacherID,
  );
  if (Databases.teachersData[index]["Borrowed Books"].isEmpty) {
    print("-----------------");
    print("No Borrowed Books");
    print("-----------------");
    return;
  }
  for (var borrowedBooks in Databases.teachersData[index]["Borrowed Books"]) {
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
      int teacherIndex = Databases.teachersData.indexWhere(
        (element) => element["ID"] == GlobalVariables.teacherID,
      );
      bool bookExist = Databases.books.any(
        (element) => element["title"] == bookName,
      );
      bool bookAlreadyAddedInBorrowed = Databases.teachersData[teacherIndex]
              ["Borrowed Books"]
          .any((element) => element["title"] == bookName);
      int bookIndex = Databases.books.indexWhere(
        (element) => element["title"] == bookName,
      );
      if (bookExist && !bookAlreadyAddedInBorrowed) {
        Databases.teachersData[teacherIndex]["Borrowed Books"].add(
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
  int index = Databases.teachersData.indexWhere(
    (element) => element["ID"] == GlobalVariables.teacherID,
  );
  for (var returnedBooks in Databases.teachersData[index]["Returned Books"]) {
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
      int teacherIndex = Databases.teachersData.indexWhere(
        (element) => element["ID"] == GlobalVariables.teacherID,
      );
      bool bookExistInBorrowedBooks =
          Databases.teachersData[teacherIndex]["Borrowed Books"].any(
        (element) => element["title"] == bookName,
      );
      int bookIndex =
          Databases.teachersData[teacherIndex]["Borrowed Books"].indexWhere(
        (element) => element["title"] == bookName,
      );
      if (bookExistInBorrowedBooks) {
        Databases.teachersData[teacherIndex]["Returned Books"].add(
          Databases.teachersData[teacherIndex]["Borrowed Books"][bookIndex],
        );
        Databases.teachersData[teacherIndex]["Borrowed Books"]
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
