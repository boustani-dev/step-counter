part of 'stop_watch_bloc.dart';

sealed class StopWatchEvent extends Equatable {
  const StopWatchEvent();
}

class OnStartedTimer extends StopWatchEvent {
  const OnStartedTimer(this.duration);
  final int duration;
  @override
  List<Object> get props => [duration];
}

class OnResetTimer extends StopWatchEvent {
  const OnResetTimer();
  @override
  List<Object> get props => [];
}

class OnPausedTimer extends StopWatchEvent {
  const OnPausedTimer();
  @override
  List<Object> get props => [];
}

class OnResumedTimer extends StopWatchEvent {
  const OnResumedTimer();
  @override
  List<Object> get props => [];
}

class OnStoppedTimer extends StopWatchEvent {
  const OnStoppedTimer();
  @override
  List<Object> get props => [];
}

class OnChangeDuration extends StopWatchEvent {
  const OnChangeDuration({required this.duration});
  final int duration;
  @override
  List<Object> get props => [];
}

class TimerTicked extends StopWatchEvent {
  const TimerTicked({required this.duration});
  final int duration;

  @override
  // TODO: implement props
  List<Object?> get props => [duration];
}
