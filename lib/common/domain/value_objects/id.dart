import 'package:ddd_booking_app/common/domain/value_object.dart';
import 'package:uuid/uuid.dart';

class Id extends ValueObject<String> {
  const Id._(super.value);

  factory Id() => Id._(const Uuid().v4());
}
