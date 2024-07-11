import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/base_validator.dart';
import 'package:valid_email/widgets/common_valid_widget.dart';
import '../../const.dart';
import '../features/validation/error_handler.dart';
import '../features/validation/my_custom_email_validator.dart';
import '../features/validation/my_custom_phone_validator.dart';

class InputExampleScreen extends StatelessWidget {
  const InputExampleScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(inputExampleScreenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonValidWidget(validator: MyCustomEmailValidator(), errorHandler: ErrorHandler()),
            // EmailValidWidget(),
            const SizedBox(height: 20),
            CommonValidWidget(validator: MyCustomPhoneValidator(), errorHandler: ErrorHandler()),
            // PhoneValidWidget(),
          ],
        ),
      ),
    );
  }
}