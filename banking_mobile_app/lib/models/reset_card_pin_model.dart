import 'package:flutter/widgets.dart';

class ResetCardPinModel {
  //
  String? _email;
  int? _previousPin;
  int? _newPin;

  ResetCardPinModel({String? email, int? previousPin, int? newPin})
    : _email = email,
      _previousPin = previousPin,
      _newPin = newPin;

  String? validatePreviousPin(String? pin) {
    if (pin != null && pin.isNotEmpty && pin.length == 4) {
      _previousPin = int.tryParse(pin);
      if (_previousPin != null) {
        return null;
      } else {
        return "Pin must be a number";
      }
    } else if (pin == null || pin.isEmpty) {
      return "Please enter valid pin";
    } else if (pin.length < 4) {
      return "Pin must have 4 digits";
    }
    return null;
  }

  String? validateNewPin(String? pin) {
    if (pin != null && pin.isNotEmpty && pin.length == 4) {
      _newPin = int.tryParse(pin);
      if (_newPin != null) {
        return null;
      } else {
        return "Pin must be a number";
      }
    } else if (pin == null || pin.isEmpty) {
      return "Please enter valid pin";
    } else if (pin.length < 4) {
      return "Pin must have 4 digits";
    }
    return null;
  }

  bool resetPin(GlobalKey<FormState> key, String? oldPin, String? newPin) {
    //

    if (key.currentState?.validate() == true) {
      _newPin = int.tryParse(newPin!);
      _previousPin = int.tryParse(oldPin!);
      if (_newPin != null && _previousPin != null) {
        return true;
      }
    }

    return false;
  }
}
