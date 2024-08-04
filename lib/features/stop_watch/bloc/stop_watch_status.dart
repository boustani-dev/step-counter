import 'package:equatable/equatable.dart';

sealed class StopWatchStatus extends Equatable {
  const StopWatchStatus(this.duration);
  final int duration;
  @override
  List<Object> get props => [duration];
}

final class StopWatchInitial extends StopWatchStatus {
  const StopWatchInitial(super.duration);
}

final class StopWatchRunning extends StopWatchStatus {
  const StopWatchRunning(super.duration);
}

final class StopWatchPaused extends StopWatchStatus {
  const StopWatchPaused(super.duration);
}

final class StopWatchStopped extends StopWatchStatus {
  const StopWatchStopped(super.duration);
}
