import 'package:json_annotation/json_annotation.dart';

part 'stats.g.dart';

@JsonSerializable()
class RemoteStatsModel {
  RemoteStatsModel(
    this.maleProb,
    this.femaleProb,
    this.size,
    this.price,
    this.rarity,
    this.hp,
    this.meleeAttack,
    this.shotAttack,
    this.defense,
    this.support,
    this.passive1,
    this.passive2,
    this.craftSpeed,
    this.slowWalkSpeed,
    this.walkSpeed,
    this.runSpeed,
    this.rideSprintSpeed,
    this.transportSpeed,
    this.stamina,
  );

  factory RemoteStatsModel.fromJson(Map<String, dynamic> json) => _$RemoteStatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStatsModelToJson(this);

  @JsonKey(defaultValue: '')
  final String maleProb;

  @JsonKey(defaultValue: '')
  final String femaleProb;

  @JsonKey(defaultValue: '')
  final String size;

  @JsonKey(defaultValue: '0')
  final String price;

  @JsonKey(defaultValue: '')
  final String rarity;

  @JsonKey(defaultValue: '0')
  final String hp;

  @JsonKey(defaultValue: '0')
  final String meleeAttack;

  @JsonKey(defaultValue: '0')
  final String shotAttack;

  @JsonKey(defaultValue: '0')
  final String defense;

  @JsonKey(defaultValue: '0')
  final String support;

  @JsonKey(defaultValue: '')
  final String passive1;

  @JsonKey(defaultValue: '')
  final String passive2;

  @JsonKey(defaultValue: '0')
  final String craftSpeed;

  @JsonKey(defaultValue: '0')
  final String slowWalkSpeed;

  @JsonKey(defaultValue: '0')
  final String walkSpeed;

  @JsonKey(defaultValue: '0')
  final String runSpeed;

  @JsonKey(defaultValue: '0')
  final String rideSprintSpeed;

  @JsonKey(defaultValue: '0')
  final String transportSpeed;

  @JsonKey(defaultValue: '0')
  final String stamina;
}
