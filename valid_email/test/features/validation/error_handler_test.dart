import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:valid_email/features/validation/custom_error.dart';
import 'package:valid_email/const.dart';
import 'package:valid_email/features/validation/error_handler.dart';

void main() {
  group('ErrorHandler', () {
    final errorHandler = ErrorHandler();


    test('should handle null error', () {
      errorHandler.handle(null, (message, color) {
        expect(message, validInput);
        expect(color, Colors.green);
      });
    });

    test('should handle EmailEmptyError', () {
      errorHandler.handle(EmailEmptyError(), (message, color) {
        expect(message, enterEmailLabelText);
        expect(color, Colors.orange);
      });
    });

    test('should handle EmailAtSign error', () {
      errorHandler.handle(EmailAtSign(), (message, color) {
        expect(message, mustContainAtSign);
        expect(color, Colors.orange);
      });
    });

    test('should handle InvalidCharacters error', () {
      errorHandler.handle(InvalidCharacters(), (message, color) {
        expect(message, invalidCharacters);
        expect(color, Colors.orange);
      });
    });

    test('should handle EmailFormatError', () {
      errorHandler.handle(EmailFormatError(), (message, color) {
        expect(message, invalidEmailMessage);
        expect(color, Colors.red);
      });
    });

    test('should handle PhoneEmptyError', () {
      errorHandler.handle(PhoneEmptyError(), (message, color) {
        expect(message, enterPhoneLabelText);
        expect(color, Colors.orange);
      });
    });

    test('should handle PhonePlusSign error', () {
      errorHandler.handle(PhonePlusSign(), (message, color) {
        expect(message, mustContainPlusSign);
        expect(color, Colors.orange);
      });
    });

    test('should handle PhoneLongNumber error', () {
      errorHandler.handle(PhoneLongNumber(), (message, color) {
        expect(message, tooLongNumber);
        expect(color, Colors.orange);
      });
    });

    test('should handle PhoneShortNumber error', () {
      errorHandler.handle(PhoneShortNumber(), (message, color) {
        expect(message, tooShortNumber);
        expect(color, Colors.orange);
      });
    });

    test('should handle PhoneFormatError', () {
      errorHandler.handle(PhoneFormatError(), (message, color) {
        expect(message, invalidPhoneMessage);
        expect(color, Colors.red);
      });
    });

    test('should handle unexpected error', () {
      errorHandler.handle(TestUnexpectedError(), (message, color) {
        expect(message, unexpectedError);
        expect(color, Colors.red);
      });
    });
  });
}
