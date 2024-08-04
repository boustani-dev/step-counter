import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:step_counter/features/stop_watch/bloc/stop_watch_status.dart';
import '../ticker.dart';

part 'stop_watch_event.dart';
part 'stop_watch_state.dart';

class StopWatchBloc extends Bloc<StopWatchEvent, StopWatchState> {
  final Ticker _ticker;
  int duration = 60;
  StreamSubscription<int>? _tickerSubscription;

  StopWatchBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const StopWatchState(status: StopWatchInitial(60))) {
    on<OnStartedTimer>(_onStarted);
    on<TimerTicked>(_onTicked);
    on<OnPausedTimer>(_onPaused);
    on<OnResetTimer>(_onReset);
    on<OnResumedTimer>(_onResumed);
    on<OnChangeDuration>(_onChangeDuration);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(OnStartedTimer event, Emitter<StopWatchState> emit) {
    emit(state.copyWith(newStatus: StopWatchRunning(event.duration)));

    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  void _onPaused(OnPausedTimer event, Emitter<StopWatchState> emit) {
    if (state.status is StopWatchRunning) {
      _tickerSubscription?.pause();
      emit(state.copyWith(newStatus: StopWatchPaused(state.status.duration)));
    }
  }

  void _onResumed(OnResumedTimer event, Emitter<StopWatchState> emit) {
    if (state.status is StopWatchPaused) {
      _tickerSubscription?.resume();
      emit(state.copyWith(newStatus: StopWatchRunning(state.status.duration)));
    }
  }

  void _onReset(OnResetTimer event, Emitter<StopWatchState> emit) {
    _tickerSubscription?.cancel();
    emit(state.copyWith(newStatus: StopWatchInitial(duration)));
  }

  void _onChangeDuration(OnChangeDuration event, Emitter<StopWatchState> emit) {
    duration = event.duration;
    emit(state.copyWith(newStatus: StopWatchInitial(duration)));
  }

  void _onTicked(TimerTicked event, Emitter<StopWatchState> emit) {
    emit(
      event.duration > 0
          ? state.copyWith(newStatus: StopWatchRunning(event.duration))
          : state.copyWith(newStatus: StopWatchStopped(event.duration)),
    );
  }
}
