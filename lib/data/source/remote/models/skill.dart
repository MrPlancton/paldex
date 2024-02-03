import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable()
class RemoteSkillModel {
  RemoteSkillModel(
    this.name,
    this.level,
    this.type,
    this.cooldown,
    this.power,
    this.description,
  );

  factory RemoteSkillModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteSkillModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSkillModelToJson(this);

  @JsonKey(required: true, disallowNullValue: true)
  final String name;

  @JsonKey(required: true, disallowNullValue: true)
  final num level;

  @JsonKey(required: true, disallowNullValue: true)
  final String type;

  @JsonKey(defaultValue: 0)
  final num cooldown;

  @JsonKey(defaultValue: 0)
  final num power;

  @JsonKey(defaultValue: '')
  final String description;

}
