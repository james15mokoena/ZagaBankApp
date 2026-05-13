import 'dart:convert';

import 'package:banking_mobile_app/models/dto/login_dto.dart';
import 'package:banking_mobile_app/services/server_service.dart';
import 'package:http/http.dart' as http;

/// The app uses it to send HTTP requests to the server that are related to
/// user authentication.
class LoginService {
  //

  /// Verifies login details when user is attempting to login.
  static Future<bool> login(LoginDto details) async {
    //

    http.Response resp = await http.post(
      Uri.parse("${ServerService.serverIpAddress}/Login/Login"),
      headers: {"Content-Type": "application/json"},
      encoding: Encoding.getByName("utf-8"),
      body: jsonEncode(details),
    );

    if (resp.statusCode == 200) {
      return true;
    }

    return false;
  }
}
