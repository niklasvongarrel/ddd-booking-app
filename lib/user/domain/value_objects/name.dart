import 'package:ddd_booking_app/common/domain/value_object.dart';
import 'package:result_dart/result_dart.dart';

class Name extends ValueObject<String> {
  const Name._(super.value);

  static Result<Name, NameException> getInstance(String input) {
    if (input.isEmpty) {
      return Result.failure(const EmptyNameException());
    } else {
      return Result.success(Name._(input));
    }
  }
}

sealed class NameException implements Exception {
  const NameException();
}

class EmptyNameException extends NameException {
  const EmptyNameException();
}
