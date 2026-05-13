import 'dart:convert';

import 'package:banking_mobile_app/models/dto/card_dto.dart';
import 'package:banking_mobile_app/services/server_service.dart';
import 'package:http/http.dart' as http;

/// The app uses it to send HTTP requests to the API, concerning card related
/// matters.
class CardService {
  /// Fetches all the cards that the user has.
  static Future<List<CardDto>> getCardsByEmail(String email) async {
    http.Response resp = await http.get(
      Uri.parse(
        "${ServerService.serverIPAddressSN}/Card/ViewCardsByEmail/$email",
      ),
    );

    if (resp.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(resp.body);
      List<CardDto> cards = jsonList
          .map((card) => CardDto.fromJson(card))
          .toList();

      return cards;
    }
    throw http.ClientException("Failed to fetch cards");
  }

  /// Fetches the data for the selected card.
  static Future<CardDto> getCardDetailsByEmailAndCardNo(
    String email,
    String cardNo,
  ) async {
    http.Response resp = await http.get(
      Uri.parse(
        "${ServerService.serverIPAddressSN}/Card/ViewCardDetailsByEmailAndCardNo/$email/$cardNo",
      ),
    );

    if (resp.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(resp.body);
      return CardDto.fromJson(json);
    }
    throw http.ClientException("Failed to get card data.");
  }

  /// Resets the user's card pin.
  static Future<bool> resetCardPin(
    String email,
    String cardNo,
    String oldPin,
    String newPin,
  ) async {
    http.Response resp = await http.put(
      Uri.parse("${ServerService.serverIPAddressSN}/Card/ResetCardPin"),
      encoding: Encoding.getByName("utf-8"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "cardNo": cardNo,
        "oldPin": oldPin,
        "newPin": newPin,
      }),
    );

    if (resp.statusCode == 200) {
      return true;
    }
    throw http.ClientException("Failed to reset card pin");
  }
}
