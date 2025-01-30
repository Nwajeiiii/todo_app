import 'package:hive/hive.dart';
import '../../domain/entities/task.dart';

/// Data source for handling local storage using Hive
class TaskLocalDataSource {
  static const String boxName = "tasksBox";

  /// Opens the Hive box for storing tasks
  Future<Box> _openBox() async {
    return await Hive.openBox<Task>(boxName);
  }

  /// Retrieves all tasks from Hive
  Future<List<Task>> getTasks() async {
    final box = await _openBox();
    return box.values.cast<Task>().toList();
  }

  /// Adds a new task to Hive
  Future<void> addTask(Task task) async {
    final box = await _openBox();
    await box.put(task.id, task);
  }

  /// Updates an existing task in Hive
  Future<void> updateTask(Task task) async {
    final box = await _openBox();
    await box.put(task.id, task); // Since Hive uses key-value storage
  }

  /// Deletes a task from Hive
  Future<void> deleteTask(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
