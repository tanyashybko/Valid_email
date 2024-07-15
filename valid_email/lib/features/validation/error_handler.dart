import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/custom_error.dart';
import 'package:valid_email/l10n/l10n.dart';

class ErrorHandler {
  void handle(
      CustomError? error,
      void Function(String message, Color color) callback,
      AppLocalizations l10n,
      BuildContext context,
      ) {
    switch (error) {
      case null:
        callback(context.l10n.validInput, Colors.green);
        break;
      case EmailEmptyError():
        callback(context.l10n.enterEmailLabelText, Colors.orange);
        break;
      case EmailAtSign():
        callback(context.l10n.mustContainAtSign, Colors.orange);
        break;
      case InvalidCharacters():
        callback(context.l10n.invalidCharacters, Colors.orange);
        break;
      case EmailFormatError():
        callback(context.l10n.invalidEmailMessage, Colors.red);
        break;
      case PhoneEmptyError():
        callback(context.l10n.enterPhoneLabelText, Colors.orange);
        break;
      case PhonePlusSign():
        callback(context.l10n.mustContainPlusSign, Colors.orange);
        break;
      case PhoneLongNumber():
        callback(context.l10n.tooLongNumber, Colors.orange);
        break;
      case PhoneShortNumber():
        callback(context.l10n.tooShortNumber, Colors.orange);
        break;
      case PhoneFormatError():
        callback(context.l10n.invalidPhoneMessage, Colors.red);
        break;
      default:
        callback(context.l10n.unexpectedError, Colors.red);
    }
  }
}
