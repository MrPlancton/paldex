import 'package:json_annotation/json_annotation.dart';

part 'suitability.g.dart';

@JsonSerializable()
class RemoteSuitabilityModel {
  RemoteSuitabilityModel(
    this.type,
    this.level,
  );

  factory RemoteSuitabilityModel.fromJson(Map<String, dynamic> json) => _$RemoteSuitabilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSuitabilityModelToJson(this);

  @JsonKey(defaultValue: '')
  final String type;

  @JsonKey(defaultValue: 0)
  final int level;
}
