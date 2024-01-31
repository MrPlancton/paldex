import 'package:json_annotation/json_annotation.dart';
import 'package:paldex/data/source/remote/models/aura.dart';
import 'package:paldex/data/source/remote/models/drop/base_drop.dart';
import 'package:paldex/data/source/remote/models/skill.dart';
import 'package:paldex/data/source/remote/models/suitability.dart';

@JsonSerializable()
class RemotePalModel {
  RemotePalModel(
    this.id,
    this.key,
    this.image,
    this.name,
    this.wiki,
    this.types,
    this.icon,
    this.suitability,
    this.drops,
    this.aura,
    this.description,
    this.skills,
  );

  factory RemotePalModel.fromJson(Map<String, dynamic> json) => _$RemotePalModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePalModelToJson(this);

  @JsonKey(required: true, disallowNullValue: true)
  final num id;

  @JsonKey(required: true, disallowNullValue: true)
  final String key;

  @JsonKey(required: true, disallowNullValue: true)
  final String image;

  @JsonKey(required: true, disallowNullValue: true)
  final String name;

  @JsonKey(defaultValue: '')
  final String wiki;

  @JsonKey(defaultValue: [])
  final List<String> types;

  @JsonKey(defaultValue: '')
  final String icon;

  @JsonKey(defaultValue: [])
  final List<RemoteSuitabilityModel> suitability;

  @JsonKey(defaultValue: [])
  final List<RemoteBaseDropModel> drops;

  @JsonKey()
  final RemoteAuraModel aura;

  @JsonKey(defaultValue: [])
  final List<RemoteSkillModel> skills;

  @JsonKey(defaultValue: '')
  final String description;
}
