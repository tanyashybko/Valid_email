import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:valid_email/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.cat).existsSync(), isTrue);
    expect(File(Images.dog).existsSync(), isTrue);
    expect(File(Images.star).existsSync(), isTrue);
  });
}
