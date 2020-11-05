import 'package:mockito/mockito.dart';
import 'package:some_testing/classes/cat.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock class
class MockCat extends Mock implements Cat {}

// Create mock object.
var cat = MockCat();

void main() {
  test('test cat', () {
    // Unstubbed methods return null.
    expect(cat.sound(), null);

    // Stub a mock method before interacting.
    when(cat.sound()).thenReturn("Purr");
    expect(cat.sound(), "Purr");

    // You can call it again.
    expect(cat.sound(), "Purr");

    // Let's change the stub.
    when(cat.sound()).thenReturn("Meow");
    expect(cat.sound(), "Meow");

    // You can stub getters.
    when(cat.lives).thenReturn(9);
    expect(cat.lives, 9);

    // You can stub a method to throw.
    when(cat.lives).thenThrow(RangeError('Boo'));
    expect(() => cat.lives, throwsRangeError);

    // We can calculate a response at call time.
    var responses = ["Purr", "Meow"];
    when(cat.sound()).thenAnswer((_) => responses.removeAt(0));
    expect(cat.sound(), "Purr");
    expect(cat.sound(), "Meow");
  });
}
