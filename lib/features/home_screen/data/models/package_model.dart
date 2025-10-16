import 'package:json_annotation/json_annotation.dart';
part 'package_model.g.dart';

@JsonSerializable()
class PackageModel {
  final int id;
  final String name;
  final double price;

  PackageModel({required this.id, required this.name, required this.price});

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);
}
