import 'package:ddd_booking_app/common/domain/aggregates/time_range.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  final tomorrow = DateTime.now().add(const Duration(days: 1));
  final twoDaysFromNow = DateTime.now().add(const Duration(days: 2));

  group('TimeRange', () {
    test('getInstance returns success result for valid time range', () {
      final start = tomorrow;
      final end = twoDaysFromNow;

      final result = TimeRange.getInstance(start: start, end: end);

      expect(result.isSuccess(), true);
      expect(result.getOrThrow().start, start);
      expect(result.getOrThrow().end, end);
    });

    test('getInstance returns failure result for start in the past', () {
      final start = yesterday;
      final end = twoDaysFromNow;

      final result = TimeRange.getInstance(start: start, end: end);

      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<StartInPastException>());
    });

    test('getInstance returns failure result for end in the past', () {
      final start = tomorrow;
      final end = yesterday;

      final result = TimeRange.getInstance(start: start, end: end);

      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<EndInPastException>());
    });

    test('getInstance returns failure result for start after end', () {
      final start = twoDaysFromNow;
      final end = tomorrow;

      final result = TimeRange.getInstance(start: start, end: end);

      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<StartAfterEndException>());
    });
  });
}
