// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAbilityModel _$RemoteAbilityModelFromJson(Map<String, dynamic> json) =>
    RemoteAbilityModel(
      json['level'] as int? ?? 0,
      json['name'] as String? ?? '',
      json['type'] as String? ?? '',
      json['cooldown'] as int? ?? 0,
      json['power'] as int? ?? 0,
      json['description'] as String? ?? '',
    );

Map<String, dynamic> _$RemoteAbilityModelToJson(RemoteAbilityModel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'name': instance.name,
      'type': instance.type,
      'cooldown': instance.cooldown,
      'power': instance.power,
      'description': instance.description,
    };
