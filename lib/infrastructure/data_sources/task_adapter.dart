import 'package:hive/hive.dart';
import '../../domain/entities/task.dart';

part 'task_adapter.g.dart'; // Hive will generate this file

/// Hive Adapter for Task Entity
@HiveType(typeId: 0)
class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    return Task(
      id: reader.readString(),
      title: reader.readString(),
      description: reader.readString(),
      isCompleted: reader.readBool(),
      category: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.description);
    writer.writeBool(obj.isCompleted);
    writer.writeString(obj.category);
  }
}
