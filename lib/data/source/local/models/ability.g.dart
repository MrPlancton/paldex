// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AbilityHiveModelAdapter extends TypeAdapter<AbilityHiveModel> {
  @override
  final int typeId = 6;

  @override
  AbilityHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AbilityHiveModel()
      ..level = fields[0] as int
      ..name = fields[1] as String
      ..type = fields[2] as String
      ..cooldown = fields[3] as int
      ..power = fields[4] as int
      ..description = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, AbilityHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.cooldown)
      ..writeByte(4)
      ..write(obj.power)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbilityHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
