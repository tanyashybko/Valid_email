import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valid_email/l10n/l10n.dart';
import 'package:valid_email/localization/locale_provider.dart';
import 'package:valid_email/widgets/input_example_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            locale: provider.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: const InputExampleScreen(),
          );
        },
      ),
    );
  }
}