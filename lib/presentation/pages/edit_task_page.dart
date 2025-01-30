import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../providers/task_provider.dart';

/// Screen for editing a task
class EditTaskPage extends ConsumerWidget {
  final Task task;

  const EditTaskPage({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNotifier = ref.watch(taskListProvider.notifier);

    final titleController = TextEditingController(text: task.title);
    final descriptionController = TextEditingController(text: task.description);
    final ValueNotifier<String> selectedCategory = ValueNotifier<String>(task.category); // ✅ Preserve category

    return Scaffold(
      appBar: AppBar(title: Text("Edit Task")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Task Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: "Task Description",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 12),

            /// Allow users to edit the category with improved styling
            ValueListenableBuilder<String>(
              valueListenable: selectedCategory,
              builder: (context, value, child) {
                return DropdownButtonFormField<String>(
                  value: value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Category",
                    labelStyle: TextStyle(color: Colors.blue[800]), // Blue text
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2), // Blue border when focused
                    ),
                  ),
                  dropdownColor: Colors.blue[50], // Light blue background
                  items: ["Personal", "Work"].map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(
                        category,
                        style: TextStyle(
                          color: Colors.blue[900], // Darker blue text
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    if (newValue != null) {
                      selectedCategory.value = newValue;
                    }
                  },
                );
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  final updatedTask = task.copyWith(
                    title: titleController.text,
                    description: descriptionController.text,
                    category: selectedCategory.value, // Save updated category
                  );
                  taskNotifier.updateTask(updatedTask);
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text("Update Task", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
