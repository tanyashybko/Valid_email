import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valid_email/l10n/l10n.dart';
import 'package:valid_email/layout/large_small_layout.dart';
import 'package:valid_email/localization/locale_provider.dart';
import 'package:valid_email/widgets/countdown_timer_widget.dart';
import 'package:valid_email/widgets/input_example_screen.dart';
import 'package:valid_email/widgets/moving_square_widget.dart';

import 'layout/layout_screen.dart';
import 'widgets/stopwatch_widget.dart';

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
            // home: const InputExampleScreen(),
            routes: {
              '/': (context) => const InputExampleScreen(),
              '/second': (context) => const LayoutScreen(),
              '/third': (context) => const LargeSmallLayout(),
              '/fourth': (context) => const CountdownTimer(
                    duration: Duration(hours: 1, minutes: 0, seconds: 0),
                  ),
              '/fifth': (context) => const StopwatchWidget(),
              '/sixth': (context) => const MovingSquareWidget(),
            },
          );
        },
      ),
    );
  }
}
