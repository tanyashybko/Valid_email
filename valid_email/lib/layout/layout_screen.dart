import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import '../localization/language_switcher.dart';
import 'simple layouts/first_layout.dart';
import 'simple layouts/second_layout.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.layoutTitle),
        actions: const [
          LanguageSwitcher(),
        ],),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FirstLayout(),
              SizedBox(height: 20),
              SecondLayout(),
            ],
          ),
        ),
      ),
    );
  }
}