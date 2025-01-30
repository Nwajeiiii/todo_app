import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';
import 'add_task_page.dart';

/// Home page displaying tasks
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);

    /// Separate tasks by category
    final personalTasks = taskList.where((task) => task.category == "Personal").toList();
    final workTasks = taskList.where((task) => task.category == "Work").toList();

    return Scaffold(
      appBar: AppBar(title: Text("To-Do List")),
      body: taskList.isEmpty
          ? Center(child: Icon(Icons.task, size: 144,))
          : ListView(
        children: [
          if (personalTasks.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("Personal Tasks", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ...personalTasks.map((task) => TaskTile(task: task)),
          ],
          if (workTasks.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("Work Tasks", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ...workTasks.map((task) => TaskTile(task: task)),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddTaskPage())),
        child: Icon(Icons.add),
      ),
    );
  }
}
