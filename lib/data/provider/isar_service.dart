import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:step_counter/data/model/workout.dart';

class IsarServices {
  // Singleton pattern implementation
  static final IsarServices _instance = IsarServices._internal();
  factory IsarServices() => _instance;
  IsarServices._internal();

  Future<Isar>? _db;

  Future<Isar> get db async {
    _db ??= _initDb(); // Ensure initialization if not already done
    return _db!;
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
