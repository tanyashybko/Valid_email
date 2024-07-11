import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/base_validator.dart';
import 'package:valid_email/features/validation/error_handler.dart';
import '../const.dart';
import '../features/validation/my_custom_email_validator.dart';

class CommonValidWidget extends StatefulWidget {
  const CommonValidWidget(
      {required this.validator, required this.errorHandler, super.key});
  final BaseValidator<String> validator;
  final ErrorHandler errorHandler;

  @override
  _CommonValidWidgetState createState() => _CommonValidWidgetState();
}

class _CommonValidWidgetState extends State<CommonValidWidget> {
  String inputValue = ''; // Variable to store the input field value
  String validationMessage = ''; // Message for validity
  Color validationColor = Colors.black; // Text color for the validation message

  void _validate() {
    final error = widget.validator.validate(inputValue);
    widget.errorHandler.handle(error, (message, color) {
      setState(() {
        validationMessage = message;
        validationColor = color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String labelText = widget.validator is MyCustomEmailValidator
        ? enterEmailLabelText
        : enterPhoneLabelText;

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
                          _validate();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: labelText,
                        border: const OutlineInputBorder(),
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
