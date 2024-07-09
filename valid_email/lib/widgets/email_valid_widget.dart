import 'package:flutter/material.dart';
import '../features/validation/email_valid.dart';
import '../const.dart';

class EmailValidWidget extends StatefulWidget {
  @override
  _EmailValidWidget createState() => _EmailValidWidget();
}

class _EmailValidWidget extends State<EmailValidWidget> {
  String inputValue = ''; // Variable to store the input field value
  String validationMessage = ''; // Message for email validity
  Color validationColor = Colors.black; // Text color for the validation message

  void _validateEmail() {
    EmailValid.validateEmail(
      inputValue: inputValue,
      onValidation: (message, color) {
        setState(() {
          validationMessage = message;
          validationColor = color;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) => Material(
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
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
            const SizedBox(height: 10.0),
            Text(
              validationMessage,
              style: TextStyle(
                  fontSize: 18.0, color: validationColor), // Set the text color
            ),
          ],
        ),
  );
}
