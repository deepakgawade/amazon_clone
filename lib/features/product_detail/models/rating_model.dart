import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_model.freezed.dart';

part 'rating_model.g.dart';

@freezed
class Rating with _$Rating {
  const factory Rating({
    required double rating,
    required String userId,
  }) = _Rating;

  factory Rating.fromJson(Map<String, Object?> json) => _$RatingFromJson(json);
}
