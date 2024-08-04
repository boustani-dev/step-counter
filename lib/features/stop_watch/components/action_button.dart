import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/core/colors.dart';
import 'package:step_counter/features/stop_watch/bloc/stop_watch_bloc.dart';
import 'package:step_counter/features/stop_watch/bloc/stop_watch_status.dart';

enum ButtonType {
  initial,
  playing,
}

class ActionButton extends StatelessWidget {
  final int duration;
  const ActionButton({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StopWatchBloc, StopWatchState>(
      builder: (context, state) {
        if (state is StopWatchInitial) {
          return buildInitialButton();
        }
        if (state is StopWatchRunning) {
          return buildPlayingButton();
        }
        if (state is StopWatchPaused) {
          return buildPlayingButton();
        }
        if (state is StopWatchStopped) {
          return buildInitialButton();
        }
        return Container();
      },
      listener: (context, state) {},
    );
    // return buildPlayingButton();
  }

  Widget buildPlayingButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 6, offset: Offset(0, 0))
            ], shape: BoxShape.circle, color: AppColors.primary),
            child: IconButton(
                onPressed: () {
                  // context.read<StopWatchBloc>().add(OnStartedTimer(duration));
                },
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                ))),
        const SizedBox(width: 20),
        Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 6, offset: Offset(0, 0))
            ], shape: BoxShape.circle, color: AppColors.primary),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ))),
      ],
    );
  }

  Widget buildInitialButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primary),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_arrow_rounded,
              color: AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
