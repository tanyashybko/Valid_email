import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Input Example',
      home: MyInputPage(),
    );
  }
}

class MyInputPage extends StatefulWidget {
  @override
  _MyInputPageState createState() => _MyInputPageState();
}

class _MyInputPageState extends State<MyInputPage> {
  String inputValue = ''; // Переменная для хранения значения из поля ввода
  String validationMessage = ''; // Сообщение о валидности email
  Color validationColor = Colors.black;

  // Функция для проверки валидности email
  void validateEmail() {
    bool isValid = EmailValidator.validate(inputValue);
    setState(() {
      if (isValid) {
        validationMessage = 'Valid email format';
        validationColor = Colors.green; // Устанавливаем зеленый цвет для валидного email
      } else {
        validationMessage = 'Invalid email format';
        validationColor = Colors.red; // Устанавливаем красный цвет для невалидного email
      }
    });
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
                  inputValue = value; // Обновляем переменную при изменении текста
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter your e-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                validateEmail(); // Вызываем функцию для проверки email
              },
              child: Text('Check Email'),
            ),
            SizedBox(height: 10.0),
            Text(
              validationMessage,
              style: TextStyle(fontSize: 18.0, color: validationColor), // Устанавливаем цвет текста
            ),
          ],
        ),
      ),
    );
  }
}
