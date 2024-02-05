// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suitability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSuitabilityModel _$RemoteSuitabilityModelFromJson(
        Map<String, dynamic> json) =>
    RemoteSuitabilityModel(
      json['type'] as String? ?? '',
      json['level'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteSuitabilityModelToJson(
        RemoteSuitabilityModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'level': instance.level,
    };
