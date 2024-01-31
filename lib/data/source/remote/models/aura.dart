import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RemoteAuraModel {
  RemoteAuraModel(this.type, this.level);

  factory RemoteAuraModel.fromJson(Map<String, dynamic> json) => _$RemoteAuraModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAuraModelToJson(this);

  @JsonKey(disallowNullValue: true)
  final String type;

  @JsonKey(defaultValue: 1)
  final num level;
}
