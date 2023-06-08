import 'package:ddd_booking_app/workspace/domain/value_objects/capacity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Capacity', () {
    test('getInstance returns success result for valid capacity', () {
      const input = 1;

      final result = Capacity.getInstance(input);

      expect(result.isSuccess(), true);
      expect(result.getOrThrow().value, input);
    });

    test('getInstance returns failure result for invalid capacity', () {
      const input = 0;

      final result = Capacity.getInstance(input);

      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<InvalidCapacityException>());
    });

    test('getInstance returns failure result for invalid capacity', () {
      const input = -1;

      final result = Capacity.getInstance(input);

      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<InvalidCapacityException>());
    });
  });
}
