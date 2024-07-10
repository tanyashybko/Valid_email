import 'package:flutter/material.dart';
import '../features/validation/phone_validator.dart';
import '../const.dart';

class PhoneValidWidget extends StatefulWidget {
  const PhoneValidWidget({Key? key}) : super(key: key);

  @override
  _PhoneValidWidgetState createState() => _PhoneValidWidgetState();
}

class _PhoneValidWidgetState extends State<PhoneValidWidget> {
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
                          _validatePhone();
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: enterPhoneLabelText,
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
