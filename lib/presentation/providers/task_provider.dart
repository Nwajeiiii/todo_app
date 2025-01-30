import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../../infrastructure/data_sources/task_local_data_source.dart';

/// Provider for managing task storage
final taskStorageProvider = Provider((ref) => TaskLocalDataSource());

/// Provider for managing task list state
final taskListProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  final storage = ref.watch(taskStorageProvider);
  return TaskNotifier(storage);
});

/// Task Notifier for managing task operations
class TaskNotifier extends StateNotifier<List<Task>> {
  final TaskLocalDataSource storage;

  TaskNotifier(this.storage) : super([]) {
    loadTasks(); // Load tasks on initialization
  }

  /// Load tasks from storage
  Future<void> loadTasks() async {
    final tasks = await storage.getTasks();
    state = tasks;
  }

  /// Add a new task
  Future<void> addTask(Task task) async {
    await storage.addTask(task);
    state = [...state, task]; // Update state
  }

  /// Update an existing task
  Future<void> updateTask(Task updatedTask) async {
    await storage.updateTask(updatedTask);
    state = state.map((task) => task.id == updatedTask.id ? updatedTask : task).toList();
  }

  /// Delete a task
  Future<void> deleteTask(String id) async {
    await storage.deleteTask(id);
    state = state.where((task) => task.id != id).toList();
  }
}
