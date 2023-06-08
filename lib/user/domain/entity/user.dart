import 'package:ddd_booking_app/common/domain/entity.dart';
import 'package:ddd_booking_app/user/domain/value_objects/name.dart';
import 'package:equatable/equatable.dart';

class User extends Entity with EquatableMixin {
  User({
    required this.name,
  });

  final Name name;

  @override
  List<Object?> get props => [id, name];
}
