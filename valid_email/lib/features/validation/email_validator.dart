import 'package:email_validator/email_validator.dart';
import 'custom_error.dart';

class EmailValid {
  // Function to check email validity
  static CustomError? validateEmail(String inputValue) {
    if (inputValue.isEmpty) {
      return EmailEmptyError();
    } else if (!inputValue.contains('@')) {
      return EmailAtSign();
    } else if (RegExp(r'[+\-*/]').hasMatch(inputValue)) {
      return InvalidCharacters();
    } else if (!EmailValidator.validate(inputValue)) {
      return EmailFormatError();
    }
    return null;
  }
}

