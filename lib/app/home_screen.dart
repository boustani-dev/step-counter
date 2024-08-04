import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:step_counter/core/colors.dart';
import 'package:step_counter/data/model/provider/mock_data_base.dart';
import 'package:step_counter/data/model/workout.dart';
import 'package:step_counter/features/stop_watch/components/action_button.dart';
import 'package:step_counter/features/stop_watch/components/workout_list.dart';
import '../features/stop_watch/components/stopwatch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Steps',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 55),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '1145',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const StopWatch(),
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
}
