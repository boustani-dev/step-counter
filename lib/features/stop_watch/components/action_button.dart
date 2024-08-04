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
        if (state.status is StopWatchInitial) {
          return buildInitialButton(context);
        }
        if (state.status is StopWatchRunning) {
          return buildPlayingButton(context);
        }
        if (state.status is StopWatchPaused) {
          return buildPlayingButton(context);
        }
        if (state.status is StopWatchStopped) {
          return buildInitialButton(context);
        }
        return const SizedBox.shrink();
      },
      listener: (context, state) {},
    );
    // return buildPlayingButton();
  }

  Widget buildPlayingButton(BuildContext context) {
    return BlocBuilder<StopWatchBloc, StopWatchState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.status is StopWatchStopped ||
                state.status is StopWatchPaused)
              Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 6,
                        offset: Offset(0, 0))
                  ], shape: BoxShape.circle, color: AppColors.primary),
                  child: IconButton(
                      onPressed: () {
                        context
                            .read<StopWatchBloc>()
                            .add(const OnResumedTimer());
                      },
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                      ))),
            if (state.status is StopWatchRunning)
              Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 6,
                        offset: Offset(0, 0))
                  ], shape: BoxShape.circle, color: AppColors.primary),
                  child: IconButton(
                      onPressed: () {
                        context
                            .read<StopWatchBloc>()
                            .add(const OnPausedTimer());
                      },
                      icon: const Icon(
                        Icons.pause,
                        color: Colors.white,
                      ))),
            const SizedBox(width: 20),
            Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 6,
                      offset: Offset(0, 0))
                ], shape: BoxShape.circle, color: AppColors.primary),
                child: IconButton(
                    onPressed: () {
                      context.read<StopWatchBloc>().add(const OnResetTimer());
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ))),
          ],
        );
      },
    );
  }

  Widget buildInitialButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.primary),
          child: IconButton(
            onPressed: () {
              context.read<StopWatchBloc>().add(OnStartedTimer(duration));
            },
            icon: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
