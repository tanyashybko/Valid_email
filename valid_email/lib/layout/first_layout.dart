import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import '../widgets/custom_layout_widget.dart';


class FirstLayout extends StatelessWidget {
  const FirstLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 250,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomLayoutWidget(
              color: Colors.grey,
              text: context.l10n.firstWidget,
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomLayoutWidget(
                    color: Colors.grey[400]!,
                    text: context.l10n.secondWidget,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: CustomLayoutWidget(
                    color: Colors.grey[500]!,
                    text: context.l10n.thirdWidget,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}