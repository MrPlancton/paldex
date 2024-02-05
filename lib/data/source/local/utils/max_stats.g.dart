// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'max_stats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaxStatsHiveModelAdapter extends TypeAdapter<MaxStatsHiveModel> {
  @override
  final int typeId = 7;

  @override
  MaxStatsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MaxStatsHiveModel()
      ..maxHp = fields[0] as int
      ..maxMeleeAttack = fields[1] as int
      ..maxShotAttack = fields[2] as int
      ..maxDefense = fields[3] as int
      ..maxSupport = fields[4] as int
      ..maxCraftSpeed = fields[5] as int
      ..maxSlowWalkSpeed = fields[6] as int
      ..maxWalkSpeed = fields[7] as int
      ..maxRunSpeed = fields[8] as int
      ..maxRideSprintSpeed = fields[9] as int
      ..maxTransportSpeed = fields[10] as int
      ..maxStamina = fields[11] as int;
  }

  @override
  void write(BinaryWriter writer, MaxStatsHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.maxHp)
      ..writeByte(1)
      ..write(obj.maxMeleeAttack)
      ..writeByte(2)
      ..write(obj.maxShotAttack)
      ..writeByte(3)
      ..write(obj.maxDefense)
      ..writeByte(4)
      ..write(obj.maxSupport)
      ..writeByte(5)
      ..write(obj.maxCraftSpeed)
      ..writeByte(6)
      ..write(obj.maxSlowWalkSpeed)
      ..writeByte(7)
      ..write(obj.maxWalkSpeed)
      ..writeByte(8)
      ..write(obj.maxRunSpeed)
      ..writeByte(9)
      ..write(obj.maxRideSprintSpeed)
      ..writeByte(10)
      ..write(obj.maxTransportSpeed)
      ..writeByte(11)
      ..write(obj.maxStamina);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MaxStatsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
