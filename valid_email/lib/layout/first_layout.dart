import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import '../widgets/custom_layout_widget.dart';

class FirstLayout extends StatelessWidget {
  const FirstLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CustomLayoutWidget(
                color: Colors.grey,
                text: l10n.firstWidget,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomLayoutWidget(
                      color: Colors.grey[400]!,
                      text: l10n.secondWidget,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomLayoutWidget(
                      color: Colors.grey[500]!,
                      text: l10n.thirdWidget,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
