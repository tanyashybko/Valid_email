// import 'package:flutter/material.dart';
// import 'package:valid_email/features/validation/custom_error.dart';
//
// class ErrorHandler {
//   void handle(
//       CustomError? error,
//       void Function(String message, Color color) callback,
//       ) {
//     switch(error) {
//       case null: {
//         callback.call('Valid input', Colors.green);
//         return;
//       }
//       case MyEmailError _:{
//         _handleEmailError(error, callback);
//         return;
//       }
//       case MyPhoneError _: {
//         return;
//       }
//       case InvalidCharacters():
//         callback.call('Invalid characters in input', Colors.orange);
//         return;
//     }
//   }
//
//   void _handleEmailError(MyEmailError error,
//       void Function(String message, Color color) callback,) {
//     switch(error) {
//
//       case EmailFormatError _:
//         {
//           callback.call('Invalid email', Colors.red);
//           return;
//         }
//       case EmailEmptyError _:{
//         callback.call('Please enter your email', Colors.orange);
//         return;
//       }
//       case EmailAtSign _:{
//         callback.call('You email must contain @ sign', Colors.orange);
//         return;
//       }
//     }
//   }
//
//   void _handlePhoneError(MyPhoneError error,
//       void Function(String message, Color color) callback,) {
//     switch(error) {
//
//       case PhoneFormatError _:
//         {
//           callback.call('Invalid phone number', Colors.red);
//           return;
//         }
//       case PhoneEmptyError _:{
//         callback.call('Please enter your phone number', Colors.orange);
//         return;
//       }
//       case PhonePlusSign _:{
//         callback.call('Phone number must contain "+"', Colors.orange);
//         return;
//       }
//       case PhoneLongNumber _:{
//         callback.call('Phone number is too long', Colors.orange);
//         return;
//       }
//       case PhoneShortNumber _:{
//         callback.call('Phone number is too short', Colors.orange);
//         return;
//       }
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/custom_error.dart';

class ErrorHandler {
  void handle(
      CustomError? error,
      void Function(String message, Color color) callback,
      ) {
    if (error == null) {
      callback('Valid input', Colors.green);
    } else if (error is EmailEmptyError) {
      callback('Please enter your email', Colors.orange);
    } else if (error is EmailAtSign) {
      callback('Your email must contain @ sign', Colors.orange);
    } else if (error is InvalidCharacters) {
      callback('Invalid characters in input', Colors.orange);
    } else if (error is EmailFormatError) {
      callback('Invalid email format', Colors.red);
    } else if (error is PhoneEmptyError) {
      callback('Please enter your phone number', Colors.orange);
    } else if (error is PhonePlusSign) {
      callback('Phone number must contain "+"', Colors.orange);
    } else if (error is PhoneLongNumber) {
      callback('Phone number is too long', Colors.orange);
    } else if (error is PhoneShortNumber) {
      callback('Phone number is too short', Colors.orange);
    } else if (error is PhoneFormatError) {
      callback('Invalid phone number format', Colors.red);
    } else {
      callback('Unexpected error', Colors.red);
    }
  }
}
