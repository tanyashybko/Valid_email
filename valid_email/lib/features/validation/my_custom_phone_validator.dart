import 'package:valid_email/features/validation/base_validator.dart';
import 'package:valid_email/features/validation/custom_error.dart';
import '../../const.dart';

class MyCustomPhoneValidator extends BaseValidator<String> {
  final RegExp _pattern = RegExp(r'^[+]?(\d){0,4}([(][0-9]{1,4}[)])?[-\s./0-9]+[0-9]$');

  @override
  CustomError? validate(String data) {
    if (data.isEmpty) {
      return PhoneEmptyError();
    } else if (!data.contains('+')) {
      return PhonePlusSign();
    } else if (data.length > maxPhoneNumberLength) {
      return PhoneLongNumber();
    } else if (data.length < minPhoneNumberLength) {
      return PhoneShortNumber();
    } else if (!_pattern.hasMatch(data)) {
      return PhoneFormatError();
    }
    return null;
  }
}
