import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class RemoteItemModel {
  RemoteItemModel(
    this.name,
    this.category,
    this.imageurl,
    this.effect,
  );

  factory RemoteItemModel.fromJson(Map<String, dynamic> json) => _$RemoteItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteItemModelToJson(this);

  @JsonKey(disallowNullValue: true)
  final String name;

  @JsonKey(defaultValue: '')
  final String category;

  @JsonKey(disallowNullValue: true)
  final String imageurl;

  @JsonKey(disallowNullValue: true)
  final String effect;
}
