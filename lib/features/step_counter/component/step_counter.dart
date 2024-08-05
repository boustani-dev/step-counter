import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/core/utils/loading_kit.dart';
import 'package:step_counter/features/step_counter/bloc/step_counter_bloc.dart';
import 'package:step_counter/features/step_counter/bloc/step_counter_status.dart';

class StepCounter extends StatelessWidget {
  const StepCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Steps',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 55),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<StepCounterBloc, StepCounterState>(
          builder: (context, state) {
            // final successState = state.status as StepCounterSuccessState;
            if (state.status is StepCounterInitialState) {
              return LoadingKit().loadingKit(isHorizontal: true);
            } else if (state.status is StepCounterSuccessState) {
              return Text(
                (state.status as StepCounterSuccessState).steps.toString(),
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              );
            } else {
              return Text(
                '0',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              );
            }
          },
        ),
      ],
    );
  }
}
