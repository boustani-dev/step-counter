import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_counter/core/colors.dart';
import 'package:step_counter/data/model/workout.dart';
import 'package:step_counter/features/history/view/history_screen.dart';
import 'package:step_counter/features/step_counter/component/step_counter.dart';
import 'package:step_counter/features/stop_watch/components/action_button.dart';
import 'package:step_counter/features/stop_watch/components/workout_list.dart';
import '../data/provider/mock_data_base.dart';
import '../features/stop_watch/components/stopwatch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Workout currentWorkout = MockDataBase.workouts[0];
  void onSelectWorkout(workout) {
    setState(() {
      currentWorkout = workout;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Container(
                      height: size.height / 3,
                      width: size.width,
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(180),
                              bottomLeft: Radius.circular(180))),
                    ),
                  ),
                  Container(
                    height: size.height / 3,
                    width: size.width,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                              offset: Offset(0, 0))
                        ],
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(180),
                            bottomLeft: Radius.circular(180))),
                  ),
                  buildHistoryButton(context),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const StepCounter(),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        StopWatch(
                          initValue: currentWorkout.time,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        ActionButton(
                          duration: currentWorkout.time,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        workoutList(
                          onTapWorkOut: onSelectWorkout,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildHistoryButton(BuildContext context) {
    return Positioned(
      left: 15,
      top: 15,
      child: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white54),
        child: IconButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(HistoryScreen.routeName);
              Navigator.pushNamed(context, HistoryScreen.routeName);
            },
            icon: const Icon(
              Icons.history,
              color: AppColors.secondary,
            )),
      ),
    );
  }
}
