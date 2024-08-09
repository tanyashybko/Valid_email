import 'package:flutter/material.dart';
import 'package:valid_email/features/validation/my_custom_email_validator.dart';
import 'package:valid_email/features/validation/my_custom_phone_validator.dart';
import 'package:valid_email/features/validation/error_handler.dart';
import 'package:valid_email/l10n/l10n.dart';

class FormValidWidget extends StatefulWidget {
  const FormValidWidget({super.key});

  @override
  State<FormValidWidget> createState() => _FormValidWidgetState();
}

class _FormValidWidgetState extends State<FormValidWidget> {
  final _formKey = GlobalKey<FormState>();
  final MyCustomEmailValidator emailValidator = MyCustomEmailValidator();
  final MyCustomPhoneValidator phoneValidator = MyCustomPhoneValidator();
  final ErrorHandler errorHandler = ErrorHandler();

  String _email = '';
  String _phone = '';

  Color _emailFieldColor = Colors.black;
  Color _phoneFieldColor = Colors.black;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email: $_email\nPhone: $_phone')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: context.l10n.emailLabel,
              labelStyle: TextStyle(color: _emailFieldColor),
            ),
            validator: (value) {
              final error = emailValidator.validate(value ?? '');
              String? errorMessage;
              errorHandler.handle(error, (message, color) {
                setState(() {
                  errorMessage = message;
                  _emailFieldColor = color;
                });
              }, context.l10n);
              return errorMessage;
            },
            onSaved: (value) {
              _email = value ?? '';
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              labelText: context.l10n.phoneLabel,
              labelStyle: TextStyle(color: _phoneFieldColor),
            ),
            validator: (value) {
              final error = phoneValidator.validate(value ?? '');
              String? errorMessage;
              errorHandler.handle(error, (message, color) {
                setState(() {
                  errorMessage = message;
                  _phoneFieldColor = color;
                });
              }, context.l10n);
              return errorMessage;
            },
            onSaved: (value) {
              _phone = value ?? '';
            },
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _submitForm();
              }
            },
            child: Text(context.l10n.submitButton),
          ),
        ],
      ),
    );
  }
}
