import 'package:ddd_booking_app/common/domain/value_objects/id.dart';

abstract class Entity {
  Entity() : id = Id();

  final Id id;
}
