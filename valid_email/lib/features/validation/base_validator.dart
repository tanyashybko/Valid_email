import 'custom_error.dart';

abstract class BaseValidator<T> {
  CustomError? validate(T data);
}
