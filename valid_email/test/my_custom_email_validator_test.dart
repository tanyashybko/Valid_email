import 'package:flutter_test/flutter_test.dart';
import 'package:valid_email/features/validation/custom_error.dart';
import 'package:valid_email/features/validation/my_custom_email_validator.dart';

void main() {
  group('MyCustomEmailValidator', () {
    final validator = MyCustomEmailValidator();

    test('should return EmailEmptyError when email is empty', () {
      final result = validator.validate('');
      expect(result, isA<EmailEmptyError>());
    });

    test('should return EmailAtSign when email does not contain @', () {
      final result = validator.validate('example.com');
      expect(result, isA<EmailAtSign>());
    });

    test('should return InvalidCharacters when email contains invalid characters', () {
      final result = validator.validate('example+test@example.com');
      expect(result, isA<InvalidCharacters>());
    });

    test('should return EmailFormatError when email format is invalid', () {
      final result = validator.validate('example@com');
      expect(result, isA<EmailFormatError>());
    });

    test('should return null when email is valid', () {
      final result = validator.validate('test@example.com');
      expect(result, isNull);
    });
  });
}
