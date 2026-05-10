import 'package:flutter/widgets.dart';

/// Encapsulates the user's login details.
class LoginModel {
  // The user's email and password.
  String? _email;
  String? _password;

  LoginModel({String? email, String? password})
    : _email = email,
      _password = password;

  // getters
  String? get email => _email;

  String? get password => _password;

  // utilities

  /// Given the `email`, it checks if the `email` is valid; if it is
  /// it returns `null`, otherwise an error message.
  String? validateEmail(String? email) {
    if (email != null && email.isNotEmpty && email.length <= 50) {
      if (email.contains("@") &&
          email.indexOf("@") > 0 &&
          email.indexOf("@") < email.length - 1) {
        return null;
      } else {
        return "Invalid email format";
      }
    } else {
      return "Enter valid email.";
    }
  }

  /// Give the user's `password`, its checks if its within the allowed length and
  /// not null or empty.
  String? validatePassword(String? password) {
    if (password != null && password.isNotEmpty && password.length <= 50) {
      return null;
    } else {
      return "Invalid password";
    }
  }

  /// If the user provides a valid `email` and their `password`, it stores them
  /// in this `LoginModel`.
  bool login(GlobalKey<FormState> key, String email, String password) {
    if (key.currentState?.validate() == true) {
      _email = email;
      _password = password;
      return true;
    }
    return false;
  }
}
