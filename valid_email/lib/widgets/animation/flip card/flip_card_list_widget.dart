import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';

import '../../../localization/language_switcher.dart';
import '../../../resources/resources.dart';
import 'flip_card_widget.dart';

class FlipCardListWidget extends StatelessWidget {
  const FlipCardListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.flipCardTitle),
        actions: const [
          LanguageSwitcher(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipCardWidget(
              text: '${l10n.flipCardTitle} 1',
              imageAssetPath: Images.cat,
            ),
            const SizedBox(height: 16),
            FlipCardWidget(
              text: '${l10n.flipCardTitle} 2',
              imageAssetPath: Images.dog,
            ),
            const SizedBox(height: 16),
            FlipCardWidget(
              text: '${l10n.flipCardTitle} 3',
              imageAssetPath: Images.star,
            ),
          ],
        ),
      ),
    );
  }
}
