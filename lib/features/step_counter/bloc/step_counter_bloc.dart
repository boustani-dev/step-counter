import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:step_counter/features/step_counter/bloc/step_counter_status.dart';

part 'step_counter_event.dart';
part 'step_counter_state.dart';

class StepCounterBloc extends Bloc<StepCounterEvent, StepCounterState> {
  late Stream<StepCount> _stepCountStream;
  int? _initialStepCount;
  StepCounterBloc()
      : super(StepCounterState(status: StepCounterInitialState())) {
    on<OnLoadPedometerData>(_onLoadPedometerData);
    on<OnStepCounterChange>(_onStepCountChanged);
    add(OnLoadPedometerData());
  }
  void _onLoadPedometerData(
      OnLoadPedometerData event, Emitter<StepCounterState> emit) async {
    bool granted = await _checkActivityRecognitionPermission();
    if (!granted) {
      emit(state.copyWith(
          newStatus: StepCounterErrorState('Permission not granted')));
      return;
    }

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen((event) {
      _initialStepCount ??= event.steps;
      add(OnStepCounterChange(event.steps));
    }).onError((error) {
      emit(state.copyWith(
          newStatus: StepCounterErrorState('Step Count not available')));
    });
  }

  void _onStepCountChanged(
      OnStepCounterChange event, Emitter<StepCounterState> emit) {
    final stepsSinceStart = event.steps - (_initialStepCount ?? 0);
    emit(state.copyWith(
      newStatus: StepCounterSuccessState(stepsSinceStart),
    ));
  }

  Future<bool> _checkActivityRecognitionPermission() async {
    bool granted = await Permission.activityRecognition.isGranted;
    if (!granted) {
      granted = await Permission.activityRecognition.request() ==
          PermissionStatus.granted;
    }
    return granted;
  }
}
