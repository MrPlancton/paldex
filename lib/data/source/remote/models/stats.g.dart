// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteStatsModel _$RemoteStatsModelFromJson(Map<String, dynamic> json) =>
    RemoteStatsModel(
      json['maleProb'] as String? ?? '',
      json['femaleProb'] as String? ?? '',
      json['size'] as String? ?? '',
      json['price'] as String? ?? '0',
      json['rarity'] as String? ?? '',
      json['hp'] as String? ?? '0',
      json['meleeAttack'] as String? ?? '0',
      json['shotAttack'] as String? ?? '0',
      json['defense'] as String? ?? '0',
      json['support'] as String? ?? '0',
      json['passive1'] as String? ?? '',
      json['passive2'] as String? ?? '',
      json['craftSpeed'] as String? ?? '0',
      json['slowWalkSpeed'] as String? ?? '0',
      json['walkSpeed'] as String? ?? '0',
      json['runSpeed'] as String? ?? '0',
      json['rideSprintSpeed'] as String? ?? '0',
      json['transportSpeed'] as String? ?? '0',
      json['stamina'] as String? ?? '0',
    );

Map<String, dynamic> _$RemoteStatsModelToJson(RemoteStatsModel instance) =>
    <String, dynamic>{
      'maleProb': instance.maleProb,
      'femaleProb': instance.femaleProb,
      'size': instance.size,
      'price': instance.price,
      'rarity': instance.rarity,
      'hp': instance.hp,
      'meleeAttack': instance.meleeAttack,
      'shotAttack': instance.shotAttack,
      'defense': instance.defense,
      'support': instance.support,
      'passive1': instance.passive1,
      'passive2': instance.passive2,
      'craftSpeed': instance.craftSpeed,
      'slowWalkSpeed': instance.slowWalkSpeed,
      'walkSpeed': instance.walkSpeed,
      'runSpeed': instance.runSpeed,
      'rideSprintSpeed': instance.rideSprintSpeed,
      'transportSpeed': instance.transportSpeed,
      'stamina': instance.stamina,
    };
