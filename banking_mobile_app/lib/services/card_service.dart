import 'dart:convert';

import 'package:banking_mobile_app/models/dto/card_dto.dart';
import 'package:banking_mobile_app/services/server_service.dart';
import 'package:http/http.dart' as http;

/// The app uses it to send HTTP requests to the API, concerning card related
/// matters.
class CardService {
  //

  static Future<List<CardDto>> getCardsByEmail(String email) async {
    //

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
}
