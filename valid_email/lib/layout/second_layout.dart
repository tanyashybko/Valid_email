import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';
import '../widgets/custom_layout_widget.dart';

class SecondLayout extends StatelessWidget {
  const SecondLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[800],
      ),
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: CustomLayoutWidget(
                        color: Colors.grey[700]!,
                        text: context.l10n.firstWidget,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: CustomLayoutWidget(
                        color: Colors.grey[600]!,
                        text: context.l10n.secondWidget,
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
