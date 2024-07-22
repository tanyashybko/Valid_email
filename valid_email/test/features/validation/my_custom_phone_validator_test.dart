import 'package:flutter_test/flutter_test.dart';
import 'package:valid_email/features/validation/custom_error.dart';
import 'package:valid_email/features/validation/my_custom_phone_validator.dart';

void main() {
  group('MyCustomPhoneValidator', () {
    final validator = MyCustomPhoneValidator();

    test('should return PhoneEmptyError when phone number is empty', () {
      final result = validator.validate('');
      expect(result, isA<PhoneEmptyError>());
    });

    test('should return PhonePlusSign when phone number does not contain +', () {
      final result = validator.validate('1234567890');
      expect(result, isA<PhonePlusSign>());
    });

    test('should return PhoneLongNumber when phone number is too long', () {
      const longPhoneNumber = '+12345678901234567890';
      final result = validator.validate(longPhoneNumber);
      expect(result, isA<PhoneLongNumber>());
    });

    test('should return PhoneShortNumber when phone number is too short', () {
      const shortPhoneNumber = '+123';
      final result = validator.validate(shortPhoneNumber);
      expect(result, isA<PhoneShortNumber>());
    });

    test('should return PhoneFormatError when phone number has invalid format', () {
      const invalidFormatPhoneNumber = '+123-ABC-456';
      final result = validator.validate(invalidFormatPhoneNumber);
      expect(result, isA<PhoneFormatError>());
    });

    test('should return null when phone number is valid', () {
      const validPhoneNumber = '+123456789012';
      final result = validator.validate(validPhoneNumber);
      expect(result, isNull);
    });
  });
}
