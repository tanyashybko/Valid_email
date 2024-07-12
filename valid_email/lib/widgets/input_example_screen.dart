import 'package:flutter/material.dart';
import 'package:valid_email/widgets/phone_valid_widget.dart';
import '../../const.dart';
import 'email_valid_widget.dart';

class InputExampleScreen extends StatelessWidget {
  const InputExampleScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(inputExampleScreenTitle),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailValidWidget(),
            SizedBox(height: 20),
            PhoneValidWidget(),
          ],
        ),
      ),
    );
  }
}