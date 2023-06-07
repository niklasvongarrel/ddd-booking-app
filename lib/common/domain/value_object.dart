import 'package:equatable/equatable.dart';

abstract class ValueObject<T> extends Equatable {
  const ValueObject(this.value);

  final T value;

  T toJson() => value;

  @override
  String toString() => value.toString();

  @override
  List<Object?> get props => [value];
}
