import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  @JsonKey(name: 'parent_id')
  final int? parentId;

  CategoryModel({
    required this.id,
    required this.name,
    this.iconUrl,
    this.parentId,
  });

  factory CategoryModel.fromMap(Map<String, Object?> map) =>
      _$CategoryModelFromJson(map);
}
