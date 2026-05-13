class CardDto {
  String? cardNo = "";
  String? status = "";
  String? type = "";
  int? pin;
  String? networkProvider = "";
  String? issuingBank = "";
  DateTime? expiryDate;
  int? cvv;

  CardDto._({
    this.cardNo,
    this.status,
    this.type,
    this.pin,
    this.networkProvider,
    this.issuingBank,
    this.expiryDate,
    this.cvv,
  });

  factory CardDto.fromJson(Map<String, dynamic> json) {
    var card = CardDto._(
      cardNo: json["cardNo"],
      status: json["status"],
      type: json["type"],
      pin: json["pin"],
      networkProvider: json["networkProvider"],
      issuingBank: json["issuingBank"],
      expiryDate: toDate(json["expiryDate"]),
      cvv: json["cvv"],
    );

    return card;
  }

  Map<String, dynamic> toJson() => {
    "cardNo": cardNo,
    "status": status,
    "type": type,
    "pin": pin,
    "networkProvider": networkProvider,
    "issuingBank": issuingBank,
    "expiryDate": expiryDate,
    "cvv": cvv,
  };

  /// Convert a string date to `DateTime`.
  static DateTime? toDate(String? date) {
    // YYYY-MM-DD
    if (date != null && date.isNotEmpty) {
      var components = date.split("-");
      String? year, month, day;
      year = components[0];
      month = components[1];
      day = components[2].split("T")[0];

      return DateTime(int.parse(year), int.parse(month), int.parse(day));
    }
    return null;
  }

  @override
  String toString() =>
      """"
    Card No: $cardNo\n
    Status: $status\n
    Type: $type\n
    Pin: $pin\n
    Network Provider: $networkProvider
    Issuing Bank: $issuingBank\n
    Expiry Date: $expiryDate\n
    CVV: $cvv\n
    """;
}
