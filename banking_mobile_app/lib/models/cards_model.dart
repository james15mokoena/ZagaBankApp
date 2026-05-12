import 'package:flutter/material.dart';

class CardsModel with ChangeNotifier {
  //

  final List<String> _cards = [
    "CardNo 1234567890",
    "CardNo 2134567890",
    "CardNo 2315689304",
    "CardNo 5875234674",
    "CardNo 5875234673",
    "CardNo 5872231674",
    "CardNo 5872231674",
    "CardNo 1234567890",
    "CardNo 2134567890",
    "CardNo 2315689304",
    "CardNo 5875234674",
  ];

  int _selectedCardIndex = -1;

  List<String> get cards => _cards;

  int get selectedCardIndex => _selectedCardIndex;

  void updateSelectedCardIndex(int index) {
    if (index >= 0 && index != _selectedCardIndex) {
      _selectedCardIndex = index;
      notifyListeners();
    }
  }

  void addCard(String card) {
    _cards.add(card);
    notifyListeners();
  }
}
