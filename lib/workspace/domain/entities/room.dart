import 'package:ddd_booking_app/workspace/domain/entities/workspace.dart';
import 'package:ddd_booking_app/workspace/domain/value_objects/capacity.dart';

class Room extends Workspace {
  Room({
    required super.location,
    required super.floor,
    required this.capacity,
  });

  final Capacity capacity;
}
