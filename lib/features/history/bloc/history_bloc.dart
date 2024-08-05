import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:step_counter/data/provider/isar_service.dart';
import 'package:step_counter/features/history/bloc/history_status.dart';

import '../../../data/model/workout.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  IsarServices isarServices = IsarServices();
  HistoryBloc() : super(const HistoryState(status: HistoryInitial())) {
    on<OnAddWorkout>(_onAddWorkout);
    on<OnGetWorkouts>(_onGetWorkout);
  }

  Future<void> _onGetWorkout(
      OnGetWorkouts event, Emitter<HistoryState> emit) async {
    emit(state.copyWith(newStatus: const HistoryInitial()));
    try {
      final workouts = await isarServices.getWorkouts();
      emit(state.copyWith(newStatus: HistoryLoaded(workouts: workouts)));
    } catch (_) {
      emit(state.copyWith(
          newStatus: const HistoryError(message: 'loading workout error')));
    }
  }

  Future<void> _onAddWorkout(
      OnAddWorkout event, Emitter<HistoryState> emit) async {
    try {
      await isarServices.insertWorkout(event.workout);
    } catch (_) {
      emit(state.copyWith(newStatus: const HistoryError(message: 'Error')));
    }
  }
}
