import 'package:flutter/material.dart';
import '../../const.dart';

class PhoneValid {
  static void validatePhone({
    required String inputValue,
    required void Function(String, Color) onValidation,
  }) {
    final RegExp pattern =
    RegExp(r'^[+]?(\d){0,4}([(][0-9]{1,4}[)])?[-\s./0-9]+[0-9]$');

    const int minPhoneNumberLength = 12;
    const int maxPhoneNumberLength = 15;

    if (inputValue.isEmpty) {
      onValidation(enterPhoneLabelText, Colors.orange);
    } else if (!inputValue.contains('+')) {
      onValidation(mustContainPlusSign, Colors.orange);
    } else if (inputValue.length > maxPhoneNumberLength) {
      onValidation(tooLongNumber, Colors.orange);
    } else if (inputValue.length < minPhoneNumberLength) {
      onValidation(tooShortNumber, Colors.orange);
    } else if (!pattern.hasMatch(inputValue)) {
      onValidation(invalidPhoneMessage, Colors.red);
    } else {
      onValidation(validPhoneMessage, Colors.green);
    }
  }
}