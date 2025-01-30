import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

/// Use Case: Adds a new task
class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  /// Calls the repository to add a task
  Future<void> call(Task task) async {
    return await repository.addTask(task);
  }
}
