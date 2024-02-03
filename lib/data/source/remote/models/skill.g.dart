// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSkillModel _$RemoteSkillModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'level', 'type'],
    disallowNullValues: const ['name', 'level', 'type'],
  );
  return RemoteSkillModel(
    json['name'] as String,
    json['level'] as num,
    json['type'] as String,
    json['cooldown'] as num? ?? 0,
    json['power'] as num? ?? 0,
    json['description'] as String? ?? '',
  );
}

Map<String, dynamic> _$RemoteSkillModelToJson(RemoteSkillModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'type': instance.type,
      'cooldown': instance.cooldown,
      'power': instance.power,
      'description': instance.description,
    };
