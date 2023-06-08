import 'package:ddd_booking_app/common/domain/value_object.dart';
import 'package:result_dart/result_dart.dart';

class Capacity extends ValueObject<int> {
  const Capacity._(super.value);

  factory Capacity.fromJson(int json) => Capacity._(json);

  static Result<Capacity, CapacityException> getInstance(int input) {
    if (input < 1) {
      return Result.failure(const InvalidCapacityException());
    } else {
      return Result.success(Capacity._(input));
    }
  }
}

sealed class CapacityException implements Exception {
  const CapacityException();
}

class InvalidCapacityException extends CapacityException {
  const InvalidCapacityException();
}
