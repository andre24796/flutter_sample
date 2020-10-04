import 'package:flutter_app/backend_api/basic/http_request.dart';

class BackendRequest extends HttpRequest {
  @override
  String baseUrl = 'https://api.github.com/repos/flutter/flutter';
}
