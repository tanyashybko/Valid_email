import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/custom_error.dart';
import 'package:valid_email/l10n/l10n.dart';

class ErrorHandler {
  void handle(
      CustomError? error,
      void Function(String message, Color color) callback,
      AppLocalizations l10n,
      ) {
    switch (error) {
      case null:
        callback(l10n.validInput, Colors.green);
        break;
      case EmailEmptyError():
        callback(l10n.enterEmailLabelText, Colors.orange);
        break;
      case EmailAtSign():
        callback(l10n.mustContainAtSign, Colors.orange);
        break;
      case InvalidCharacters():
        callback(l10n.invalidCharacters, Colors.orange);
        break;
      case EmailFormatError():
        callback(l10n.invalidEmailMessage, Colors.red);
        break;
      case PhoneEmptyError():
        callback(l10n.enterPhoneLabelText, Colors.orange);
        break;
      case PhonePlusSign():
        callback(l10n.mustContainPlusSign, Colors.orange);
        break;
      case PhoneLongNumber():
        callback(l10n.tooLongNumber, Colors.orange);
        break;
      case PhoneShortNumber():
        callback(l10n.tooShortNumber, Colors.orange);
        break;
      case PhoneFormatError():
        callback(l10n.invalidPhoneMessage, Colors.red);
        break;
      default:
        callback(l10n.unexpectedError, Colors.red);
    }
  }
}
