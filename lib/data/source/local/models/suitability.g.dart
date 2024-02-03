// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suitability.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SuitabilityHiveModelAdapter extends TypeAdapter<SuitabilityHiveModel> {
  @override
  final int typeId = 2;

  @override
  SuitabilityHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SuitabilityHiveModel()
      ..type = fields[0] as String
      ..level = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, SuitabilityHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuitabilityHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
