import 'package:banking_mobile_app/models/dto/card_dto.dart';
import 'package:banking_mobile_app/models/login_model.dart';
import 'package:banking_mobile_app/services/card_service.dart';
import 'package:flutter/material.dart';

class CardsModel with ChangeNotifier {
  /// Provides access to the login details.
  final LoginModel _loginModel;

  /// Stores the index of the selected card.
  int _selectedCardIndex = -1;

  CardsModel({required LoginModel loginModel}) : _loginModel = loginModel;

  // Getters
  int get selectedCardIndex => _selectedCardIndex;

  LoginModel get loginModel => _loginModel;

  void updateSelectedCardIndex(int index) {
    if (index >= 0 && index != _selectedCardIndex) {
      _selectedCardIndex = index;
      notifyListeners();
    }
  }

  Future<List<CardDto>> viewCardsByEmail() async =>
      await CardService.getCardsByEmail(_loginModel.email!);
}
