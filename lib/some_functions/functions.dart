import 'dart:math';

double add(double x, double y) {
  return x + y;
}

String randomStringFunction(int length) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(length, (index) => r.nextInt(33) + 89));
}
