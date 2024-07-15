import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';

class FirstLayout extends StatelessWidget {
  const FirstLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Text(
                  context.l10n.firstWidget,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[400],
                    child: Center(
                      child: Text(
                        context.l10n.secondWidget,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[500],
                    child: Center(
                      child: Text(
                        context.l10n.thirdWidget,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
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