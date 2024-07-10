import 'package:flutter/material.dart';
import '../../const.dart';
import 'package:valid_email/error_color.dart';

class PhoneValid {
  static void validatePhone({
    required String inputValue,
    required void Function(String, Color) onValidation,
  }) {
    final RegExp pattern =
    RegExp(r'^[+]?(\d){0,4}([(][0-9]{1,4}[)])?[-\s./0-9]+[0-9]$');

    const int minPhoneNumberLength = 12;
    const int maxPhoneNumberLength = 15;

    String message;
    if (inputValue.isEmpty) {
      message = enterPhoneLabelText;
    } else if (!inputValue.contains('+')) {
      message = mustContainPlusSign;
    } else if (inputValue.length > maxPhoneNumberLength) {
      message = tooLongNumber;
    } else if (inputValue.length < minPhoneNumberLength) {
      message = tooShortNumber;
    } else if (!pattern.hasMatch(inputValue)) {
      message = invalidPhoneMessage;
    } else {
      message = validPhoneMessage;
    }

    Color color = getValidationColor(message);
    onValidation(message, color);
  }
}
