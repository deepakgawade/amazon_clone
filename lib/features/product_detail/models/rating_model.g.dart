// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Rating _$$_RatingFromJson(Map<String, dynamic> json) => _$_Rating(
      rating: (json['rating'] as num).toDouble(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$_RatingToJson(_$_Rating instance) => <String, dynamic>{
      'rating': instance.rating,
      'userId': instance.userId,
    };
