import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String fullName,
    required String email,
    required String password,
    required String address,
    required String type,
    required String token,

    //toekn can be added
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
