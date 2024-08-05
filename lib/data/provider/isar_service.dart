import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:step_counter/data/model/workout.dart';

class IsarServices {
  late Future<Isar> db;

  IsarServices() {
    db = _initDb();
  }

  Future<Isar> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [WorkoutSchema],
      directory: dir.path,
      inspector: true,
    );
    return isar;
  }

  Future<void> insertWorkout(Workout workout) async {
    final isar = await db;
    isar.writeTxnSync<int>(
      () => isar.workouts.putSync(workout),
    );
  }

  Future<List<Workout>> getWorkouts() async {
    final isar = await db;
    return await isar.workouts.where().findAll();
  }
}
