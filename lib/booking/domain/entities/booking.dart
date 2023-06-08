import 'package:ddd_booking_app/common/domain/aggregates/time_range.dart';
import 'package:ddd_booking_app/common/domain/entity.dart';
import 'package:ddd_booking_app/user/domain/entity/employee.dart';
import 'package:ddd_booking_app/workspace/domain/entities/desk.dart';
import 'package:ddd_booking_app/workspace/domain/entities/room.dart';
import 'package:ddd_booking_app/workspace/domain/entities/workspace.dart';
import 'package:equatable/equatable.dart';
import 'package:result_dart/result_dart.dart';

// Another solution would be to have DeskBooking and RoomBooking classes
class Booking extends Entity with EquatableMixin {
  Booking._({
    required this.workspace,
    required this.employees,
    required this.timeRange,
  });

  static Result<Booking, BookingException> getInstance({
    required Workspace workspace,
    required List<Employee> employees,
    required TimeRange timeRange,
  }) {
    if (employees.isEmpty) {
      return Result.failure(const NoEmployeesException());
    } else if (workspace is Desk && employees.length != 1) {
      return Result.failure(const OnlyOneEmployeePerDeskException());
    } else if (workspace is Room &&
        employees.length > workspace.capacity.value) {
      return Result.failure(const NotEnoughCapacityException());
    } else {
      return Result.success(
        Booking._(
          workspace: workspace,
          employees: employees,
          timeRange: timeRange,
        ),
      );
    }
  }

  final Workspace workspace;
  final List<Employee> employees;
  final TimeRange timeRange;

  @override
  List<Object?> get props => throw UnimplementedError();
}

sealed class BookingException implements Exception {
  const BookingException();
}

class NoEmployeesException extends BookingException {
  const NoEmployeesException();
}

class OnlyOneEmployeePerDeskException extends BookingException {
  const OnlyOneEmployeePerDeskException();
}

class NotEnoughCapacityException extends BookingException {
  const NotEnoughCapacityException();
}
