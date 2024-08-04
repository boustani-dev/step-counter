part of 'stop_watch_bloc.dart';

class StopWatchState extends Equatable {
  final StopWatchStatus status;
  const StopWatchState({required this.status});

  StopWatchState copyWith({StopWatchStatus? newStatus}) {
    return StopWatchState(status: newStatus ?? status);
  }

  List<Object> get props => [status];
}
