import '../entities/task.dart';

/// Abstract repository for handling task-related operations.
/// The actual implementation will be in the Infrastructure Layer.
abstract class TaskRepository {
  /// Fetches all tasks from the data source.
  Future<List<Task>> getTasks();

  /// Adds a new task to the data source.
  Future<void> addTask(Task task);

  /// Updates an existing task in the data source.
  Future<void> updateTask(Task task);

  /// Deletes a task from the data source.
  Future<void> deleteTask(String id);
}
