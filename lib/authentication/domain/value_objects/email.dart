import 'package:ddd_booking_app/common/domain/value_object.dart';
import 'package:result_dart/result_dart.dart';

class Email extends ValueObject<String> {
  const Email._(super.value);

  static Result<Email, EmailException> getInstance(String input) {
    final email = input.trim();

    if (email.isEmpty) {
      return Result.failure(const EmptyEmailException());
    }

    final regExp = RegExp(r"^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+");
    if (regExp.hasMatch(email)) {
      return Result.success(Email._(input));
    }

    return Result.failure(const InvalidEmailException());
  }
}

sealed class EmailException implements Exception {
  const EmailException();
}

class EmptyEmailException implements EmailException {
  const EmptyEmailException();
}

class InvalidEmailException implements EmailException {
  const InvalidEmailException();
}
