import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/error_handler.dart';
import 'package:valid_email/l10n/l10n.dart';
import '../features/validation/my_custom_email_validator.dart';
import 'common_valid_widget.dart';

class EmailValidWidget extends StatelessWidget {
  const EmailValidWidget({super.key});

  @override
  Widget build(BuildContext context) => CommonValidWidget(
    validator: MyCustomEmailValidator(),
    errorHandler: ErrorHandler(),
    labelText: context.l10n.enterEmailLabelText,
    keyboardType: TextInputType.emailAddress,
  );
}
