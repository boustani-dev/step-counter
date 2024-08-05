part of 'history_bloc.dart';

class HistoryState extends Equatable {
  final HistoryStatus status;

  const HistoryState({required this.status});

  HistoryState copyWith({HistoryStatus? newStatus}) {
    return HistoryState(status: newStatus ?? status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
