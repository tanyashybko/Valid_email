import 'package:email_validator/email_validator.dart';
import 'package:valid_email/features/validation/base_validator.dart';
import 'package:valid_email/features/validation/custom_error.dart';

class MyCustomEmailValidator extends BaseValidator<String> {
  @override
  CustomError? validate(String data) {
    if (data.isEmpty) {
      return EmailEmptyError();
    } else if (!data.contains('@')) {
      return EmailAtSign();
    } else if (RegExp(r'[+\-*/]').hasMatch(data)) {
      return InvalidCharacters();
    } else if (EmailValidator.validate(data)) {
      return null;
    }
    return EmailFormatError();
  }
}
