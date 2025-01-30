import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../providers/task_provider.dart';
import '../pages/edit_task_page.dart';

/// Task UI component
class TaskTile extends ConsumerWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNotifier = ref.watch(taskListProvider.notifier);

    return Card(
      color: task.isCompleted ? Colors.blue[100] : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      elevation: 1,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (bool? newValue) {
            if (newValue != null) {
              final updatedTask = task.copyWith(isCompleted: newValue);
              taskNotifier.updateTask(updatedTask);
            }
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: task.isCompleted ? Colors.grey : Colors.blue[800],
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          task.description,
          style: TextStyle(fontSize: 14, color: Colors.blueGrey),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditTaskPage(task: task)),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => taskNotifier.deleteTask(task.id),
            ),
          ],
        ),
      ),
    );
  }
}
