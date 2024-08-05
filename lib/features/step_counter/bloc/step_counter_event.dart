part of 'step_counter_bloc.dart';

sealed class StepCounterEvent extends Equatable {}

class OnStepCounterChange extends StepCounterEvent {
  final int steps;
  OnStepCounterChange(this.steps);
  @override
  List<Object> get props => [steps];
}

class OnLoadPedometerData extends StepCounterEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
