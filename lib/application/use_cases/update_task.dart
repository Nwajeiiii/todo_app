import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

/// Use Case: Updates an existing task
class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  /// Calls the repository to update a task
  Future<void> call(Task task) async {
    return await repository.updateTask(task);
  }
}
