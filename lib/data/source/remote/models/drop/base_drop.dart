import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RemoteBaseDropModel {
  RemoteBaseDropModel(this.name);

  factory RemoteBaseDropModel.fromJson(Map<String, dynamic> json) => _$RemoteBaseDropModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteBaseDropModelToJson(this);

  @JsonKey(disallowNullValue: true)
  final String name;
}
