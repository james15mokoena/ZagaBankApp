import 'package:banking_mobile_app/models/dto/login_dto.dart';
import 'package:banking_mobile_app/services/login_service.dart';
import 'package:flutter/widgets.dart';

/// Encapsulates the user's login details.
///
/// The business logic for the LoginForm widget.
class LoginModel {
  // The user's email and password.
  String? _email;
  String? _password;
  bool _isLoggedIn = false;

  LoginModel({String? email, String? password})
    : _email = email,
      _password = password;

  // getters
  String? get email => _email;

  String? get password => _password;

  bool get isLoggedIn => _isLoggedIn;

  /// Invalidates the user's login details when they log out.
  void invalidate(BuildContext context) {
    _email = null;
    _password = null;
    while (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

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
  Future<void> login(
    GlobalKey<FormState> key,
    String email,
    String password,
  ) async {
    //

    if (key.currentState?.validate() == true) {
      _email = email;
      _password = password;

      _isLoggedIn = await LoginService.login(
        LoginDto.fromJson({"email": _email, "password": _password}),
      );
    }
  }
}
