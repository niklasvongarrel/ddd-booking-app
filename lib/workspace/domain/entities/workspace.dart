import 'package:ddd_booking_app/common/domain/entity.dart';
import 'package:ddd_booking_app/workspace/domain/other_objects/location.dart';
import 'package:equatable/equatable.dart';

abstract class Workspace extends Entity with EquatableMixin {
  Workspace({
    required this.location,
    required this.floor,
  });

  final Location location;
  final int floor;

  @override
  List<Object?> get props => [id, location, floor];
}