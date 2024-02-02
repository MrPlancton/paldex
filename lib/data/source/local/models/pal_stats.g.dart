// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pal_stats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PalStatsHiveModelAdapter extends TypeAdapter<PalStatsHiveModel> {
  @override
  final int typeId = 3;

  @override
  PalStatsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PalStatsHiveModel()
      ..attack = fields[0] as int
      ..specialAttack = fields[1] as int
      ..defense = fields[2] as int
      ..specialDefense = fields[3] as int
      ..hp = fields[4] as int
      ..speed = fields[5] as int;
  }

  @override
  void write(BinaryWriter writer, PalStatsHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.attack)
      ..writeByte(1)
      ..write(obj.specialAttack)
      ..writeByte(2)
      ..write(obj.defense)
      ..writeByte(3)
      ..write(obj.specialDefense)
      ..writeByte(4)
      ..write(obj.hp)
      ..writeByte(5)
      ..write(obj.speed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PalStatsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}