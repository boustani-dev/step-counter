import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/core/colors.dart';
import 'package:step_counter/features/stop_watch/bloc/stop_watch_bloc.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return BlocConsumer<StopWatchBloc, StopWatchState>(
      listener: (context, state) {
        if (state.status.duration == 0) {
          /// Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
      builder: (context, state) {
        const int totalDuration = 100; // Replace with the actual total duration
        double progressValue = state.status.duration / totalDuration;
        return SizedBox(
          height: size.height / 4.5,
          width: size.height / 4.5,
          child: Stack(
            children: [
              Container(
                height: size.height / 4.5,
                width: size.height / 4.5,
                decoration: const BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle),
                child: CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 30,
                  strokeCap: StrokeCap.butt,
                  backgroundColor: Colors.white,
                  color: AppColors.secondary.withOpacity(0.8),
                ),
              ),
              Positioned(
                top: 80,
                left: 83,
                child: Text(
                  state.status.duration.toString(),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
