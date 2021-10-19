// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoDbAdapter extends TypeAdapter<TodoDb> {
  @override
  final int typeId = 0;

  @override
  TodoDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoDb(
      title: fields[0] as String,
      subject: fields[1] as String,
      date: fields[2] as String,
      themeIndex: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TodoDb obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subject)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.themeIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
