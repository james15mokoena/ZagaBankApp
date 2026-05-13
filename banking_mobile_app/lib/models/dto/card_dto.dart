class CardDto {
  //
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

  factory CardDto.fromJson(Map<String, dynamic> json) => CardDto._(
    cardNo: json["cardNo"],
    status: json["status"],
    type: json["type"],
    pin: json["pin"],
    networkProvider: json["networkProvider"],
    issuingBank: json["issuingBank"],
    expiryDate: json["expiryDate"],
    cvv: json["cvv"],
  );

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
