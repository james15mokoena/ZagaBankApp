import 'package:banking_mobile_app/routes/home_page.dart';
import 'package:banking_mobile_app/routes/login_page.dart';
import 'package:flutter/material.dart';

/// Handles the mapping of named routes to actual
/// pages.
class RouteGenerator {
  /// The page to be displayed when the app is launched.
  static const String loginPage = "/";

  /// The named route for the home page.
  static const String homePage = "/home";

  /// The named route for the reset card pin page.
  static const String resetCardPinPage = "/resetCardPin";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        throw RouteException("Invalid named route.");
    }
  }
}

/// When an invalid named route is provided, this exception get thrown.
class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
