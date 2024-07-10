import 'package:flutter/material.dart';
import '../../const.dart';

Color getValidationColor(String message) {
  if (message == enterPhoneLabelText ||
      message == mustContainPlusSign ||
      message == tooLongNumber ||
      message == tooShortNumber ||
      message == enterYourEmailMessage ||
      message == mustContainAtSign ||
      message == invalidCharacters) {
    return Colors.orange;
  } else if (message == invalidPhoneMessage ||
      message == invalidEmailMessage) {
    return Colors.red;
  } else if (message == validPhoneMessage ||
      message == validEmailMessage) {
    return Colors.green;
  }
  return Colors.black; // Default color
}
