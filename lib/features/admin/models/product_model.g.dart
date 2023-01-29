// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      category: json['category'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'category': instance.category,
      'images': instance.images,
      '_id': instance.id,
    };
