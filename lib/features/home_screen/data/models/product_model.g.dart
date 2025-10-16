// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  imageUrl: json['image_url'] as String?,
  price: (json['price'] as num).toDouble(),
  oldPrice: (json['old_price'] as num?)?.toDouble(),
  categoryId: (json['category_id'] as num?)?.toInt(),
  brand: json['brand'] as String?,
  condition: json['condition'] as String? ?? 'new',
  paymentMethod: json['payment_method'] as String? ?? 'any',
  isOffer: (json['is_offer'] as num?)?.toInt() ?? 0,
  createdAt: (json['created_at'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'category_id': instance.categoryId,
      'brand': instance.brand,
      'condition': instance.condition,
      'payment_method': instance.paymentMethod,
      'is_offer': instance.isOffer,
      'created_at': instance.createdAt,
    };
