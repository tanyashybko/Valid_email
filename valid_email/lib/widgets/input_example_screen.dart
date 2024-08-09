import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import 'package:valid_email/widgets/validation/form_valid_widget.dart';
//import 'package:valid_email/widgets/validation/phone_valid_widget.dart';
//import 'package:valid_email/widgets/validation/email_valid_widget.dart';
import '../localization/language_switcher.dart';

class InputExampleScreen extends StatelessWidget {
  const InputExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.inputExampleScreenTitle),
        actions: const [
          LanguageSwitcher(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const EmailValidWidget(),
              // const SizedBox(height: 20),
              // const PhoneValidWidget(),
              const FormValidWidget(),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text(l10n.layoutPage),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
                child: Text(l10n.layoutThirdPage),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fourth');
                },
                child: Text(l10n.layoutFourthPage),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/fifth');
                },
                child: Text(l10n.layoutFifthPage),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sixth');
                },
                child: Text(l10n.layoutSixthPage),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/seventh');
                },
                child: Text(l10n.layoutSeventhPage),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/eighth');
                },
                child: Text(l10n.layoutEighthPage),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ninth');
                },
                child: Text(l10n.layoutNinthPage),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tenth');
                },
                child: Text(l10n.layoutTenthPage),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/eleventh');
                },
                child: Text(l10n.layoutEleventhPage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
