import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valid_email/features/validation/custom_error.dart';
import 'package:valid_email/features/validation/error_handler.dart';
import 'package:valid_email/l10n/l10n.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

const _validInput = 'Valid input';
const _enterEmailLabelText = 'Enter your e-mail';
const _mustContainAtSign = 'You email must contain @ sign';
const _invalidCharacters = 'Invalid characters in input';
const _invalidEmailMessage = 'Invalid email';
const _enterPhoneLabelText = 'Enter your phone number';
const _mustContainPlusSign = 'Phone number must contain "+"';
const _tooLongNumber = 'Phone number is too long';
const _tooShortNumber = 'Phone number is too short';
const _invalidPhoneMessage = 'Invalid phone number';
const _unexpectedError = 'Unexpected error';

void main() {
  group('ErrorHandler', () {
    final errorHandler = ErrorHandler();

    final l10n = MockAppLocalizations();

    when(() => l10n.validInput).thenReturn(_validInput);
    when(() => l10n.enterEmailLabelText).thenReturn(_enterEmailLabelText);
    when(() => l10n.mustContainAtSign).thenReturn(_mustContainAtSign);
    when(() => l10n.invalidCharacters).thenReturn(_invalidCharacters);
    when(() => l10n.invalidEmailMessage).thenReturn(_invalidEmailMessage);
    when(() => l10n.enterPhoneLabelText).thenReturn(_enterPhoneLabelText);
    when(() => l10n.mustContainPlusSign).thenReturn(_mustContainPlusSign);
    when(() => l10n.tooLongNumber).thenReturn(_tooLongNumber);
    when(() => l10n.tooShortNumber).thenReturn(_tooShortNumber);
    when(() => l10n.invalidPhoneMessage).thenReturn(_invalidPhoneMessage);
    when(() => l10n.unexpectedError).thenReturn(_unexpectedError);


    test('should handle null error', () {
      errorHandler.handle(null, (message, color) {
        expect(message, _validInput);
        expect(color, Colors.green);
      },l10n);
    });

    test('should handle EmailEmptyError', () {
      errorHandler.handle(EmailEmptyError(), (message, color) {
        expect(message, _enterEmailLabelText);
        expect(color, Colors.orange);
      },l10n);
    });

    test('should handle EmailAtSign error', () {
      errorHandler.handle(EmailAtSign(), (message, color) {
        expect(message, _mustContainAtSign);
        expect(color, Colors.orange);
      },l10n);
    });

    test('should handle InvalidCharacters error', () {
      errorHandler.handle(InvalidCharacters(), (message, color) {
        expect(message, _invalidCharacters);
        expect(color, Colors.orange);
      },l10n);
    });

    test('should handle EmailFormatError', () {
      errorHandler.handle(EmailFormatError(), (message, color) {
        expect(message, _invalidEmailMessage);
        expect(color, Colors.red);
      },l10n);
    });

    test('should handle PhoneEmptyError', () {
      errorHandler.handle(PhoneEmptyError(), (message, color) {
        expect(message, _enterPhoneLabelText);
        expect(color, Colors.orange);
      },l10n);
    });

    test('should handle PhonePlusSign error', () {
      errorHandler.handle(PhonePlusSign(), (message, color) {
        expect(message, _mustContainPlusSign);
        expect(color, Colors.orange);
      },l10n);
    });

    test('should handle PhoneLongNumber error', () {
      errorHandler.handle(PhoneLongNumber(), (message, color) {
        expect(message, _tooLongNumber);
        expect(color, Colors.orange);
      },l10n);
    });

    test('should handle PhoneShortNumber error', () {
      errorHandler.handle(PhoneShortNumber(), (message, color) {
        expect(message, _tooShortNumber);
        expect(color, Colors.orange);
      },l10n);
    });

    test('should handle PhoneFormatError', () {
      errorHandler.handle(PhoneFormatError(), (message, color) {
        expect(message, _invalidPhoneMessage);
        expect(color, Colors.red);
      },l10n);
    });

    test('should handle unexpected error', () {
      errorHandler.handle(TestUnexpectedError(), (message, color) {
        expect(message, _unexpectedError);
        expect(color, Colors.red);
      },l10n);
    });
  });
}
