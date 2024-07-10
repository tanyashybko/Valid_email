import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../const.dart';
import 'package:valid_email/error_color.dart';

class EmailValid {
  // Function to check email validity
  static void validateEmail({
    required String inputValue,
    required void Function(String, Color) onValidation,
  }) {
    String message;
    if (inputValue.isEmpty) {
      message = enterYourEmailMessage;
    } else if (!inputValue.contains('@')) {
      message = mustContainAtSign;
    } else if (RegExp(r'[+\-*/]').hasMatch(inputValue)) {
      message = invalidCharacters;
    } else if (EmailValidator.validate(inputValue)) {
      message = validEmailMessage;
    } else {
      message = invalidEmailMessage;
    }

    Color color = getValidationColor(message);
    onValidation(message, color);
  }
}
