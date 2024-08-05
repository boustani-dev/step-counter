import 'package:equatable/equatable.dart';

import '../../../data/model/workout.dart';

abstract class HistoryStatus extends Equatable {
  const HistoryStatus();
  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryStatus {
  const HistoryInitial();
  @override
  List<Object> get props => [];
}

class HistoryLoaded extends HistoryStatus {
  final List<Workout> workouts;
  const HistoryLoaded({required this.workouts});
  @override
  List<Object> get props => [];
}

class HistoryError extends HistoryStatus {
  final String message;
  const HistoryError({required this.message});
  @override
  List<Object> get props => [];
}
