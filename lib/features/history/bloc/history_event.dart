part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {}

class OnAddWorkout extends HistoryEvent {
  final Workout workout;
  OnAddWorkout(this.workout);
  @override
  List<Object?> get props => [workout];
}

class OnGetWorkouts extends HistoryEvent {
  @override
  List<Object?> get props => [];
}
