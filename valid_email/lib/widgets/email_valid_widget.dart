import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/email_validator.dart';
import 'package:valid_email/features/validation/error_handler.dart';
import 'package:valid_email/features/validation/custom_error.dart';
import '../const.dart';

class EmailValidWidget extends StatefulWidget {
  const EmailValidWidget({super.key});

  @override
  _EmailValidWidgetState createState() => _EmailValidWidgetState();
}

class _EmailValidWidgetState extends State<EmailValidWidget> {
  String inputValue = ''; // Variable to store the input field value
  String validationMessage = ''; // Message for email validity
  Color validationColor = Colors.black; // Text color for the validation message

  final ErrorHandler errorHandler = ErrorHandler();

  void _validateEmail() {
    final CustomError? error = EmailValid.validateEmail(inputValue);
    errorHandler.handle(error, (message, color) {
      setState(() {
        validationMessage = message;
        validationColor = color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isWideScreen = constraints.maxWidth > 600;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0), // Add some spacing
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          inputValue = value; // Update the variable when the text changes
                          _validateEmail();
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: enterEmailLabelText,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                if (isWideScreen)
                  Expanded(
                    child: Text(
                      validationMessage,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: validationColor,
                      ),
                    ),
                  ),
              ],
            ),
            if (!isWideScreen) // Show validation message below TextField on narrow screens
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  validationMessage,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: validationColor,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
