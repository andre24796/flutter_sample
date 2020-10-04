import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  @BuiltValueField(wireName: 'avatar_url')
  String get avatarUrl;

  User._();

  factory User({
    @required String avatarUrl,
  }) {
    return _$User._(
      avatarUrl: avatarUrl,
    );
  }

  static Serializer<User> get serializer => _$userSerializer;
}
