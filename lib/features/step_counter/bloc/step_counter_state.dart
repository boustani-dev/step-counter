part of 'step_counter_bloc.dart';

class StepCounterState extends Equatable {
  final StepCounterStatus status;
  const StepCounterState({required this.status});
  @override
  List<Object?> get props => [status];
  StepCounterState copyWith({StepCounterStatus? newStatus}) {
    return StepCounterState(status: newStatus ?? status);
  }
}
