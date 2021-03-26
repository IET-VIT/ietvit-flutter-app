import 'package:floor/floor.dart';
import 'package:ietvit_app/entities/Task.dart';

@dao
abstract class TaskDao{

  @insert
  Future<void> insertTask(Task task);

  @Query("DELETE FROM taskDb")
  Future<void> clearTaskDb();

  @Query("SELECT * FROM taskDb")
  Stream<List<Task>> loadAllTasks();

  // @Query("SELECT COUNT(*) FROM taskDb WHERE Status = 'Not Done'")
  // Stream<int> countUndoneTasks();
  //
  // @Query("UPDATE taskDb SET Status = 'Done' WHERE primary_key = :key")
  // Stream<void> updateTaskDone(int key);

}