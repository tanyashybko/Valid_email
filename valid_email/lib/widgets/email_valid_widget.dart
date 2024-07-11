import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/error_handler.dart';
import '../features/validation/my_custom_email_validator.dart';
import 'common_valid_widget.dart';
import '../const.dart';

class EmailValidWidget extends StatelessWidget {
  const EmailValidWidget({super.key});

  @override
  Widget build(BuildContext context) => CommonValidWidget(
    validator: MyCustomEmailValidator(),
    errorHandler: ErrorHandler(),
    labelText: enterEmailLabelText,
    keyboardType: TextInputType.emailAddress,
  );
}
