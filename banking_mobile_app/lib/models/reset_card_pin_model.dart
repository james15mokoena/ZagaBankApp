import 'package:banking_mobile_app/models/app_cache_model.dart';
import 'package:banking_mobile_app/services/card_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class ResetCardPinModel with ChangeNotifier {
  //
  final AppCacheModel _appCache;
  int? _previousPin;
  int? _newPin;
  bool _isReset = false;
  bool _hasAttemptedCardPinReset = false;

  ResetCardPinModel({
    required AppCacheModel appCache,
    int? previousPin,
    int? newPin,
  }) : _appCache = appCache,
       _previousPin = previousPin,
       _newPin = newPin;

  bool get isReset => _isReset;

  bool get hasAttemptedCardPinReset => _hasAttemptedCardPinReset;

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

  Future<bool> resetPin(
    GlobalKey<FormState> key,
    String? oldPin,
    String? newPin,
  ) async {
    if (key.currentState?.validate() == true) {
      _newPin = int.tryParse(newPin!);
      _previousPin = int.tryParse(oldPin!);

      if (_newPin != null && _previousPin != null) {
        try {
          _isReset = await CardService.resetCardPin(
            _appCache.email!,
            _appCache.cardNo!,
            oldPin,
            newPin,
          );

          _hasAttemptedCardPinReset = true;
          notifyListeners();

          if (_isReset) {
            return true;
          }
        } on ClientException catch (_) {}
      }
    }

    return false;
  }
}
