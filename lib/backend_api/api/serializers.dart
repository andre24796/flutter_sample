import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_app/backend_api/models/issue.dart';
import 'package:flutter_app/backend_api/models/user.dart';

part 'serializers.g.dart';

@SerializersFor(const [Issue])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
