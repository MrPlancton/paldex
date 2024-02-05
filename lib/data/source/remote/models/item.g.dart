// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteItemModel _$RemoteItemModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['name', 'imageurl', 'effect'],
  );
  return RemoteItemModel(
    json['name'] as String,
    json['category'] as String? ?? '',
    json['imageurl'] as String,
    json['effect'] as String,
  );
}

Map<String, dynamic> _$RemoteItemModelToJson(RemoteItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'imageurl': instance.imageurl,
      'effect': instance.effect,
    };
