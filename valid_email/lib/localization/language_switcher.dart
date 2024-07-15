import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valid_email/l10n/l10n.dart';
import 'package:valid_email/localization/locale_provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Localizations.localeOf(context);
    const items = AppLocalizations.supportedLocales;

    return DropdownButtonHideUnderline(
      child: DropdownButton<Locale>(
        value: locale,
        icon: const Icon(Icons.language),
        items: items.map((locale) {
          final flag = L10n.getFlag(locale.languageCode);

          return DropdownMenuItem(
            value: locale,
            child: Center(
              child: Text(
                flag,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          );
        }).toList(),
        onChanged: (locale) {
          provider.setLocale(locale!);
        },
      ),
    );
  }
}