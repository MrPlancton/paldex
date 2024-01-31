import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RemoteSuitabilityModel {
  RemoteSuitabilityModel(this.type, this.level);

  factory RemoteSuitabilityModel.fromJson(Map<String, dynamic> json) => _$RemoteSuitabilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSuitabilityModelToJson(this);

  @JsonKey(disallowNullValue: true)
  final String type;

  @JsonKey(defaultValue: 1)
  final num level;
}
