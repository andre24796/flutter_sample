// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Issue> _$issueSerializer = new _$IssueSerializer();

class _$IssueSerializer implements StructuredSerializer<Issue> {
  @override
  final Iterable<Type> types = const [Issue, _$Issue];
  @override
  final String wireName = 'Issue';

  @override
  Iterable<Object> serialize(Serializers serializers, Issue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
      'id',
      serializers.serialize(object.issueId, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.issueTitle,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Issue deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IssueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'id':
          result.issueId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.issueTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Issue extends Issue {
  @override
  final User user;
  @override
  final int issueId;
  @override
  final String issueTitle;

  factory _$Issue([void Function(IssueBuilder) updates]) =>
      (new IssueBuilder()..update(updates)).build();

  _$Issue._({this.user, this.issueId, this.issueTitle}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('Issue', 'user');
    }
    if (issueId == null) {
      throw new BuiltValueNullFieldError('Issue', 'issueId');
    }
    if (issueTitle == null) {
      throw new BuiltValueNullFieldError('Issue', 'issueTitle');
    }
  }

  @override
  Issue rebuild(void Function(IssueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IssueBuilder toBuilder() => new IssueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Issue &&
        user == other.user &&
        issueId == other.issueId &&
        issueTitle == other.issueTitle;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, user.hashCode), issueId.hashCode), issueTitle.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Issue')
          ..add('user', user)
          ..add('issueId', issueId)
          ..add('issueTitle', issueTitle))
        .toString();
  }
}

class IssueBuilder implements Builder<Issue, IssueBuilder> {
  _$Issue _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  int _issueId;
  int get issueId => _$this._issueId;
  set issueId(int issueId) => _$this._issueId = issueId;

  String _issueTitle;
  String get issueTitle => _$this._issueTitle;
  set issueTitle(String issueTitle) => _$this._issueTitle = issueTitle;

  IssueBuilder();

  IssueBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _issueId = _$v.issueId;
      _issueTitle = _$v.issueTitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Issue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Issue;
  }

  @override
  void update(void Function(IssueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Issue build() {
    _$Issue _$result;
    try {
      _$result = _$v ??
          new _$Issue._(
              user: user.build(), issueId: issueId, issueTitle: issueTitle);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Issue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
