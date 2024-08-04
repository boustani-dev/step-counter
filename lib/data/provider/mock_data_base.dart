import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/workout.dart';

class MockDataBase {
  static final List<Workout> workouts = [
    Workout(
      name: "Push-ups",
      description: "An exercise to strengthen upper body.",
      time: 20,
      icon: CupertinoIcons.hand_raised,
    ),
    Workout(
      name: "Squats",
      description: "An exercise to strengthen legs and glutes.",
      time: 15,
      icon: CupertinoIcons.person_2_square_stack,
    ),
    Workout(
      name: "Plank",
      description: "An exercise to strengthen core muscles.",
      time: 60,
      icon: CupertinoIcons.rectangle_stack,
    ),
    Workout(
      name: "Lunges",
      description: "An exercise to improve balance and strengthen legs.",
      time: 35,
      icon: CupertinoIcons.arrow_down_right_circle,
    ),
    Workout(
      name: "Burpees",
      description: "A full body exercise to build strength and endurance.",
      time: 45,
      icon: CupertinoIcons.flame,
    ),
    Workout(
      name: "Mountain Climbers",
      description: "A cardio exercise to strengthen the core and legs.",
      time: 40,
      icon: Icons.landscape,
    ),
    Workout(
      name: "Bicycle Crunches",
      description: "An exercise to target the abs and obliques.",
      time: 60,
      icon: Icons.directions_bike,
    ),
    Workout(
      name: "Jumping Jacks",
      description: "A cardio exercise to improve cardiovascular fitness.",
      time: 20,
      icon: CupertinoIcons.heart,
    ),
    Workout(
      name: "High Knees",
      description:
          "A cardio exercise to engage the core and improve endurance.",
      time: 12,
      icon: CupertinoIcons.arrow_up,
    ),
    Workout(
      name: "Tricep Dips",
      description: "An exercise to strengthen the triceps and upper body.",
      time: 20,
      icon: CupertinoIcons.person,
    ),
    Workout(
      name: "Leg Raises",
      description: "An exercise to target the lower abdominal muscles.",
      time: 25,
      icon: CupertinoIcons.ellipsis_vertical,
    ),
    Workout(
      name: "Russian Twists",
      description: "An exercise to work the obliques and strengthen the core.",
      time: 30,
      icon: CupertinoIcons.arrow_2_circlepath,
    ),
  ];
}
