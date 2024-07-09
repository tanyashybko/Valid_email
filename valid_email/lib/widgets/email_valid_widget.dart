import 'package:flutter/material.dart';
import '../features/validation.dart';
import '../const.dart';

class MyInputPage extends StatefulWidget {
  @override
  _MyInputPageState createState() => _MyInputPageState();
}

class _MyInputPageState extends State<MyInputPage> {
  String inputValue = ''; // Variable to store the input field value
  String validationMessage = ''; // Message for email validity
  Color validationColor = Colors.black; // Text color for the validation message

  void _validateEmail() {
    EmailValidatorService.validateEmail(
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  inputValue = value; // Update the variable when the text changes
                });
              },
              onSubmitted: (value) {
                _validateEmail(); // Call the validation function when the user submits the text
              },
              decoration: InputDecoration(
                labelText: enterEmailLabelText,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              validationMessage,
              style: TextStyle(fontSize: 18.0, color: validationColor), // Set the text color
            ),
          ],
        ),
      ),
    );
  }
}
