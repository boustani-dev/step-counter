import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

part 'workout.g.dart';

@Collection()
class Workout {
  Id id = Isar.autoIncrement;
  String name;
  String description;
  int time;
  @ignore
  IconData? icon;

  Workout({
    required this.name,
    required this.description,
    required this.time,
    this.icon,
  });
}
