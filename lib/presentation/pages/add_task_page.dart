import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/task.dart';
import '../providers/task_provider.dart';

/// Screen for adding a new task
class AddTaskPage extends ConsumerWidget {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _uuid = Uuid();
  final ValueNotifier<String> _selectedCategory = ValueNotifier<String>("Personal");

  AddTaskPage({super.key}); // Category Selection

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNotifier = ref.watch(taskListProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Task Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: "Task Description",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 12),

            /// Dropdown for selecting category with improved styling
            ValueListenableBuilder<String>(
              valueListenable: _selectedCategory,
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
                      _selectedCategory.value = newValue;
                    }
                  },
                );
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  final task = Task(
                    id: _uuid.v4(),
                    title: _titleController.text,
                    description: _descriptionController.text,
                    category: _selectedCategory.value, // Save selected category
                  );
                  taskNotifier.addTask(task);
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text("Add Task", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
