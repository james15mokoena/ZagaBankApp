//

/// Stores the details of a card.
class CardDetailsModel {
  //

  final String? _cardNo;
  final int? _cardPin;
  final String? _cardType;
  final String? _cardNetworkProvider;
  final String? _cardIssuer;
  final DateTime? _cardExpiryDate;
  final String? _cardStatus;
  final int? _cardCVV;

  CardDetailsModel({
    String? cardNo,
    int? cardPin,
    String? cardType,
    String? cardNetworkProvider,
    String? cardIssuer,
    DateTime? cardExpiryDate,
    String? cardStatus,
    int? cardCVV,
  }) : _cardNo = cardNo,
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
}
