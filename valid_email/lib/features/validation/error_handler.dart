import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/custom_error.dart';

class ErrorHandler {
  void handle(
      CustomError? error,
      void Function(String message, Color color) callback,
      ) {
    if (error == null) {
      callback('Valid input', Colors.green);
    } else if (error is EmailEmptyError) {
      callback('Please enter your email', Colors.orange);
    } else if (error is EmailAtSign) {
      callback('Your email must contain @ sign', Colors.orange);
    } else if (error is InvalidCharacters) {
      callback('Invalid characters in input', Colors.orange);
    } else if (error is EmailFormatError) {
      callback('Invalid email format', Colors.red);
    } else if (error is PhoneEmptyError) {
      callback('Please enter your phone number', Colors.orange);
    } else if (error is PhonePlusSign) {
      callback('Phone number must contain "+"', Colors.orange);
    } else if (error is PhoneLongNumber) {
      callback('Phone number is too long', Colors.orange);
    } else if (error is PhoneShortNumber) {
      callback('Phone number is too short', Colors.orange);
    } else if (error is PhoneFormatError) {
      callback('Invalid phone number format', Colors.red);
    } else {
      callback('Unexpected error', Colors.red);
    }
  }
}
