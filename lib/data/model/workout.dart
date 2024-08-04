import 'package:flutter/cupertino.dart';

class Workout {
  String name;
  String description;
  int time;
  IconData icon;

  Workout({
    required this.name,
    required this.description,
    required this.time,
    required this.icon,
  });
}
