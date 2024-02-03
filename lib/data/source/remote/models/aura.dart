import 'package:json_annotation/json_annotation.dart';

part 'aura.g.dart';

@JsonSerializable()
class RemoteAuraModel {
  RemoteAuraModel(
    this.name,
    this.description,
  );

  factory RemoteAuraModel.fromJson(Map<String, dynamic> json) => _$RemoteAuraModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAuraModelToJson(this);

  @JsonKey(defaultValue: '')
  final String name;

  @JsonKey(defaultValue: '')
  final String description;
}
