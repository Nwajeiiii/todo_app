import '../../domain/repositories/task_repository.dart';

/// Use Case: Deletes a task
class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  /// Calls the repository to delete a task
  Future<void> call(String taskId) async {
    return await repository.deleteTask(taskId);
  }
}
