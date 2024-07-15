import 'package:flutter/material.dart';
import 'package:valid_email/l10n/l10n.dart';

class SecondLayout extends StatelessWidget {
  const SecondLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      height: 250,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[700],
                    child: Center(
                      child: Text(
                        context.l10n.firstWidget,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[600],
                    child: Center(
                      child: Text(
                        context.l10n.secondWidget,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
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
    );
  }
}