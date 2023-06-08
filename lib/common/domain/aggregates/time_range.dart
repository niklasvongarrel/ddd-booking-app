import 'package:equatable/equatable.dart';
import 'package:result_dart/result_dart.dart';

class TimeRange extends Equatable {
  const TimeRange._({
    required this.start,
    required this.end,
  });

  static Result<TimeRange, TimeRangeException> getInstance({
    required DateTime start,
    required DateTime end,
  }) {
    if (start.isBefore(DateTime.now())) {
      return Result.failure(const StartInPastException());
    }

    if (end.isBefore(DateTime.now())) {
      return Result.failure(const EndInPastException());
    }

    if (start.isAfter(end)) {
      return Result.failure(const StartAfterEndException());
    }

    return Result.success(
      TimeRange._(
        start: start,
        end: end,
      ),
    );
  }

  final DateTime start;
  final DateTime end;

  @override
  List<Object?> get props => [start, end];
}

sealed class TimeRangeException implements Exception {
  const TimeRangeException();
}

class StartInPastException implements TimeRangeException {
  const StartInPastException();
}

class EndInPastException implements TimeRangeException {
  const EndInPastException();
}

class StartAfterEndException implements TimeRangeException {
  const StartAfterEndException();
}
