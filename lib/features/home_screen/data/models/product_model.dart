import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final double price;
  @JsonKey(name: 'old_price')
  final double? oldPrice;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  final String? brand;
  final String condition; // 'new' | 'used'
  @JsonKey(name: 'payment_method')
  final String paymentMethod; // 'cash' | 'installments' | 'any'
  @JsonKey(name: 'is_offer')
  final int isOffer;
  @JsonKey(name: 'created_at')
  final int? createdAt;

  ProductModel({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.price,
    this.oldPrice,
    this.categoryId,
    this.brand,
    this.condition = 'new',
    this.paymentMethod = 'any',
    this.isOffer = 0,
    this.createdAt,
  });

  factory ProductModel.fromMap(Map<String, Object?> map) =>
      _$ProductModelFromJson(map);
}
