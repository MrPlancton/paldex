// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PalHiveModelAdapter extends TypeAdapter<PalHiveModel> {
  @override
  final int typeId = 1;

  @override
  PalHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PalHiveModel()
      ..numid = fields[0] as num
      ..id = fields[1] as String
      ..image = fields[2] as String
      ..name = fields[3] as String
      ..typeofpal = (fields[4] as List).cast<String>()
      ..imageUrl = fields[5] as String
      ..stats = fields[6] as StatsHiveModel
      ..suitability = (fields[7] as List).cast<SuitabilityHiveModel>()
      ..drops = (fields[8] as List).cast<String>()
      ..aura = fields[9] as AuraHiveModel
      ..description = fields[10] as String
      ..abilities = (fields[11] as List).cast<AbilityHiveModel>();
  }

  @override
  void write(BinaryWriter writer, PalHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.numid)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.typeofpal)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.stats)
      ..writeByte(7)
      ..write(obj.suitability)
      ..writeByte(8)
      ..write(obj.drops)
      ..writeByte(9)
      ..write(obj.aura)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.abilities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PalHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
