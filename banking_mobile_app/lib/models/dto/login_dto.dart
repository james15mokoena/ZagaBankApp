class LoginDto {
  //
  String? _email;
  String? _password;

  LoginDto._({required String email, required String password})
    : _email = email,
      _password = password;

  /// Initializes this object from a JSON string.
  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      LoginDto._(email: json["email"], password: json["password"]);

  /// Converts this object to a map that can be converted to a JSON
  /// object.
  Map<String, dynamic> toJson() => {"email": email, "password": password};

  // Getters
  String? get email => _email;

  String? get password => _password;

  @override
  String toString() => "Email: $email\nPassword: $password\n";
}
