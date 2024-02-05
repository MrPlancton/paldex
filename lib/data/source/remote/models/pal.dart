import 'package:json_annotation/json_annotation.dart';
import 'package:paldex/data/source/remote/models/ability.dart';
import 'package:paldex/data/source/remote/models/aura.dart';
import 'package:paldex/data/source/remote/models/stats.dart';
import 'package:paldex/data/source/remote/models/suitability.dart';

part 'pal.g.dart';

@JsonSerializable()
class RemotePalModel {
  RemotePalModel(
    this.numid,
    this.id,
    this.image,
    this.name,
    this.typeofpal,
    this.imageUrl,
    this.stats,
    this.suitability,
    this.drops,
    this.aura,
    this.description,
    this.abilities,
  );

  factory RemotePalModel.fromJson(Map<String, dynamic> json) => _$RemotePalModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePalModelToJson(this);

  @JsonKey(required: true, disallowNullValue: true)
  final num numid;

  @JsonKey(required: true, disallowNullValue: true)
  final String id;

  @JsonKey(defaultValue: '')
  final String image;

  @JsonKey(required: true, disallowNullValue: true)
  final String name;

  @JsonKey(defaultValue: [])
  final List<String> typeofpal;

  @JsonKey(required: true, name: 'imageurl', disallowNullValue: true)
  final String imageUrl;

  @JsonKey()
  final RemoteStatsModel stats;

  @JsonKey(defaultValue: [])
  final List<RemoteSuitabilityModel> suitability;

  @JsonKey(defaultValue: [])
  final List<String> drops;

  @JsonKey()
  final RemoteAuraModel aura;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(defaultValue: [])
  final List<RemoteAbilityModel> abilities;
}
