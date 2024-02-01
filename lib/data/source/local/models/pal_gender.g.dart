// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pal_gender.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PalGenderHiveModelAdapter extends TypeAdapter<PalGenderHiveModel> {
  @override
  final int typeId = 2;

  @override
  PalGenderHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PalGenderHiveModel()
      ..genderless = fields[0] as bool
      ..male = fields[1] as double
      ..female = fields[2] as double;
  }

  @override
  void write(BinaryWriter writer, PalGenderHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.genderless)
      ..writeByte(1)
      ..write(obj.male)
      ..writeByte(2)
      ..write(obj.female);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PalGenderHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
