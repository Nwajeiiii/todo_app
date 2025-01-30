/// Represents a Task entity in the Domain Layer.
/// This is the core model used throughout the application.
class Task {
  final String id;          // Unique identifier for the task
  final String title;       // Task title
  final String description; // Task details
  final bool isCompleted;   // Whether the task is completed
  final String category;    // Category (e.g., Personal, Work)

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.category,
  });

  /// Creates a copy of this task with updated properties.
  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    String? category,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      category: category ?? this.category,
    );
  }

  /// Converts the Task object to a Map for Hive storage.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'category': category,
    };
  }

  /// Creates a Task object from a Map (useful for Hive retrieval).
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'],
      category: map['category'],
    );
  }
}
