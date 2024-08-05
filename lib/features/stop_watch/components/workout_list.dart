import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/features/history/bloc/history_bloc.dart';

import '../../../core/colors.dart';
import '../../../data/model/workout.dart';
import '../../../data/provider/mock_data_base.dart';
import '../bloc/stop_watch_bloc.dart';

class workoutList extends StatefulWidget {
  final Function(Workout) onTapWorkOut;
  const workoutList({
    super.key,
    required this.onTapWorkOut,
  });

  @override
  State<workoutList> createState() => _workoutListState();
}

class _workoutListState extends State<workoutList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var workout = MockDataBase.workouts;
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index ? Colors.white24 : Colors.white10,
                border: Border.all(
                    color: selectedIndex == index
                        ? Colors.white54
                        : Colors.white24)),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onTapWorkOut(workout[index]);
                context
                    .read<StopWatchBloc>()
                    .add(OnChangeDuration(duration: workout[index].time));
                context
                    .read<StopWatchBloc>()
                    .add(OnStartedTimer(workout[index].time));

                ///added a workout to history database
                BlocProvider.of<HistoryBloc>(context)
                    .add(OnAddWorkout(workout[index]));
              },
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                title: Text(
                  workout[index].name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  workout[index].description,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 13),
                ),
                leading: Icon(
                  workout[index].icon,
                  color: Colors.white,
                ),
                trailing: Text(
                  '${workout[index].time}sec',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: MockDataBase.workouts.length);
  }
}
