//

import 'package:banking_mobile_app/models/app_cache_model.dart';
import 'package:banking_mobile_app/models/dto/card_dto.dart';
import 'package:banking_mobile_app/services/card_service.dart';
import 'package:flutter/foundation.dart';

/// Stores the details of a card.
class CardDetailsModel with ChangeNotifier {
  //
  final AppCacheModel _appCache;

  final String? _cardNo;
  final int? _cardPin;
  final String? _cardType;
  final String? _cardNetworkProvider;
  final String? _cardIssuer;
  final DateTime? _cardExpiryDate;
  final String? _cardStatus;
  final int? _cardCVV;

  CardDetailsModel({
    required AppCacheModel appCache,
    String? cardNo,
    int? cardPin,
    String? cardType,
    String? cardNetworkProvider,
    String? cardIssuer,
    DateTime? cardExpiryDate,
    String? cardStatus,
    int? cardCVV,
  }) : _appCache = appCache,
       _cardNo = cardNo,
       _cardPin = cardPin,
       _cardType = cardType,
       _cardNetworkProvider = cardNetworkProvider,
       _cardIssuer = cardIssuer,
       _cardExpiryDate = cardExpiryDate,
       _cardStatus = cardStatus,
       _cardCVV = cardCVV;

  String? get cardNo => _cardNo;
  int? get cardPin => _cardPin;
  String? get cardType => _cardType;
  String? get cardNetworkProvidier => _cardNetworkProvider;
  String? get cardIssuer => _cardIssuer;
  DateTime? get cardExpiryDate => _cardExpiryDate;
  String? get cardStatus => _cardStatus;
  int? get cardCVV => _cardCVV;

  /// Fetches the selected card's details.
  Future<CardDto> getCardDetailsByEmailAndCardNo() async {
    CardDto? card = await CardService.getCardDetailsByEmailAndCardNo(
      _appCache.email!,
      _appCache.cardNo!,
    );

    notifyListeners();
    return card;
  }
}
