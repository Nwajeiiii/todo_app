// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapterAdapter extends TypeAdapter<TaskAdapter> {
  @override
  final int typeId = 0;

  @override
  TaskAdapter read(BinaryReader reader) {
    return TaskAdapter();
  }

  @override
  void write(BinaryWriter writer, TaskAdapter obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
