import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import '../localization/language_switcher.dart';
import '../widgets/custom_layout_widget.dart';

class LargeSmallLayout extends StatelessWidget {
  const LargeSmallLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.largeSmallTitle),
        actions: const [
          LanguageSwitcher(),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxHeight > 450) {
            // Large screen layout
            return Column(
              children: [
                CustomLayoutWidget(color: Colors.grey, text: l10n.firstWidget),
                const SizedBox(height: 8.0),
                CustomLayoutWidget(color: Colors.grey[400]!, text: l10n.secondWidget),
                const SizedBox(height: 8.0),
                CustomLayoutWidget(color: Colors.grey[500]!, text: l10n.thirdWidget),
                const Spacer(), // Dynamic space
                CustomLayoutWidget(color: Colors.grey[600]!, text: l10n.fourthWidget),
              ],
            );
          } else {
            // Small screen layout with scroll
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomLayoutWidget(color: Colors.grey, text: l10n.firstWidget),
                    const SizedBox(height: 8.0),
                    CustomLayoutWidget(color: Colors.grey[400]!, text: l10n.secondWidget),
                    const SizedBox(height: 8.0),
                    CustomLayoutWidget(color: Colors.grey[500]!, text: l10n.thirdWidget),
                    const SizedBox(height: 8.0),
                    CustomLayoutWidget(color: Colors.grey[600]!, text: l10n.fourthWidget),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
