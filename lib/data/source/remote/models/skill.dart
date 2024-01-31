import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RemoteSkillModel {
  RemoteSkillModel(
    this.level,
    this.name,
    this.type,
    this.cooldown,
    this.power,
    this.description,
  );

  factory RemoteSkillModel.fromJson(Map<String, dynamic> json) => _$RemoteSkillModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSkillModelToJson(this);

  @JsonKey(defaultValue: 1)
  final num level;

  @JsonKey(disallowNullValue: true)
  final String name;

  @JsonKey(disallowNullValue: true)
  final String type;

  @JsonKey(defaultValue: 1)
  final num cooldown;

  @JsonKey(defaultValue: 1)
  final num power;

  @JsonKey(defaultValue: '')
  final String description;
}
