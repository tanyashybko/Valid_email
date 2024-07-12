import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/custom_error.dart';
import 'package:valid_email/const.dart';

class ErrorHandler {
  void handle(
      CustomError? error,
      void Function(String message, Color color) callback,
      ) {
    if (error == null) {
      callback(validInput, Colors.green);
    } else if (error is EmailEmptyError) {
      callback(enterEmailLabelText, Colors.orange);
    } else if (error is EmailAtSign) {
      callback(mustContainAtSign, Colors.orange);
    } else if (error is InvalidCharacters) {
      callback(invalidCharacters, Colors.orange);
    } else if (error is EmailFormatError) {
      callback(invalidEmailMessage, Colors.red);
    } else if (error is PhoneEmptyError) {
      callback(enterPhoneLabelText, Colors.orange);
    } else if (error is PhonePlusSign) {
      callback(mustContainPlusSign, Colors.orange);
    } else if (error is PhoneLongNumber) {
      callback(tooLongNumber, Colors.orange);
    } else if (error is PhoneShortNumber) {
      callback(tooShortNumber , Colors.orange);
    } else if (error is PhoneFormatError) {
      callback(invalidPhoneMessage, Colors.red);
    } else {
      callback(unexpectedError, Colors.red);
    }
  }
}
