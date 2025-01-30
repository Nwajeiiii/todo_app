import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

/// Use Case: Retrieves all tasks
class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  /// Calls the repository to fetch tasks
  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}
