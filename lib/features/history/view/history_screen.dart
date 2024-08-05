import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/core/utils/loading_kit.dart';
import 'package:step_counter/data/provider/isar_service.dart';
import 'package:step_counter/features/history/bloc/history_bloc.dart';
import 'package:step_counter/features/history/bloc/history_status.dart';
import 'package:step_counter/features/stop_watch/components/workout_list.dart';

import '../../../core/colors.dart';
import '../../../data/model/workout.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(),
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text(
            'Workout History',
          ),
        ),
        body: BlocConsumer<HistoryBloc, HistoryState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state.status is HistoryInitial) {
              return Center(
                child: LoadingKit().loadingKit(),
              );
            }
            if (state.status is HistoryError) {
              return Center(
                child: Text(
                  (state.status as HistoryError).message,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount:
                            (state.status as HistoryLoaded).workouts.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              (state.status as HistoryLoaded)
                                  .workouts[index]
                                  .name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            subtitle: Text(
                              (state.status as HistoryLoaded)
                                  .workouts[index]
                                  .description,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 13),
                            ),
                            // leading: Icon(
                            //   (state.status as HistoryLoaded)
                            //       .workouts[index]
                            //       .icon,
                            //   color: Colors.white,
                            // ),
                            trailing: Text(
                              '${(state.status as HistoryLoaded).workouts[index].time}sec',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          );
                        }),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
