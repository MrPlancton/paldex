// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePalModel _$RemotePalModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['numid', 'id', 'name', 'imageurl'],
    disallowNullValues: const ['numid', 'id', 'name', 'imageurl'],
  );
  return RemotePalModel(
    json['numid'] as num,
    json['id'] as String,
    json['image'] as String? ?? '',
    json['name'] as String,
    (json['typeofpal'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    json['imageurl'] as String,
    RemoteStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
    (json['suitability'] as List<dynamic>?)
            ?.map((e) =>
                RemoteSuitabilityModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    (json['drops'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    RemoteAuraModel.fromJson(json['aura'] as Map<String, dynamic>),
    json['description'] as String? ?? '',
    (json['abilities'] as List<dynamic>?)
            ?.map((e) => RemoteAbilityModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$RemotePalModelToJson(RemotePalModel instance) =>
    <String, dynamic>{
      'numid': instance.numid,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'typeofpal': instance.typeofpal,
      'imageurl': instance.imageUrl,
      'stats': instance.stats,
      'suitability': instance.suitability,
      'drops': instance.drops,
      'aura': instance.aura,
      'description': instance.description,
      'abilities': instance.abilities,
    };
