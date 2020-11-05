import 'package:some_testing/some_functions/functions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// dart is truly object oriented so we can mock functions like this
// an instance of a class with a "call" method,
// is a subtype of a function type, and as such, a subtype of Function.
class MockFunction extends Mock {
  double call(double x, double y);
}

void main() {
  group('test functions', () {
    test('add function', () {
      var actual = add(4, 4);
      expect(actual, 8);
      expect(true, actual is double);
    });

    test('random function', () {
      var rand = randomStringFunction(10);
      expect(true, rand is String);
      expect(rand.length, 10);
      expect(false, double.tryParse(rand) != null);
    });
  });

  group('mocked functions', () {
    test('lets mock a function with mockito', () {
      final double Function(double, double) add = MockFunction();
      when(add(4, 4)).thenReturn(42);

      expect(add(4, 4), equals(42));
    });
  });
}
