import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../const.dart';

class  EmailValid{
  // Function to check email validity
  static void validateEmail({
    required String inputValue,
    required void Function(String, Color) onValidation,
  }) {
    if (inputValue.isEmpty) {
      onValidation(enterYourEmailMessage, Colors.orange);
    } else if (!inputValue.contains('@')) {
      onValidation(mustContainAtSign, Colors.orange);
    }
    else if (RegExp(r'[+\-*/"]').hasMatch(inputValue)) {
      onValidation(invalidCharacters, Colors.orange);
    } else if (EmailValidator.validate(inputValue)) {
      onValidation(validEmailMessage, Colors.green);
    } else {
      onValidation(invalidEmailMessage, Colors.red);
    }
  }
}
