import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/error_handler.dart';
import '../features/validation/my_custom_phone_validator.dart';
import 'common_valid_widget.dart';
import '../const.dart';

class PhoneValidWidget extends StatelessWidget {
  const PhoneValidWidget({super.key});

  @override
  Widget build(BuildContext context) => CommonValidWidget(
    validator: MyCustomPhoneValidator(),
    errorHandler: ErrorHandler(),
    labelText: enterPhoneLabelText,
    keyboardType: TextInputType.phone,
  );
}
