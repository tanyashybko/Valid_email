import 'base_validator.dart';
import 'custom_error.dart';

class PhoneValid extends BaseValidator<String> {
  @override
  CustomError? validate(String data) {
    final RegExp pattern =
    RegExp(r'^[+]?(\d){0,4}([(][0-9]{1,4}[)])?[-\s./0-9]+[0-9]$');

    const int minPhoneNumberLength = 12;
    const int maxPhoneNumberLength = 15;

    if (data.isEmpty) {
      return PhoneEmptyError();
    } else if (!data.contains('+')) {
      return PhonePlusSign();
    } else if (data.length > maxPhoneNumberLength) {
      return PhoneLongNumber();
    } else if (data.length < minPhoneNumberLength) {
      return PhoneShortNumber();
    } else if (!pattern.hasMatch(data)) {
      return PhoneFormatError();
    }

    return null;
  }
}
