import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/backend_api/api/serializers.dart';
import 'package:flutter_app/backend_api/basic/api_response.dart';
import 'package:flutter_app/backend_api/basic/http_request.dart';
import 'package:flutter_app/backend_api/models/issue.dart';
import 'package:flutter_app/utils/others.dart';

import 'backend_request.dart';

class GetIssueRequest extends BackendRequest {
  @override
  String path = '/issues';
  @override
  Options options = Options(method: HttpMethod.GET.rawValue);

  GetIssueRequest({@required String pageNumber, @required String maxPerPage}) {
    params['page'] = pageNumber;
    params['per_page'] = maxPerPage;
  }

  @override
  ApiResponse deserializeResponseData(ApiResponse response) {
    switch (response.getStatusCode) {
      case 200:
        {
          try {
            final data = json
                .decode(response.getResponse)
                .map((e) => serializers.deserializeWith(Issue.serializer, e))
                .toList();
            return ApiResponse(
                data, response.getStatusCode, response.isSuccess);
          } catch (e) {
            if (e is DeserializationError) {
              DevLog.getLogger().logError('Deserialize error: $e');
            } else {
              DevLog.getLogger().logError('Unexpected error: $e');
            }
          }
          return ApiResponse(null, response.getStatusCode, false);
        }
      default:
        {
          DevLog.getLogger().logError(
              'Status code not implemented: ${response.getStatusCode}');
          return ApiResponse(null, response.getStatusCode, false);
        }
    }
  }
}
