import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/backend_api/models/user.dart';

part 'issue.g.dart';

abstract class Issue implements Built<Issue, IssueBuilder> {
  User get user;

  @BuiltValueField(wireName: 'id')
  int get issueId;

  @BuiltValueField(wireName: 'title')
  String get issueTitle;

  Issue._();

  factory Issue({
    @required User user,
    @required int issueId,
    @required String issueTitle,
  }) {
    return _$Issue._(
      user: user,
      issueId: issueId,
      issueTitle: issueTitle,
    );
  }

  static Serializer<Issue> get serializer => _$issueSerializer;
}
