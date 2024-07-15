import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import 'package:valid_email/widgets/phone_valid_widget.dart';
import 'package:valid_email/widgets/email_valid_widget.dart';
import '../localization/language_switcher.dart';

class InputExampleScreen extends StatelessWidget {
  const InputExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.inputExampleScreenTitle),
        actions: const [
          LanguageSwitcher(),
        ],
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