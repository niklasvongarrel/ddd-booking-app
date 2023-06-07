import 'package:ddd_booking_app/common/domain/value_object.dart';
import 'package:result_dart/result_dart.dart';

class Password extends ValueObject<String> {
  static const minimumLength = 8;

  const Password._(super.value);

  static Result<Password, PasswordException> getInstance(String input) {
    final password = input.trim();

    if (password.isEmpty) {
      return Result.failure(const EmptyPasswordException());
    }

    if (password.length < minimumLength) {
      return Result.failure(const PasswordTooShortException());
    }

    return Result.success(Password._(input));
  }
}

sealed class PasswordException implements Exception {
  const PasswordException();
}

class EmptyPasswordException implements PasswordException {
  const EmptyPasswordException();
}

class PasswordTooShortException implements PasswordException {
  const PasswordTooShortException();
}