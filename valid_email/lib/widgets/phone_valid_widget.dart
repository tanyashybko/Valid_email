import 'package:flutter/material.dart';
import '../features/validation/phone_valid.dart';
import '../const.dart';

class PhoneValidWidget extends StatefulWidget {
  @override
  _PhoneValidWidget createState() => _PhoneValidWidget();
}

class _PhoneValidWidget extends State<PhoneValidWidget> {
  String inputValue = ''; // Variable to store the input field value
  String validationMessage = ''; // Message for phone validity
  Color validationColor = Colors.black; // Text color for the validation message

  void _validatePhone() {
    PhoneValid.validatePhone(
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
              _validatePhone();
            });
          },
          decoration: const InputDecoration(
            labelText: enterPhoneLabelText,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          validationMessage,
          style: TextStyle(
              fontSize: 18.0, color: validationColor  // Set the text color
          ),
        ),
      ],
    ),
  );
}
