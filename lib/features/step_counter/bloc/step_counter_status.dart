import 'package:equatable/equatable.dart';

abstract class StepCounterStatus extends Equatable {}

final class StepCounterInitialState extends StepCounterStatus {
  @override
  List<Object?> get props => [];
}

final class StepCounterSuccessState extends StepCounterStatus {
  final int steps;
  StepCounterSuccessState(this.steps);
  @override
  List<Object?> get props => [steps];
}

final class StepCounterErrorState extends StepCounterStatus {
  final String error;
  StepCounterErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
