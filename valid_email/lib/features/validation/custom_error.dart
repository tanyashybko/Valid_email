sealed class CustomError {}
sealed class MyEmailError extends CustomError {}
sealed class MyPhoneError extends CustomError {}

class EmailFormatError extends MyEmailError {}
class EmailEmptyError extends MyEmailError {}
class EmailAtSign extends MyEmailError {}

class PhoneFormatError extends MyPhoneError {}
class PhoneEmptyError extends MyPhoneError {}
class PhonePlusSign extends MyPhoneError {}
class PhoneLongNumber extends MyPhoneError {}
class PhoneShortNumber extends MyPhoneError {}

class InvalidCharacters extends CustomError{}

