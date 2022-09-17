// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodModelAdapter extends TypeAdapter<MoodModel> {
  @override
  final int typeId = 1;

  @override
  MoodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodModel(
      mood: fields[0] as String,
      activity: fields[1] as String,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoodModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.mood)
      ..writeByte(1)
      ..write(obj.activity)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
