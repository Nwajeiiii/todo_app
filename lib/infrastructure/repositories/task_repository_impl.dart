import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../data_sources/task_local_data_source.dart';

/// Repository Implementation for handling Task operations
class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<List<Task>> getTasks() async {
    return await localDataSource.getTasks();
  }

  @override
  Future<void> addTask(Task task) async {
    await localDataSource.addTask(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    await localDataSource.updateTask(task);
  }

  @override
  Future<void> deleteTask(String id) async {
    await localDataSource.deleteTask(id);
  }
}
