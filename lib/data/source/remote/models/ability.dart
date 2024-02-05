import 'package:json_annotation/json_annotation.dart';

part 'ability.g.dart';

@JsonSerializable()
class RemoteAbilityModel {
  RemoteAbilityModel(
    this.level,
    this.name,
    this.type,
    this.cooldown,
    this.power,
    this.description,
  );

  factory RemoteAbilityModel.fromJson(Map<String, dynamic> json) => _$RemoteAbilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAbilityModelToJson(this);

  @JsonKey(defaultValue: 0)
  final int level;

  @JsonKey(defaultValue: '')
  final String name;

  @JsonKey(defaultValue: '')
  final String type;

  @JsonKey(defaultValue: 0)
  final int cooldown;

  @JsonKey(defaultValue: 0)
  final int power;

  @JsonKey(defaultValue: '')
  final String description;
}
