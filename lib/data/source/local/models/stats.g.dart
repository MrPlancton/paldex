// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatsHiveModelAdapter extends TypeAdapter<StatsHiveModel> {
  @override
  final int typeId = 3;

  @override
  StatsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatsHiveModel()
      ..maleProb = fields[0] as String
      ..femaleProb = fields[1] as String
      ..size = fields[2] as String
      ..price = fields[3] as double
      ..rarity = fields[4] as String
      ..hp = fields[5] as int
      ..meleeAttack = fields[6] as int
      ..shotAttack = fields[7] as int
      ..defense = fields[8] as int
      ..support = fields[9] as int
      ..passive1 = fields[10] as String
      ..passive2 = fields[11] as String
      ..craftSpeed = fields[12] as int
      ..slowWalkSpeed = fields[13] as int
      ..walkSpeed = fields[14] as int
      ..runSpeed = fields[15] as int
      ..rideSprintSpeed = fields[16] as int
      ..transportSpeed = fields[17] as int
      ..stamina = fields[18] as int;
  }

  @override
  void write(BinaryWriter writer, StatsHiveModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.maleProb)
      ..writeByte(1)
      ..write(obj.femaleProb)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.rarity)
      ..writeByte(5)
      ..write(obj.hp)
      ..writeByte(6)
      ..write(obj.meleeAttack)
      ..writeByte(7)
      ..write(obj.shotAttack)
      ..writeByte(8)
      ..write(obj.defense)
      ..writeByte(9)
      ..write(obj.support)
      ..writeByte(10)
      ..write(obj.passive1)
      ..writeByte(11)
      ..write(obj.passive2)
      ..writeByte(12)
      ..write(obj.craftSpeed)
      ..writeByte(13)
      ..write(obj.slowWalkSpeed)
      ..writeByte(14)
      ..write(obj.walkSpeed)
      ..writeByte(15)
      ..write(obj.runSpeed)
      ..writeByte(16)
      ..write(obj.rideSprintSpeed)
      ..writeByte(17)
      ..write(obj.transportSpeed)
      ..writeByte(18)
      ..write(obj.stamina);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
